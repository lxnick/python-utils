# Program to check if a number is prime or not
import paho.mqtt.client as mqtt
import time
import socket
##########################
def on_message(client, userdata, message):
    print("message received ", str(message.payload.decode("utf-8")))
    print("message topic= ", message.topic)
    print("message qos= ", message.qos)
    print("message retain flag= ", message.retain)

##########################
def on_log(client, userdata, level, buf):
    print("log: ",buf);

##########################
def get_ip_address():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    return s.getsockname()[0]

##########################
#broker_address="192.168.1.184"
#broker_address="mqtt.eclipse.org"
broker_address="broker.emqx.io"
group="nowlooklook/board/"
member_name="wsl2"
hostname=socket.gethostname()
member_ip=socket.gethostbyname(hostname)
print("member:" , member_name)
print("member_ip", member_ip)
test=get_ip_address()
print("ip:", test)

print("creating new instance")
client = mqtt.Client("P1")
client.on_message=on_message
client.on_log=on_log
print("connecting to broker")
client.connect(broker_address)
client.loop_start()
print("subscribing to topic","house/bulbs/bulb1")
client.subscribe("house/bulbs/bulb1")
print("Publishing message to topic", "house/bulbs/bulb1")
client.publish("house/bulbs/bulb1","OFF")
time.sleep(4)
client.loop_stop()

