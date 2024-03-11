import 'package:autoaid/bloc/base_cubit.dart';
import 'package:autoaid/bloc/base_state.dart';
import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/models/garage_getAll_model.dart';
import 'package:autoaid/repositories/garage_repo.dart';
import 'package:here_sdk/search.dart';
import 'package:logger/logger.dart';

class GarageBloc extends BaseCubit {
  GarageBloc(this._garageRepository) : super(InitialState());
  final GarageRepo _garageRepository;
  void init() {}

  Future<void> getAllGarages() async {
    try {
      emit(
        CommonState(
          null,
          isLoading: true,
        ),
      );
      final garages = await _garageRepository.getAllGarages();
      Logger().i('garages length ${garages.length}');
      emit(
        CommonState<List<GarageGetAll>>(
          garages,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        CommonState(
          null,
          isLoading: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> getGarageDetails(int idGarage) async {
    try {
      emit(CommonState(
        null,
        isLoading: true,
      ));
      final detailsGarage = await _garageRepository.getGarageDetails(idGarage);

      emit(CommonState<GarageDetail>(
        detailsGarage,
        isLoading: false,
      ));
    } catch (e) {
      emit(CommonState(
        null,
        isLoading: false,
        errorMessage: e.toString(),
      ));
    }
  }
}




// return BlocBuilder(
//         bloc: myBloc,
//         builder: (context, state) {
//           if (state is CommonState) {
//             if (state.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             if (state.errorMessage != null) {
//               return Center(child: Text(state.errorMessage!));
//             } else if (state is CommonState<List<Kitchen>>) {
//               return SizedBox(
//                 height: 200,
//                 width: double.infinity,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: state.model.length,
//                   // itemCount: 10,
//                   itemBuilder: (context, index) {
                    
//                   },
//                 ),
//               );
//             }
//             return Container();
//           }
//           return const Center(child: CircularProgressIndicator());
//         });
