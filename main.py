from flask import Flask, json, request
from pyngrok import ngrok

app = Flask(__name__)
ngrok.set_auth_token("your authtoken here")

@app.route('/location', methods=['GET'])
def get_validator():
    return "your validator here"


@app.route('/location', methods=['POST'])
def get_cmxJSON():
    cmxdata = request.json
    if cmxdata['type'] == "DevicesSeen":
        print("WiFi Devices Seen")
    elif cmxdata['type'] == "BluetoothDevicesSeen":
        print("Bluetooth Devices Seen")
    else:
        print("Unknown Device 'type'")
    return "CMX POST Received"


if __name__ == '__main__':
    # Setup ngrok
    ngrok_tunnel = ngrok.connect(5000)
    print('ngrok tunnel "http://127.0.0.1:5000" -> "{}"'.format(ngrok_tunnel.public_url))

    # Run Flask
    app.run(port=5000)
