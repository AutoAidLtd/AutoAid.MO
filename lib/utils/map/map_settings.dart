import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/core.errors.dart';
import 'package:logger/logger.dart';

class MapHelper {
  //Use this function before using the map
  static initializeHERESDK() async {
    final String response = await rootBundle.loadString("assets/mapkey.json");
    final data = await json.decode(response);

    // Needs to be called before accessing SDKOptions to load necessary libraries.
    SdkContext.init(IsolateOrigin.main);
    await SDKNativeEngine.sharedInstance?.dispose();

    // Set your credentials for the HERE SDK.
    String accessKeyId = data["accessKeyId"];
    String accessKeySecret = data['accessKeySecret'];
    SDKOptions sdkOptions =
        SDKOptions.withAccessKeySecret(accessKeyId, accessKeySecret);

    SDKNativeEngine sdkNativeEngine;
    try {
      // await SDKNativeEngine.makeSharedInstance(sdkOptions);
      sdkNativeEngine = SDKNativeEngine(sdkOptions);
      SDKNativeEngine.sharedInstance = sdkNativeEngine;
    } on InstantiationException {
      throw Exception("Failed to initialize the HERE SDK.");
    }
  }
}
