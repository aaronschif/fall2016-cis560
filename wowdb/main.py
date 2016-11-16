from pathlib import Path

import cherrypy
from jinja2 import Environment, PackageLoader

from .sql import create_tables

env = Environment(loader=PackageLoader(__package__, 'templates'))


class Root:
    @cherrypy.expose
    def index(self):
        tmpl = env.get_template('index.html')
        return tmpl.render(salutation='Hello', target='World')

conf = {'/static': {
    'tools.staticdir.on': True,
    'tools.staticdir.dir': str(Path(__file__).parent/'static'),
    'tools.staticdir.content_types': {
        'rss': 'application/xml',
        'atom': 'application/atom+xml'}}}


def main():
    create_tables()
    cherrypy.quickstart(Root(), config=conf)
