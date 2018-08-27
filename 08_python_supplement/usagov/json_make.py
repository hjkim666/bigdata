import json

json_string = """
{
 "name":"kim",
 "address":"seoul",
 "items":[
         {"id":"1111","itemname":"python_book"},
         {"id":"2222","itemname":"guard of python"}
        ],
"bill":
         {"id":"card1", "cardno":"1234-5678-9011-1234"},
}
"""
y = eval(json_string)
data = json.dump(y, open("customer.json","w"))
