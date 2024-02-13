import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/map/camera.dart';
import 'package:autoaid/utils/map/map_settings.dart';
import 'package:autoaid/utils/socket_management/routing_map.dart';
import 'package:autoaid/utils/socket_management/socket.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  CameraExample? _cameraExample;
  RoutingExample? _routingManager;
  // final HOME_GEO_COORDINATES = GeoCoordinates(10.7845766, 106.6212572);

  @override
  void initState() {
    super.initState();
    initMap = MapHelper.initializeHERESDK();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                context.push('/home');
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text('Create Route'),
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
                    buttonOrange('Find Garage', _addRouteButtonClicked),
                    buttonOrange('Send Request', _clearMapButtonClicked),
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
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay,
        (MapError? error) {
      if (error == null) {
        _routingManager = RoutingExample(_showDialog, hereMapController);
        _cameraExample = CameraExample(hereMapController);
      } else {
        Logger().e("Map scene not loaded. MapError: $error");
      }
    });
  }

  void _moveButtonClicked() {
    _cameraExample?.move();
  }

  void _addRouteButtonClicked() {
    _routingManager?.addRoute(GeoCoordinates(10.7845766, 106.6212572),
        GeoCoordinates(10.7842575, 106.616255));
  }

  void _clearMapButtonClicked() {
    _routingManager?.clearMap();
  }

  // void _sendRequestSocket() {
  //   socketManager.userSendRequest();
  // }

  @override
  void dispose() {
    // Free HERE SDK resources before the application shuts down.
    SDKNativeEngine.sharedInstance?.dispose();
    SdkContext.release();
    super.dispose();
  }

  Future<void> _showDialog(String title, String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
