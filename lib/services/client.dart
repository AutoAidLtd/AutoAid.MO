import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  static IO.Socket? _socket;

  static void connectToServer() {
    _socket = IO.io('http://your_socket_server_url');

    _socket!.onConnect((_) {
      print('Connected to server');
    });

    _socket!.on('message', (data) {
      print('Received message: $data');
    });

    // Add other event listeners as needed
  }

  static void sendMessage(String message) {
    if (_socket != null && _socket!.connected) {
      _socket!.emit('sendMessage', {'message': message});
    } else {
      print('Socket is not connected');
    }
  }

  static void disconnect() {
    if (_socket != null) {
      _socket!.disconnect();
    }
  }
}
