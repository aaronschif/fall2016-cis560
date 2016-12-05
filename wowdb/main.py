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
from .views.admin import login_handler, registar_handler


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

        s = "select * from gear where gear.name ilike '%%'||%s||'%%'"
        l = [search]

        if tradable != 'Both':
            tradable = tradable == 'True'
            s += " AND gear.tradable is %s"
            l.append(tradable)

        if slot != 'ANY':
            s += " AND gear.slot ilike '%%'||%s||'%%'"
            l.append(slot)

        for pstat in pstats:
            s += " AND gear.primary_stat ilike '%%'||%s||'%%'"
            l.append(pstat)

        s += " AND (gear.primary_stat_val >= %s"
        l.append(pmin)
        s += " AND gear.primary_stat_val <= %s)"
        l.append(pmax)

        s += " AND (gear.sec_stat_1_val >= %s"
        l.append(smin)
        s += " AND gear.sec_stat_1_val <= %s)"
        l.append(smax)

        s += " AND (gear.sec_stat_2_val >= %s"
        l.append(smin)
        s += " AND gear.sec_stat_2_val <= %s)"
        l.append(smax)

        if not len(sstats) is 0:
            s += " AND ( false "
            for sstat in sstats:
                s += " OR gear.secondary_stat_1 ilike '%%'||%s||'%%'"
                l.append(sstat)
                s += " OR gear.secondary_stat_2 ilike '%%'||%s||'%%'"
                l.append(sstat)
            s += " )"
        if mat != 'ANY':
            s += " AND gear.material ilike '%%'||%s||'%%'"
            l.append(mat)

        if int(pr_min) > 0:
            s += " AND gear.price >= %s"
            l.append(pr_min)

            s += " AND gear.price <= %s"
            l.append(pr_max)

        cur.execute(s, l)
        # print(cur.query)
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
app.router.add_get('/registar', registar_handler)
app.router.add_post('/registar', registar_handler)
app.router.add_get(r'/gear/{id:\d+}', handle_gear_detail)
app.router.add_post(r'/gear/{id:\d+}', handle_gear_detail)
app.router.add_static('/static/', path=str(Path(__file__).parent/'static'), name='static')
aiohttp_jinja2.setup(
    app, loader=jinja2.PackageLoader('wowdb', 'templates'))


def main():
    web.run_app(app)
