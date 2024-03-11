import 'package:autoaid/data_api/booking_api.dart';
import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/new_schedule_model.dart';
import 'package:autoaid/pages/book_flow/garage_page/service_garage_card.dart';
import 'package:autoaid/repositories/booking_repo.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class ScheduleServicePage extends StatefulWidget {
  const ScheduleServicePage({
    super.key,
    required this.garageDetail,
  });
  final GarageDetail garageDetail;

  @override
  State<ScheduleServicePage> createState() => _ScheduleServicePageState();
}

class _ScheduleServicePageState extends State<ScheduleServicePage> {
  late DateTime _selectedDateTime;
  BookingRepo _bookingRepo = BookingRepo(bookingApi: BookingApi());
  List<GarageService> _selectedServices = [];
  List<Roww> rows = [];

  @override
  void initState() {
    super.initState();
    // Khởi tạo _selectedDateTime với ngày và giờ hiện tại
    _selectedDateTime = DateTime.now();
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _bookSchedule(BuildContext context) async {
    print(_selectedServices);
    _selectedServices.map(
      (sv) => {
        rows.add(Roww(serviceId: sv.garageServiceId)),
        print(sv.garageServiceId)
      },
    );
    NewSchedule newSchedule = NewSchedule(
      vehicleId: 1,
      scheduleTime: _selectedDateTime,
      remark: "Regular maintenance",
      rows: rows,
      customerId: 12,
      garageId: 6,
    );
    await _bookingRepo.sendBooking(newSchedule);
  }

  @override
  Widget build(BuildContext context) {
    Logger lg = Logger();

    void _handleServiceUpdated(GarageService service, bool isSelected) {
      setState(() {
        if (isSelected) {
          _selectedServices.add(service);
          rows.add(Roww(serviceId: service.garageServiceId));
          lg.i('upper: ' + _selectedServices.toString());
        } else {
          _selectedServices.remove(service);
          rows.remove(Roww(serviceId: service.garageServiceId));
          // lg.i(_selectedServices.toString());
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: textB('Schedule A Service', 20),
      ),
      body: ListView(
        // padding: EdgeInsets.zero,
        children: [
          Center(
            child: Column(
              children: [
                SB_HEIGHT(25),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: textB('Choose your Service !', 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SB_HEIGHT(25),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.grey[300]!), // Viền bạc mỏng
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11.0),
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListServices(
                          garageService: this.widget.garageDetail.garageService,
                          onServiceUpdated: _handleServiceUpdated),
                    ),
                  ),
                ),
                SB_HEIGHT(25),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _selectDateTime(context),
                        child: Text('Chọn Ngày và Giờ'),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Ngày và giờ đã chọn: $_selectedDateTime',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SB_HEIGHT(25),
                buttonGradientOrange(
                  'Book Now >',
                  () => {
                    _bookSchedule(context),
                    context.go('/home'),
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListServices extends StatefulWidget {
  const ListServices({
    super.key,
    required this.garageService,
    required this.onServiceUpdated,
  });
  final List<GarageService> garageService;
  final Function(GarageService, bool) onServiceUpdated;

  @override
  State<ListServices> createState() => _ListServicesState();
}

class _ListServicesState extends State<ListServices> {
  List<GarageService> _selectedServices = [];

  void _handleServiceSelected(GarageService service, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedServices.add(service);
        widget.onServiceUpdated(service, isSelected);
        Logger().i('under: ' + _selectedServices.toString());
      } else {
        _selectedServices.remove(service);
        widget.onServiceUpdated(service, isSelected);
        // lg.i(_selectedServices.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Text('hehe');
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.garageService.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return ServiceGarageCard(
          service: widget.garageService[index],
          onServiceSelected: _handleServiceSelected,
        );
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Schedule Service Page'),
//     ),
//     body:
//   );
// }
