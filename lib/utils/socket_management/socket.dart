import 'package:autoaid/models/sendEmerModel.dart';
import 'package:autoaid/utils/socket_management/socket_enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  final String serverUrl = 'http://10.0.2.2:4000';
  late IO.Socket _socket;
  static SocketManager? _instance;
  late BuildContext _context;

  factory SocketManager() {
    _instance ??= SocketManager._internal();
    return _instance!;
  }

  SocketManager._internal() {
    connectSocket();
  }

  IO.Socket get socket => _socket;
  void setContext(BuildContext context) {
    _context = context;
  }

  void connectSocket() async {
    final prefs = await SharedPreferences.getInstance();
    String aToken = prefs.getString('aToken')!;
    _socket = IO.io(
      serverUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          // .disableAutoConnect()
          .setExtraHeaders({'authorization': 'Bearer $aToken'})
          .enableForceNewConnection()
          .build(),
    );

    // _socket.connect();

    _socket.onConnect((_) {
      Logger().i('Connected to $serverUrl completed');
    });

    _socket.onDisconnect((_) {
      Logger().i('disconnect');
    });

    _socket.on(EmergentUserReceiveEvent.userRequestHandled, (data) {
      Logger().w('Data from Server(userRequestHandled): $data');
    });

    //__ SAU KHI GARAGE APPROVE REQUEST, PUSH VÀO 1 ROOM bất kì
    _socket.on(EmergentUserReceiveEvent.garageApproveRequest, (data) {
      Logger().w('Data from Server(garageApproveRequest): $data');
      _context.push('/map');
    });
  }

  void disposeSocket() {
    _socket.disconnect();
    _socket.dispose();
    _instance = null;
  }

  //__1
  void userSendRequest() {
    sendEmergentDTO emergentRequest = sendEmergentDTO(
      location: Location(lat: 10.8698289, lng: 106.7780165),
      vehicle: Vehicle(verhicleNo: "ABC123", type: "CAR", brand: "Toyota"),
      remark: "Emergency!",
      createTimestamp: DateTime.now(),
    );
    _socket.emit(
        EmergentUserEmitEvent.userSendRequest, emergentRequest.toJson());
  }

  void userUpdateLocation() {
    // _socket.emit(EmergentUserEmitEvent.userUpdateLocation);
  }
}
