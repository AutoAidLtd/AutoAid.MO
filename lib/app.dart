import 'package:autoaid/routes/router.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/map/camera.dart';
import 'package:flutter/material.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/core.engine.dart';
import 'package:here_sdk/mapview.dart';
import 'package:logger/logger.dart';

class AutoAid extends StatefulWidget {
  const AutoAid({super.key});

  @override
  State<AutoAid> createState() => _AutoAidState();
}

class _AutoAidState extends State<AutoAid> with TickerProviderStateMixin {
    CameraExample? _cameraExample;


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(useMaterial3: true),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text('HERE SDK - Camera Example'),
      //   ),
      //   body: Stack(
      //     children: [
      //       HereMap(onMapCreated: _onMapCreated),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           buttonBlue('Move', _moveButtonClicked),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.hybridNight, (MapError? error) {
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
