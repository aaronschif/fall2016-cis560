import aiohttp_jinja2
import aiohttp_session

from ..sql import cursor


@aiohttp_jinja2.template('login.html')
async def login_handler(request):
    session = await aiohttp_session.get_session(request)
    context = {'session': session}

    if request.method == 'GET':
        return context
    data = await request.post()

    with cursor() as cur:
        cur.execute('select * from "user" where "user".username = %s ', [data['username']])
        user = cur.fetchone()

    if 'register' in data:
        with cursor() as cur:
            cur.execute('select * from "user" where "user".username = %s ', [data['username']])
            user = cur.fetchone()
            if user is not None:
                context['error'] = 'User exists'
            else:
                with cursor() as cur:
                    cur.execute(
                        'insert into "user" (id, username, password) values (default, %s, %s)',
                        [data['username'], data['password']])
                    session['username'] = data['username']

                    context['error'] = 'User created.'
    else:
        if user is not None:
            id, username, password = user
            if password == data['password']:
                session['username'] = username
            else:
                context['error'] = 'Password is incorrect.'
        else:
            context['error'] = 'No user with that name.'

    return context
