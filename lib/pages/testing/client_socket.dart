import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ClientSocket extends StatefulWidget {
  const ClientSocket({super.key});

  @override
  State<ClientSocket> createState() => _ClientSocketState();
}

class _ClientSocketState extends State<ClientSocket> {
  final String serverUrl = 'http://10.0.2.2:4000';
  late IO.Socket _socket;

  @override
  void initState() {
    super.initState();
    connectToSocket();
  }

  void connectToSocket() {
    _socket = IO.io(
        serverUrl,
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .enableForceNewConnection()
            .build());
    _socket.connect();

    //__Socket Connected
    _socket.onConnect((_) {
      Logger().t('Connected to $serverUrl completed');
    });

    //__Socket Disconnected
    _socket.onDisconnect((_) => Logger().i('disconnect'));

    //___.USER_REQUEST_HANDLED
    _socket.on(
      'USER_REQUEST_HANDLED',
      (data) => {Logger().w('Server talk: $data')},
    );

    //__.GARAGE_INROOM_UPDATE_LOCATION
  }

  void sendEmerToSocket() {
    _socket.emit('SEND_REQUEST_EMERGENT', 'Customer ID');
  }

// WIDGET DISPOSE
  @override
  void dispose() {
    _socket.disconnect();
    _socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => {context.pop()},
              child: const Text('Back'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => {
                sendEmerToSocket(),
              },
              child: const Text('Connect socket'),
            ),
          ],
        ),
      ),
    );
  }
}
