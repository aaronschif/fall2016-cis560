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

    if 'register' in data:
        with cursor() as cur:
            cur.execute('select * from "user" where "user".username = %s ', [data['username']])
            user = cur.fetchone()
            if user is not None:
                return {'error': 'User exists'}
            else:
                with cursor() as cur:
                    cur.execute(
                        'insert into "user" (id, username, password) values (default, %s, %s)',
                        [data['username'], data['password']])
                    session['username'] = data['username']

                    return {'error': 'User created.'}

    if user is not None:
        id, username, password = user
        if password == data['password']:
            session['username'] = username
        else:
            return {'error': 'Password is incorrect.', 'username': username}
    else:
        return {'error': 'No user with that name.'}

    return {}
