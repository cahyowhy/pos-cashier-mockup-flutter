import 'dart:async';

import 'package:mqtt_client/mqtt_client.dart';

String identifier = "matraman@outlook.com";
String username =
    "eyJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiZGlyIn0..bwHlov5crhWn_Jjt1Czsvg.rAzeN8e6tk_B807RjAY7BTedIb7PigLYbgxIghYbGh1qU09oPwXMELH9SQepVOeMbY3kVkoI1jwi_IYGTMJx5U2KN8jsXYgj5o0sG_LwYFMLZXVuZyazIYO5k-oHn6lHUUbME2eo3GwNKTsjy3qKEON4ZowJVzG2XLkXipMUPzqGsaiW3NVNgPCyaBWN3P94.nk-fiAoKlRZJnc6srrJbwpiWM_xH89nwzd3mScqqUg8";
String password = "pos";

class Socket {
  static MqttClient _client;

  static MqttQos _qos = MqttQos.exactlyOnce;

  static Map<String, dynamic> _pending = {};

  static Map<String, dynamic> _listener = {};

  static StreamSubscription _subscription;

  static Future<MqttClient> getClient() async {
    if (Socket._client == null ||
        (Socket._client != null &&
            Socket._client?.connectionStatus?.state ==
                MqttConnectionState.disconnected)) {
      Socket._client = MqttClient('ws://192.168.0.49/', identifier);
      Socket._client.keepAlivePeriod = 10;
      Socket._client.port = 80;
      Socket._client.logging(on: true);
      Socket._client.useWebSocket = true;
      Socket._client.websocketProtocols = ['mqtt'];
      Socket._client.secure = false;
      Socket._client.pongCallback = () => print("pong");
      Socket._client.onConnected = () => print('conn: connected');
      Socket._client.onDisconnected = () => print('conn: disconected');
    
      MqttConnectMessage connectMessage = MqttConnectMessage()
          .withWillTopic("WillMsg")
          .withWillMessage("SocketConsume closed abnormally..!")
          .withWillQos(Socket._qos)
          .keepAliveFor(10)
          .withProtocolVersion(4)
          .withProtocolName('MQTT')
          .withClientIdentifier(identifier)
          .authenticateAs(username, password);

      Socket._client.connectionMessage = connectMessage;

      try {
        await Socket._client.connect();
        Socket._subscription = Socket._client.updates.listen(Socket.onMessage);
      } catch (e) {
        print("error: " + e.toString());

        _client.disconnect();
        _client = null;

        if (_subscription != null) {
          _subscription.cancel();
          _subscription = null;
        }
      }
    }

    return Socket._client;
  }

  static void onMessage(List<MqttReceivedMessage> event) {
    final MqttPublishMessage recMess = event[0].payload as MqttPublishMessage;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    print("cek " + message);
  }

  static void subscribe(String topic) {
    Socket.getClient().then((client) {
      if (client?.connectionStatus?.state == MqttConnectionState.connected) {
        client.subscribe(topic, Socket._qos);
      } else {
        Socket._pending[topic] = {"cmd": "subs", "topic": topic};
        // Socket.getClient();
      }
    });
  }

  static void unsubscribe(String topic) {
    Socket.getClient().then((MqttClient client) {
      if (client?.connectionStatus?.state == MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');

        client.unsubscribe(topic);
      } else {
        Socket._pending[topic] = {"cmd": "unsubscribe", "topic": topic};
        // Socket.getClient();
      }
    });
  }

  static void listenMessage(void Function(dynamic message) cb) {
    Socket._listener[DateTime.now().toString()] = cb;
  }

  static void publish(String topic, dynamic payload) {
    Socket.getClient().then((MqttClient client) {
      if (client?.connectionStatus?.state == MqttConnectionState.connected) {
        print('[MQTT client] Subscribing to ${topic.trim()}');

        client.publishMessage(topic, Socket._qos, payload);
      } else {
        Socket._pending[topic] = {
          "cmd": "publish",
          "topic": topic,
          "payload": payload
        };
        // Socket.getClient();
      }
    });
  }
}
