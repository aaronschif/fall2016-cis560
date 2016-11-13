
from setuptools import setup, find_packages

setup(
    name='wowdb',
    packages=find_packages(),
    install_requires=[],
    entry_points={
        'console_scripts': [
            'wowdb_server = wowdb.main:main',
        ]
    }
)
