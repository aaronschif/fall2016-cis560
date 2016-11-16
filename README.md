

# Quick Start
- Get python3.5
- Run `python -m venv .python-venv` to create the virtualenv
- Activate the venv https://docs.python.org/3/library/venv.html
- Run `pip install -r requirements.txt`
- If this is a new database, run `python -m wowdb.bootstrap`
- Run `python -m wowdb`

# Easy-peasy postgres server on your local machine.
- Run `sudo apt install docker.io` to install docker.
- Log out and log in (to reset your groups) or just use sudo on the next command
- Run `docker run --net=host --rm postgres`. This will download and run a postgres server.
  Hit CTRL-C to exit. Exiting will remove all the data.

Docker is fancy linux tech, and will only run on linux. You might find an emulator
for windows, but I am not sure it will work well with networks.
