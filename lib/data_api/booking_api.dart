import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/garage_getAll_model.dart';
import 'package:autoaid/models/new_schedule_model.dart';
import 'package:autoaid/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class BookingApi {
  final Dio _dio = Dio();

  BookingApi() {
    _dio.options.baseUrl = '${AppConstants.domainNode}/schedule';
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
  }

  Future<void> sendBooking(NewSchedule newSchedule) async {
    try {
      Response response =
          await _dio.post('', data: newScheduleToJson(newSchedule));
      Logger().i(newScheduleToJson(newSchedule));
      Logger().i(response.data);
    } catch (e) {
      Logger().e("Error Send Booking: $e");
      throw e;
    }
  }
}
