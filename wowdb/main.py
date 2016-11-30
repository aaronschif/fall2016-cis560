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
        if slot == 'ANY':
            if tradable == 'Both':
                cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%'", [search])
            else:
                tradable = tradable == 'True'
                cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.tradable is %s", [search, tradable])
        else:
            if tradable == 'Both':
                cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.slot ilike '%%'||%s||'%%'", [search, slot])
            else:
                tradable = tradable == 'True'
                cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%' AND gear.tradable is %s AND gear.slot ilike '%%'||%s||'%%'", [search, tradable, slot])
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
