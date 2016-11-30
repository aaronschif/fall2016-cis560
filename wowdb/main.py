from pathlib import Path

import cherrypy
from jinja2 import Environment, PackageLoader

from .sql import cursor

env = Environment(loader=PackageLoader(__package__, 'templates'))


class Root:
    @cherrypy.expose
    def index(self, search=""):
        with cursor() as cur:
            cur.execute("select * from gear where gear.name ilike '%%'||%s||'%%'", [search])
            gears = cur.fetchall()
        tmpl = env.get_template('index.html')
        return tmpl.render(gears=gears)

conf = {'/static': {
    'tools.staticdir.on': True,
    'tools.staticdir.dir': str(Path(__file__).parent/'static'),
    'tools.staticdir.content_types': {
        'rss': 'application/xml',
        'atom': 'application/atom+xml'}}}


def main():
    cherrypy.quickstart(Root(), config=conf)
