import aiohttp_jinja2
import aiohttp_session

from ..sql import cursor


@aiohttp_jinja2.template('login.html')
async def login_handler(request):
    session = await aiohttp_session.get_session(request)

    if request.method == 'GET':
        return {}
    data = await request.post()

    with cursor() as cur:
        cur.execute('select * from "user" where "user".username = %s ', [data['username']])
        user = cur.fetchone()
        if user is not None:
            id, username, password = user
            print(username, password)
            if password == data['password']:
                session['username'] = username
            else:
                return {'error': 'Password is incorrect.', 'username': username}
        else:
            return {'error': 'No user with that name.'}

    return {}


@aiohttp_jinja2.template('registar.html')
async def registar_handler(request):
    return
