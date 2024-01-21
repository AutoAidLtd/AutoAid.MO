class EmergentUserEmitEvent {
  static const userSendRequest = "SEND_REQUEST_EMERGENT";
  static const userUpdateLocation = "USER_UPDATE_LOCATION";
}

class EmergentUserReceiveEvent {
  static const userRequestHandled = "USER_REQUEST_HANDLED";
  static const userInRoomUpdateLocation = "USER_INROOM_UPDATE_LOCATION";

  ///ques: server trả về khi cái room được thiết lập
  static const garageApproveRequest = "GARAGE_APPROVE_REQUEST";
}
