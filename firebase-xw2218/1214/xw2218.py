# --- Python Code to test XW2218

# --- Import XW2218
from BaseXW2218 import *

import sys

XW2218_PHOTO = "xw2218-h1-v1-photo"
XW2218_NODE  = "xw2218-h1-v1-node"
XW2218_AUDIO = "xw2218-h1-v1-audio"

Action = ['list', 'summary', 'delete', 'download']
Folder = ['photo', 'audio', 'node']  
Field = ['mac', 'date', 'none']  
Compare = ['=', '>', '<', 'none']  
Value = ['none']

# --- Parse Parameter
def parseParameter():
    #[0] xw2218.py
    #[1] list, summary, delete, download
    #[2] photo, audio, node 
    #[3] mac, date, none 
    #[4] =, >, <, none  
    #[5] {mac}, {date}, none
    action = Action[0]
    folder = Folder[2]
    field = Field[2]
    compare = Compare[3]
    value = Value[0]

    if ( len(sys.argv) > 5 ):
        value = sys.argv[5]

    if ( len(sys.argv) > 4 ):
        compare = sys.argv[4]

    if ( len(sys.argv) > 3 ):
        field = sys.argv[3]

    if ( len(sys.argv) > 2 ):
        folder = sys.argv[2]

    if ( len(sys.argv) > 1 ):
        action = sys.argv[1]

    return action, folder, field, compare, value

# --- List record ? 
def action_list(folder,field, compare, value):
    print('LIST {folder} {field} {compare} {value}'.format(folder=folder,field=field,compare=compare,value=value))

# --- Summary record status 
def action_summary(folder,field, compare, value):
    client = login()
    collection = client.collection( folder).get()
    count = count_collection( collection)
    print('{count} items found in {folder}'.format(count = count, folder=folder))
    collection = filter(collection, field, compare, value) 
    count = count_collection( collection)
    print('{count} filtered by {field} {compare} {value}'.format(count = count, field=field,compare=compare,value=value))
    summary( collection)

# --- Delete specified record 
def action_delete(folder,field, compare, value):
    print('DELETE {folder} {field} {compare} {value}'.format(folder=folder,field=field,compare=compare,value=value))

def action_download(folder,field, compare, value):
    print('DOWNLOAD {folder} {field} {compare} {value}'.format(folder=folder,field=field,compare=compare,value=value))

action_dispatch = {
    'list':     action_list,
    'summary':  action_summary,
    'delete':   action_delete,
    'download': action_download,
}

folder_map = {
    'photo':    XW2218_PHOTO,
    'node':     XW2218_NODE,
    'audio':    XW2218_AUDIO,
}

# --- Dispach Command
def dispachCommand(action, folder, field, compare, value):

    if (action not in action_dispatch):
        print('Action {action} not supported'.format(action=action))
        return 

    if (folder not in folder_map):
        print('Folder {folder} not available'.format(folder=folder))
        return 

    if (field not in Field):
        print('Field {field} not resolved'.format(field=field))
        return 

    if (compare not in Compare):
        print('Compare {compare} not resolved'.format(compare=compare))
        return 

    action_dispatch[action](folder_map[folder], field, compare, value)


def summary( collection ):
    mac_dict = dict()
    date_dict = dict()

    for item in collection:
        result = parse_id( item.id)

        if result == None :
            continue;

        mac = result[0]
        date = result[1].date()

        if mac in mac_dict:
            mac_dict[ mac ] +=1
        else:
            mac_dict[ mac ] =1

        if date in date_dict:
            date_dict[ date ] +=1
        else:
            date_dict[ date ] =1

#    print('nodes by mac:')
#    for i, (m, c) in enumerate( mac_dict.items()):
#        print('[{index}] MAC[{mac}] count {count}'.format(index=i, mac = m, count=c))       

#    print('Summary by mac:')
#    for i in sorted( mac_dict.keys()):
#        print('[{index}] MAC[{mac}] count {count}'.format(index=i, mac = i, count=mac_dict[i]))

    print('Summary by MAC:')
    index = 0
    for key in sorted( mac_dict.keys()):
        print('[{index}] MAC[{mac}] count {count}'.format(index=index, mac = key, count=mac_dict[key]))
        index = index + 1


#    print('nodes by date:')
#    for i, (d, c) in enumerate( date_dict.items()):
#        print('[{index}] date[{date}] count {count}'.format(index=i, date = d, count=c))       

#    print('sorted by date:')
#    for i in sorted( date_dict.keys()):
#        print('[{index}] date[{mac}] count {count}'.format(index=i, mac = i, count=date_dict[i]))

    print('Summary by date:')
    index = 0
    for key in sorted( date_dict.keys()):
        print('[{index}] date[{date}] count {count}'.format(index=index, date = key, count=date_dict[key]))
        index = index + 1

        
#    print(mac_dict)
#    print(date_dict)


# --- Call XW2218
##client = login()

##node = client.collection( XW2218_NODE ).get()
##print(">>>Node Summary Node")
##show_summary( node )

print('----->')
action, folder, field, compare, value = parseParameter()
dispachCommand(action, folder, field, compare, value)
