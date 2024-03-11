import 'package:autoaid/data_api/garage_api.dart';
import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/garage_getAll_model.dart';

class GarageRepo {
  final GarageApi _garageApi;
  GarageRepo({required GarageApi garageApi}) : _garageApi = garageApi;

  Future<List<GarageGetAll>> getAllGarages() {
    return _garageApi.getAllGarages();
  }

  Future<GarageDetail> getGarageDetails(int idGarage) {
    return _garageApi.getDetailGarage(idGarage);
  }
}
