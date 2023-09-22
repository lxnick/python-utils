# --- Python Code to test XW2218

# --- Import XW2218
from BaseXW2218 import *

import sys

XW2218_PHOTO = "xw2218-h1-v1-photo"
XW2218_NODE  = "xw2218-h1-v1-node"
XW2218_AUDIO = "xw2218-h1-v1-audio"

# --- Command Format
#     Summary, summary item count by MAC, date
#       xw2218.py summary <FOLDER>
#       xw2218.py summary <FOLDER> date = <date>
#       xw2218.py summary <FOLDER> mac = <MAC>
#
#     List, list items id by MAC, date, or both
#       xw2218.py list <FOLDER>
#       xw2218.py list <FOLDER> date = <date>
#       xw2218.py list <FOLDER> mac = <MAC>
#
#     Delete, delete item  by id
#       xw2218.py delete <FOLDER> id = <ID>
#
#     Download, download  item  by id
#       xw2218.py download <FOLDER> id = <ID>


Action = ['list', 'summary',  'delete', 'download', 'show']
Folder = ['photo', 'audio', 'node']  
Field = ['mac', 'date', 'none','all', 'id']  
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


# --- Summary record by MAC/Date 
def action_summary(folder,field, compare, value):
    client = login()
    collection = client.collection( folder).get()
    count = count_collection( collection)
    print('{count} items found in {folder}'.format(count = count, folder=folder))
    collection = filter(collection, field, compare, value) 
    count = count_collection( collection)
    print('{count} filtered by {field} {compare} {value}'.format(count = count, field=field,compare=compare,value=value))
    summary( collection)

# --- List record ID 
def action_list(folder,field, compare, value):
    client = login()
    collection = client.collection( folder).get()
    count = count_collection( collection)
    print('{count} items found in {folder}'.format(count = count, folder=folder))
    collection = filter(collection, field, compare, value) 
    count = count_collection( collection)
    print('{count} filtered by {field} {compare} {value}'.format(count = count, field=field,compare=compare,value=value))
    list_command( collection)

# --- Show record Content
def action_show(folder,field, compare, value):
    if field != 'id' or compare != '=' or value == 'none':
        print('Show document by ID')
        return

    path_to_document = folder + '/' + value
    print('PATH:', path_to_document )
    client = login()
    try:
        document_ref = client.document( path_to_document)
        document = document_ref.get()
#        print('TO DICT')
#        print('{}'.format(document.to_dict()))
        record = document.to_dict()
#        print('RECORD')
#        print(record)
#        print('PATH:', path_to_document )
#        show_record(path_to_document, record)               
        for index, (key, item) in enumerate( record.items()):
            print('[{index}] {key} = {item}'.format(index=index, key=key, item=item)) 

 #       return
    except:
        print('Show record {folder} {value} failed'.format(folder=folder, value=value))
        return 


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
    'show':     action_show,
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

# --- process summary command
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

# --- process list command
def list_command( collection ):
    table = dict()
    mac_set = set()
    date_set = set()

    for item in collection:
        result = parse_id( item.id)

        if result == None :
            continue;

        mac = result[0]
        date = result[1].date()
        mac_set.add(mac)
        date_set.add(date)

        if mac in table.keys():
            if date in table[mac].keys():
                table[mac][date].append(item.id)
            else:
                id_list = list()
                id_list.append(item.id)
                table[mac][date] = id_list
        else:
            id_list = list()
            id_list.append(item.id)
            date_dict = dict()
            date_dict[date] = id_list
            table[mac] = date_dict

    mac_list = list( mac_set)
    mac_list.sort()

    date_list = list( date_set)
    date_list.sort()

    for i, mac in enumerate( mac_list):
        if mac not in table.keys():
            continue
        print('MAC:', mac)                

        for j, date in enumerate(date_list):            
            if date not in table[mac].keys():
                continue

            print('    Date:', date)                
        
            for k, id in enumerate( table[mac][date]):
                print('        [{index}] {id}'.format(index=k, id=id))                
#            for id in table[mac][date]
#                print('{id}'.format(id=id))                

# --- process show command
def show_record(path_to_docuemnt, record):
#    print('PATH:', path_to_document )
    for index, (key, item) in enumerate( record.items()):
        print('[{index}] {key} = {item}'.format(index=index, key=key, item=item)) 
    return
    
        

# --- Call XW2218
##client = login()

##node = client.collection( XW2218_NODE ).get()
##print(">>>Node Summary Node")
##show_summary( node )

print('----->')
action, folder, field, compare, value = parseParameter()
dispachCommand(action, folder, field, compare, value)
