import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/garage_getAll_model.dart';
import 'package:autoaid/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class GarageApi {
  final Dio _dio = Dio();

  GarageApi() {
    _dio.options.baseUrl = '${AppConstants.domainNode}';
    _dio.options.contentType = Headers.jsonContentType;
    _dio.options.responseType = ResponseType.json;
  }
  Future<List<GarageGetAll>> getAllGarages() async {
    try {
      Response response = await _dio
          .get('/garage', queryParameters: {'page': '1', 'pageSize': '5'});
      List<dynamic> _garageListData = response.data['rows'];
      List<GarageGetAll> _garageList =
          _garageListData.map((data) => GarageGetAll.fromJson(data)).toList();
      return _garageList;
    } catch (error) {
      Logger().e("Error getting Garage list: $error");
      throw error;
    }
  }

  Future<GarageDetail> getDetailGarage(int idGarage) async {
    try {
      Response response = await _dio.get('/garage/${idGarage}');
      dynamic _garageDetailData = response.data;
      GarageDetail garageDetail = GarageDetail.fromJson(_garageDetailData);
      return garageDetail;
    } catch (error) {
      Logger().e("Error getting Garage list: $error");
      throw error;
    }
  }
}
