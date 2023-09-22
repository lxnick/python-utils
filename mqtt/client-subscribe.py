# Program to check if a number is prime or not
import paho.mqtt.client as mqtt

broker = 'broker.emqx.io'
port = 1883
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
    print("broker =", broker)
    print("topic =", topic)
    client.connect(broker, port)
    return client                       

##########################
def subscribe(client: mqtt):
    def on_message(client, userdata, message):
        print(f"Received `{message.payload.decode()}` from `{message.topic}` topic")

    client.subscribe(topic)
    client.on_message = on_message        

##########################
def run():
    client = connect_mqtt()
    subscribe(client)
    client.loop_forever()

if __name__ == '__main__':
    run()
