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

        where_statements = []
        where_statements.append("gear.name ilike '%%'||%(search)s||'%%'")

        if tradable != 'Both':
            tradable = tradable == 'True'
            where_statements.append("gear.tradable is %(tradable)s")

        if slot != 'ANY':
            where_statements.append("lower(gear.slot) = %(slot)s")

        cur.execute(
            "select * from gear where " + " and ".join(where_statements),
            {
                'search': search,
                'tradable': tradable,
                'slot': slot,
            })
        gears = cur.fetchall()
    return dict(gears=gears)


app = web.Application(debug=True)
app.router.add_get('/', handle)
app.router.add_static('/static/', path=str(Path(__file__).parent/'static'), name='static')
aiohttp_jinja2.setup(
    app, loader=jinja2.PackageLoader('wowdb', 'templates'))


def main():
    web.run_app(app)
