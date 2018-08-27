people = {
      'Kim':{
            'phone':'1234',
            'addr':'seoul'
            },
      'Lee':{
            'phone':'5678',
            'addr':'pusan'
            },
      'Park':{
            'phone':'9090',
            'addr':'guro'
            },
      }


labels = {
      'phone':'phone number',
      'addr':'address'
      }
name = input('Name: ')
request = input('Phone number (p) or address (a)? ')

key = request
if request == 'p': key='phone'
if request == 'a': key='addr'

person = people.get(name,{})
label=labels.get(key, key)
result=person.get(key,'not available')

print("%s's %s is %s." % (name, label, result))
      
