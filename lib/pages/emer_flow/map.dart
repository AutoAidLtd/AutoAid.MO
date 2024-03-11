import 'dart:typed_data';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/map/camera.dart';
import 'package:autoaid/utils/map/map_settings.dart';
import 'package:autoaid/utils/map/searchObject.dart';
import 'package:autoaid/utils/socket_management/routing_map.dart';
import 'package:autoaid/utils/socket_management/socket.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  //Init Map
  late Future<void> initMap;
  RoutingExample? _routingManager;
//init draw marker
  SearchExample? _searchExample;
//Init GPS
  late GeoCoordinates gpsResult;
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late SocketManager socketManager;

  @override
  void initState() {
    super.initState();
    socketManager = SocketManager()..setContext(context);

    _getCurrentPosition();
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
        // title: Text('Create Route'),
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
                    buttonOrange('Lấy địa chỉ hiện tại', _drawMarker_GPS),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 16,
                  child: Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        context.push('/dlt', extra: gpsResult);
                      },
                      child: Text('Confirm Adress'),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(
      MapScheme.normalDay,
      (MapError? error) {
        if (error == null) {
          _routingManager = RoutingExample(_showDialog, hereMapController);
          _searchExample = SearchExample(_showDialog, hereMapController);
          // _cameraExample = CameraExample(hereMapController, gpsResult);
          MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, 8000);
          hereMapController.camera.lookAtPointWithMeasure(
              GeoCoordinates(10.8028696, 106.6108742), mapMeasureZoom);
        } else {
          Logger().e("Map scene not loaded. MapError: $error");
        }
      },
    );
  }

  //_GPS_FUNCTIONS

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    gpsResult = GeoCoordinates(position.latitude, position.longitude);
    Logger().i('GPS_RESULT: ${gpsResult.latitude}, ${gpsResult.longitude}');
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      Logger().i('Location services are not enabled do not continue');
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Logger().i('Permissions are denied, next time you could try');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Logger().i('Permissions are denied forever, handle appropriately');
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Logger().i('GRANTED');
    return true;
  }

  //_MAP_FUNCTIONS
  void _addRouteButtonClicked() {
    _routingManager?.addRoute(GeoCoordinates(10.7845766, 106.6212572),
        GeoCoordinates(10.7842575, 106.616255));
  }

  void _drawMarker_GPS() {
    _searchExample?.drawGPS(gpsResult);
  }

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
