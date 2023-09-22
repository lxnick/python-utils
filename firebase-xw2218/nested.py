# --- Python Code to test XW2218

# --- Import XW2218
from BaseXW2218 import *

import sys

XW2218_PHOTO = "xw2218-h1-v1-photo"
XW2218_NODE  = "xw2218-h1-v1-node"
XW2218_AUDIO = "xw2218-h1-v1-audio"


print('----->')
#id_list = list()
#ate_dict = dict()
#mac_dict = dict()

#id_list.append('one')
#id_list.append('two')
#id_list.append('three')

date = '20221212'
mac = '11223344'
id = {'1','2','1','2','3','1','4','5'}

table = dict()

for number in id:
    if mac in table.keys():
        if date in table[mac].keys():
            table[mac][date].append(number)
        else:
            id_list = list()
            id_list.append(number)
            table[mac][date] = id_list
    else:
        id_list = list()
        date_dict = dict()
        id_list.append(number)
        date_dict[date] = id_list  
        table[mac] = date_dict


print(table)
