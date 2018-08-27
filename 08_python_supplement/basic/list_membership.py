database = [
    ['kim','1234'],
    ['lee','1234'],
    ['park','1234'],
    ['jung','1234']
]

username = input('User name: ')
password = input('password: ')

if [username, password] in database: 
    print('Access granted')