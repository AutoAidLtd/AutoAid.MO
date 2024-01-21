import 'dart:io';

import 'package:autoaid/utils/socket_management/socket.dart';
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
  late SocketManager socketManager;
  @override
  void initState() {
    super.initState();
    socketManager = SocketManager();
  }

  @override
  void dispose() {
    SocketManager().disposeSocket();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Socket Client: User Role'),
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
                socketManager.userSendRequest(),
              },
              child: const Text('Connect socket'),
            ),
          ],
        ),
      ),
    );
  }
}
