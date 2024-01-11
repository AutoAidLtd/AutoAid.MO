import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/map/camera.dart';
import 'package:autoaid/utils/map/map_settings.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/mapview.dart';
import 'package:logger/logger.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapState();
}

class _MapState extends State<MapScreen> with TickerProviderStateMixin {
  late Future<void> initMap;

  @override
  void initState() {
    super.initState();
    initMap = MapHelper.initializeHERESDK();
  }

  CameraExample? _cameraExample;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Garage'),
      ),
      body: FutureBuilder(
        future: initMap,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Stack(
              children: [
                HereMap(onMapCreated: _onMapCreated),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonOrange('Find Garage', _moveButtonClicked),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.hybridNight,
        (MapError? error) {
      if (error == null) {
        _cameraExample = CameraExample(hereMapController);
      } else {
        Logger().e("Map scene not loaded. MapError: $error");
      }
    });
  }

  void _moveButtonClicked() {
    _cameraExample?.move();
  }

  @override
  void dispose() {
    _disposeHERESDK();
    super.dispose();
  }

  void _disposeHERESDK() async {
    // Free HERE SDK resources before the application shuts down.
    await SDKNativeEngine.sharedInstance?.dispose();
    SdkContext.release();
  }
}
