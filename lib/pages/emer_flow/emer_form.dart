import 'package:autoaid/models/sendEmerModel.dart';
import 'package:autoaid/utils/socket_management/socket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:here_sdk/core.dart';
import 'package:logger/logger.dart';

class EmerForm extends StatefulWidget {
  const EmerForm({
    super.key,
    this.geoLocation,
  });
  final GeoCoordinates? geoLocation;

  @override
  State<EmerForm> createState() => _EmerFormState();
}

class _EmerFormState extends State<EmerForm> {
  final _formKey = GlobalKey<FormState>();
  final _verhicleNoController = TextEditingController();
  final _typeController = TextEditingController();
  final _brandController = TextEditingController();
  List<String> vehicleTypes = ['Car', 'Bike'];
  late SocketManager socketManager;

  @override
  void dispose() {
    _verhicleNoController.dispose();
    _typeController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    socketManager = SocketManager()..setContext(context);
    _typeController.text = vehicleTypes[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fill in your information'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _verhicleNoController,
                  keyboardType: TextInputType.name,
                  decoration: inputDecoration(
                      prefixIcon: Icon(Icons.format_list_numbered),
                      hintText: '29-AB 99.999',
                      labelText: 'Vehicle No'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: _typeController.text,
                  onChanged: (newValue) {
                    setState(() {
                      _typeController.text = newValue!;
                    });
                  },
                  items: vehicleTypes.map((type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  decoration: inputDecoration(
                    prefixIcon: Icon(Icons.directions_car_outlined),
                    labelText: 'Type of Vehicle',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a vehicle type';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _brandController,
                  keyboardType: TextInputType.name,
                  decoration: inputDecoration(
                      prefixIcon: Icon(Icons.chrome_reader_mode_outlined),
                      hintText: 'Toyota',
                      labelText: 'Brand'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill this field';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                // TextFormField(
                //   controller: _streetAddressController,
                //   keyboardType: TextInputType.streetAddress,
                //   decoration: inputDecoration(
                //       prefixIcon: Icon(Icons.streetview_outlined),
                //       hintText: '123 State Street',
                //       labelText: 'Street Address'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please fill this field';
                //     }
                //     return null;
                //   },
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   controller: _cityController,
                //   keyboardType: TextInputType.text,
                //   decoration: inputDecoration(
                //       prefixIcon: Icon(Icons.location_city_outlined),
                //       hintText: 'London',
                //       labelText: 'City'),
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return 'Please fill this field';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                    onPressed: () {
                      onPressConfirm(context);
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ));
  }

  void onPressConfirm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Hello ${_verhicleNoController.text}\n ${_typeController.text}\n ${_brandController.text}.')));

      SendEmergentDTO emergencyCase = SendEmergentDTO(
        remark: "Emergency!",
        createTimestamp: DateTime.now(),
        vehicle: Vehicle(
            verhicleNo: _verhicleNoController.text,
            type: _typeController.text,
            brand: _brandController.text),
        location: LocationVariable(
          lng: widget.geoLocation!.longitude,
          lat: widget.geoLocation!.latitude,
        ),
      );
      socketManager.userSendRequest(emergencyCase);

      Logger().i(
          'Vehicle Information: ${emergencyCase.vehicle.type}\n ${emergencyCase.location.lat}\n ${emergencyCase.location.lng}');
    } else {
      // The form has some validation errors.
      // Do Something...
    }
  }

  InputDecoration inputDecoration({
    InputBorder? enabledBorder,
    InputBorder? border,
    Color? fillColor,
    bool? filled,
    Widget? prefixIcon,
    String? hintText,
    String? labelText,
  }) =>
      InputDecoration(
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0)),
          border: border ?? OutlineInputBorder(borderSide: BorderSide()),
          fillColor: fillColor ?? Colors.white,
          filled: filled ?? true,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText);
}
