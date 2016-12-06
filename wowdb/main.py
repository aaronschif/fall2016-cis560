from pathlib import Path
from collections import namedtuple

from aiohttp import web
import aiohttp_jinja2
import jinja2
import base64
import aiohttp_session
from aiohttp_session import setup
from aiohttp_session.cookie_storage import EncryptedCookieStorage

from .sql import cursor
from .views.admin import login_handler


@aiohttp_jinja2.template('index.html')
async def handle(request):
    with cursor() as cur:
        search = request.GET.get('search', '')
        tradable = request.GET.get('tradable', 'Both')
        slot = request.GET.get('slot', 'ANY')
        pstats = request.GET.getall('primary_stat', [])
        sstats = request.GET.getall('secondary_stat', [])
        pmin = request.GET.get('p_minimum', 1)
        pmax = request.GET.get('p_maximum', 10000)
        smin = request.GET.get('s_minimum', 1)
        smax = request.GET.get('s_maximum', 10000)
        mat = request.GET.get('materials', 'ANY')
        pr_min = request.GET.get('price_min', 0)
        pr_max = request.GET.get('price_max', 999999999)

        dungeon = request.GET.get('dungeon', 'ANY')
        raid = request.GET.get('raid', 'ANY')
        vendor = request.GET.get('vendor', '')
        boss = request.GET.get('boss', '')

        # if vendor != 'ANY':
        s = """select g.*, concat_ws(' ', v.first_name, v.surname) as full_name, d.dungeon_name as Dungeon, b.name as Boss, r.raid_name as Raid from gear g\
        left join vendor_gear vg on vg.gear_id = g.id left join vendor v on v.id = vg.vendor_id left join boss_gear bg on g.id = bg.gear_id\
        left join bosses b on b.boss_id = bg.boss_id \
        left join boss_dungeon bd on bd.boss_id = b.boss_id left join dungeon d on d.id = bd.dungeon_id\
        left join boss_raid br on br.boss_id = b.boss_id left join raid r on r.id = br.raid_id"""  # """ _ """ is 'superscaping' and allows for multi-line strings
        # else:
        #    s = "select * from gear g"
        # s += " left join boss_dungeon bd on bd.boss_id = b.boss_id left join dungeon d on d.id = bd.dungeon_id "

        s += " where g.name ilike '%%'||%s||'%%'"
        l = [search]

        if vendor != '':
            s += " AND concat_ws(' ', v.first_name, v.surname) ilike '%%'||%s||'%%'"
            l.append(vendor)

        if raid != 'ANY':
            s += " AND r.raid_name ilike '%%'||%s||'%%'"
            l.append(raid)

        if dungeon != 'ANY':
            s += " AND d.dungeon_name ilike '%%'||%s||'%%'"
            l.append(dungeon)

        if boss != '':
            s += " AND b.name ilike '%%'||%s||'%%'"
            l.append(boss)

        if tradable != 'Both':
            tradable = tradable == 'True'
            s += " AND g.tradable is %s"
            l.append(tradable)

        if slot != 'ANY':
            s += " AND g.slot ilike '%%'||%s||'%%'"
            l.append(slot)

        for pstat in pstats:
            s += " AND g.primary_stat ilike '%%'||%s||'%%'"
            l.append(pstat)

        s += " AND (g.primary_stat_val >= %s"
        l.append(pmin)
        s += " AND g.primary_stat_val <= %s)"
        l.append(pmax)

        s += " AND (g.sec_stat_1_val >= %s"
        l.append(smin)
        s += " AND g.sec_stat_1_val <= %s)"
        l.append(smax)

        s += " AND (g.sec_stat_2_val >= %s"
        l.append(smin)
        s += " AND g.sec_stat_2_val <= %s)"
        l.append(smax)

        if not len(sstats) is 0:
            s += " AND ( false "
            for sstat in sstats:
                s += " OR g.secondary_stat_1 ilike '%%'||%s||'%%'"
                l.append(sstat)
                s += " OR g.secondary_stat_2 ilike '%%'||%s||'%%'"
                l.append(sstat)
            s += " )"
        if mat != 'ANY':
            s += " AND g.material ilike '%%'||%s||'%%'"
            l.append(mat)

        if int(pr_min) > 0:
            s += " AND g.price >= %s"
            l.append(pr_min)

            s += " AND g.price <= %s"
            l.append(pr_max)

        # s += " group by d.dungeon_name"
        # s += " distinct"
        # s += ";"

        cur.execute(s, l)
        print(cur.query)
        gears = cur.fetchall()
    return dict(gears=gears)


@aiohttp_jinja2.template('gear_detail.html')
async def handle_gear_detail(request):
    session = await aiohttp_session.get_session(request)
    id = request.match_info.get('id', 0)
    with cursor() as cur:
        cur.execute("select * from gear where gear.id = %s", [id])
        gear = cur.fetchone()

        if request.method == 'POST':
            data = await request.post()
            cur.execute("select * from \"user\" where \"user\".username = %s", [session.get('username')])
            user = cur.fetchone()
            if user is None:
                raise Exception('User does not exist.')
            cur.execute(
                '''insert into comment("user", gear, comment) values (%s, %s, %s)''',
                [user[0], id, data['comment']])

    Comment = namedtuple('Comment', ['username', 'comment', 'timestamp'])

    with cursor() as cur:
        cur.execute('''
            select
                "user".username, comment.comment, comment.commented
            from comment join "user" on "user".id = comment."user" where comment.gear = %s
        ''', [id])
        comments = map(lambda e: Comment(*e), cur.fetchall())

    return dict(comments=comments, detail=gear, username=session.get('username'))


app = web.Application(debug=True)
setup(app, EncryptedCookieStorage(
    base64.urlsafe_b64decode(b'zhB4hwnEjajcNSxk8LmHs4O7tu0__tb-1pZqiXmyExc=')))
app.router.add_get('/', handle)
app.router.add_get('/login', login_handler)
app.router.add_post('/login', login_handler)
app.router.add_get(r'/gear/{id:\d+}', handle_gear_detail)
app.router.add_post(r'/gear/{id:\d+}', handle_gear_detail)
app.router.add_static('/static/', path=str(Path(__file__).parent/'static'), name='static')
aiohttp_jinja2.setup(
    app, loader=jinja2.PackageLoader('wowdb', 'templates'))


def main():
    web.run_app(app)
