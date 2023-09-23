import pathlib
import getopt, sys
import json
import os
import string
import json
import requests
import io
import base64
from PIL import Image,PngImagePlugin

URL="http://127.0.0.1:7860"

WIDTH = 1920
HEIGHT = 1080

class Blob:
    def __init__(self):
        self.folder = "Folder"
        self.action = "Action"        

def get_file_list(folder, extension, pattern):
    files = []
    for file in os.listdir( folder):
        if file.endswith( extension):
            if pattern :  
                if pattern  in file:
                    files.append(file)
    return files

def preprocess_json_string(filename):
    with open( filename, "r") as text_file:
        message = text_file.read()
    message = message.replace("\t","")
    message = message.replace("\n","")
    
    last = message[ len(message) -1]
    if ( last == '\0' ):
        message = message[:-1]

    return message           
    

def process_argument():
    argument_list = sys.argv[1:]

    short_optiopns = "hf:a:"
    long_options = ["help", "folder", "action"]

    try:
        arguments,values = getopt.getopt(argument_list,short_optiopns,long_options)

        for argument, value in arguments:
            if argument in ("-h", "--help"):
                print("Display Help")
            elif argument in ("-f", "--folder"):
                store.folder = value                
            elif argument in ("-a", "--action"):
                store.action = value                

    except getopt.error as err:
        print(str(err))

def process_make_mask(folder):
    mask_json_list = get_file_list(folder, ".json", "mask")

    for file in mask_json_list:
        pathname = folder + "/" + file

        message = preprocess_json_string(pathname)

        data = json.loads( message)

        object_count = data["count"]

        for i in range(object_count):
            print("Object[{index},{name}]".\
            format(index= data["objects"][i]["index"],name=data["objects"][i]["name"]))

        dest = file[0:-5:] + ".png"
        print("Make", file)
        print("Dest", dest)

def process_draw_txt2img(folder):
    mask_json_list = get_file_list(folder, ".json", "txt2img")

    for file in mask_json_list:
        infile = folder + "/" + file

        text = preprocess_json_string(infile)

        data = json.loads( text)
        print("JSON:", data)

        response = requests.post(url=f'{URL}/sdapi/v1/txt2img', json=data)
        r = response.json()
        index = 0
        for i in r["images"]:
            image = Image.open(io.BytesIO(base64.b64decode(i.split(",",1)[0])))
            png_payload = {
                "image":"data:image/png;base64,"+i
            }

            response2 = requests.post(url=f'{URL}/sdapi/v1/png-info',json=png_payload)
            pnginfo=PngImagePlugin.PngInfo()
            pnginfo.add_text("parameters", response2.json().get("info"))

            outfile = folder + "/" file[0:-5:] + "-" + str(index) + ".png"
            index = index + 1

            print("Outfile:",outfile)
            image.save(outfile, pnginfo=pnginfo)


# 0, initialize global data
print("Sd-Drawing")
store = Blob()

# 1, process arguemnt for folder/action/...
process_argument()  

# 2. dispatch command
if (store.action == "mask"):
    process_make_mask(store.folder)
elif (store.action == "txt2img"):
    process_draw_txt2img(store.folder)

json_string = "{\"count\":2,\"objects\":[{\"index\":0,\"name\":\"car\",\"rect\":{\"left\":970}},{\"index\":1},{\"index\":2}]}"
#json_string = "{\"count\":2,\"objects\":[{\"index\":0,\"name\":\"car\",\"rect\":{\"left\": 970,\"right\":1120,\"top\":415,\"bottom\":547}},{\"index\":1,\"name\":\"car\",\"rect\":{
#                "left": 1292,
#                "right":    1398,
#                "top":  611,
#                "bottom":   681
#            }
#        }]
#}
#parse_json(json_string)
