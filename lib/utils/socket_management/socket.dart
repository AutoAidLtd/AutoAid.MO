import 'package:autoaid/models/sendEmerModel.dart';
import 'package:autoaid/utils/socket_management/socket_enum.dart';
import 'package:logger/logger.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  final String serverUrl = 'http://10.0.2.2:4000';
  late IO.Socket _socket;
  static SocketManager? _instance = SocketManager._internal();

  String bear =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWJqZWN0IjoiMSIsImlhdCI6MTcwNTAzMzgzNn0.scs0PiTlE0BLjvZOPJeBIdaGt2QYZnewFwzu4KUGzDQ';

  factory SocketManager() {
    _instance ??= SocketManager._internal();
    return _instance!;
  }

  SocketManager._internal() {
    connectSocket();
  }

  // Getter to access the socket instance
  IO.Socket get socket => _socket;

  void connectSocket() {
    _socket = IO.io(
      serverUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect()
          .setExtraHeaders({'authorization': 'Bearer $bear'})
          .enableForceNewConnection()
          .build(),
    );

    _socket.connect();

    _socket.onConnect((_) {
      // sendEmergentDTO emergentRequest = sendEmergentDTO(
      //   location: Location(lat: 123.456, lng: 789.012),
      //   vehicle: Vehicle(verhicleNo: "ABC123", type: "CAR", brand: "Toyota"),
      //   remark: "Emergency!",
      //   createTimestamp: DateTime.now(),
      // );
      // _socket.emit('SEND_REQUEST_EMERGENT', emergentRequest);
      Logger().e('Connected to $serverUrl completed');
    });

    _socket.onDisconnect((_) {
      Logger().i('disconnect');
    });

    _socket.on(EmergentUserReceiveEvent.userRequestHandled, (data) {
      Logger().w('Data from Server(userRequestHandled): $data');
    });

    //server trả về khi cái room được thiết lập
    _socket.on(EmergentUserReceiveEvent.garageApproveRequest, (data) {
      Logger().w('Data from Server(userRequestHandled): $data');
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
      location: Location(lat: 123.456, lng: 789.012),
      vehicle: Vehicle(verhicleNo: "ABC123", type: "CAR", brand: "Toyota"),
      remark: "Emergency!",
      createTimestamp: DateTime.now(),
    );
    _socket.emit(
        EmergentUserEmitEvent.userSendRequest, emergentRequest.toJson());
  }

  void userUpdateLocation() {
    _socket.emit(EmergentUserEmitEvent.userUpdateLocation);
  }
}
