import sys
import time

python_version = int(str(sys.version_info[0]) + str(sys.version_info[1]))
if python_version < 36:
    print('\nYou are using a lower version of Python, please use Python 3.6 or higher.')
    time.sleep(10)
    quit()

import configparser
import requests

timestamp = f'%B %d %Y at %I:%M:%S %p'

while True:
    config = configparser.ConfigParser()
    config.read('config.ini')
    for domains in config.sections():
        try:
            username = config[domains]["username"]
            password = config[domains]["password"]
            hostname = config[domains]["hostname"]
            response = requests.post(f'https://{username}:{password}@domains.google.com/nic/update?hostname={hostname}')
            output = response.content.decode('utf-8')
            print(f'\n[{domains} - Response]\nStatus Code: {response.status_code}\nContent: {output}\nHostname: {hostname}\nTimestamp: {time.strftime(timestamp)}')
        except Exception as error:
            print(f'\n[{domains} - Error]\n{error}')
    time.sleep(300)
