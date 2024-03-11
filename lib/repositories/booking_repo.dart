import 'package:autoaid/data_api/booking_api.dart';
import 'package:autoaid/data_api/garage_api.dart';
import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/garage_getAll_model.dart';
import 'package:autoaid/models/new_schedule_model.dart';

class BookingRepo {
  final BookingApi _bookingApi;
  BookingRepo({required BookingApi bookingApi}) : _bookingApi = bookingApi;

  Future<void> sendBooking(NewSchedule newSchedule) async {
    _bookingApi.sendBooking(newSchedule);
  }
}
