from pathlib import Path

from aiohttp import web
import aiohttp_jinja2
import jinja2

from .sql import cursor


@aiohttp_jinja2.template('index.html')
async def handle(request):
    with cursor() as cur:
        search = request.GET.get('search')
        cur.execute(
            "select * from gear where gear.name ilike '%%'||%s||'%%'", [search])
        gears = cur.fetchall()
    return dict(gears=gears)


app = web.Application(debug=True)
app.router.add_get('/', handle)
app.router.add_static('/static/', path=str(Path(__file__).parent/'static'), name='static')
aiohttp_jinja2.setup(
    app, loader=jinja2.PackageLoader('wowdb', 'templates'))


def main():
    web.run_app(app)
