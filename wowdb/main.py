from pathlib import Path

from aiohttp import web
import aiohttp_jinja2
import jinja2

from .sql import cursor


@aiohttp_jinja2.template('index.html')
async def handle(request):
    with cursor() as cur:
        search = request.GET.get('search', '')
        tradable = request.GET.get('tradable', 'Both')
        slot = request.GET.get('slot', 'ANY')
        pstat = request.GET.get('primary_stat', 'ANY')
        sstat = request.GET.get('secondary_stat', 'ANY')
        pmin = request.GET.get('p_minimum', 1)
        pmax = request.GET.get('p_maximum', 10000)
        smax = request.GET.get('s_minimum', 1)
        smin = request.GET.get('s_maximum', 10000)

        s = "select * from gear where gear.name ilike '%%'||%s||'%%'"
        l = [search]

        if tradable != 'Both':
            tradable = tradable == 'True'
            s += " AND gear.tradable is %s"
            l.append(tradable)

        if slot != 'ANY':
            s += " AND gear.slot ilike '%%'||%s||'%%'"
            l.append(slot)

        # pstat does not work if there is more than one stat chosen... How do I fix this? (RCL)
        if pstat != 'ANY':
            s += " AND gear.primary_stat ilike '%%'||%s||'%%'"
            l.append(pstat)

        s += " AND gear.primary_stat_val >= %s"
        l.append(pmin)

        s += " AND gear.primary_stat_val <= %s"
        l.append(pmax)

        # Don't think this one works... HELP
        # if sstat != 'ANY':
        #    s += " AND (gear.secondary_stat_1 ilike '%%'||%s||'%%'"
        #    l.append(sstat)
        #    s += " OR gear.secondary_stat_2 ilike '%%'||%s||'%%')"
        #    l.append(sstat)

        # s += " AND gear.sec_stat_1_val >= %s"
        # l.append(smin)

        #    s += " AND gear.sec_stat_1_val <= %d)"
        #    l.append(smax)

        #    s += " AND gear.sec_stat_2_val >= %d"
        #    l.append(smin)

        #    s += " AND gear.sec_stat_2_val <= %d"
        #    l.append(smax)

        cur.execute(s, l)

        #if slot == 'ANY':
        #    if tradable == 'Both':
        #        cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%'", [search])
        #    else:
        #        tradable = tradable == 'True'
        #        cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.tradable is %s", [search, tradable])
        #else:
        #    if tradable == 'Both':
        #        cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.slot ilike '%%'||%s||'%%'", [search, slot])
        #    else:
        #        tradable = tradable == 'True'
        #        cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.tradable is %s AND gear.slot ilike '%%'||%s||'%%'", [search, tradable, slot])
        #cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%'", [search])
        gears = cur.fetchall()
    return dict(gears=gears)


app = web.Application(debug=True)
app.router.add_get('/', handle)
app.router.add_static('/static/', path=str(Path(__file__).parent/'static'), name='static')
aiohttp_jinja2.setup(
    app, loader=jinja2.PackageLoader('wowdb', 'templates'))


def main():
    web.run_app(app)
