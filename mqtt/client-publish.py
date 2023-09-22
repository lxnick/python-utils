# Program to check if a number is prime or not
import paho.mqtt.client as mqtt
import time

broker = 'broker.emqx.io'
port = 1883
#topic = 'menethil/arthas/temperature'
topic = 'BXRR12/KN03A'

##########################
def connect_mqtt() -> mqtt:
    def on_connect(client, userdata, flags, rc):
        print("connect client =", client)
        print("connect userdata = ", userdata)
        print("connect flags = ", flags)
        print("connect rc = ", rc)

        if rc == 0 :
            print("Connected to MQTT Broker!")
        else:
            print("Failed to connect, rc = %d\n", rc)

#    client = mqtt.Client(client_id)
    client = mqtt.Client()

    client.on_connect = on_connect
    client.connect(broker, port)
    return client                       

##########################
def publish(client):
    message_count = 0

    while True:
        time.sleep(1)
        message = f"messages:{message_count}"
        result = client.publish(topic, message)

        status = result[0]
        if status == 0 :
            print(f"Send '{message}' to topic '{topic}'")
        else:
            print(f"Failed to send message to topic {topic}")

        message_count += 1

##########################
def run():
    client = connect_mqtt()
    client.loop_start()
    publish(client)        

if __name__ == '__main__':
    run()
