import cherrypy
import psycopg2
from jinja2 import Environment, PackageLoader

from .sql import create_tables

env = Environment(loader=PackageLoader(__package__, 'templates'))

class Root:
    @cherrypy.expose
    def index(self):
        tmpl = env.get_template('index.html')
        return tmpl.render(salutation='Hello', target='World')


# cherrypy.quickstart(Root())
if __name__ == '__main__':
    create_tables()
