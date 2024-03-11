import 'package:autoaid/bloc/base_state.dart';
import 'package:autoaid/bloc/garage/garage_bloc.dart';
import 'package:autoaid/data_api/garage_api.dart';
import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/pages/book_flow/garage_page/review_garage_page.dart';
import 'package:autoaid/repositories/garage_repo.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/rating_widgets.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GarageInfoPage extends StatefulWidget {
  const GarageInfoPage({super.key, required this.idGarage});
  final String idGarage;

  @override
  State<GarageInfoPage> createState() => _GarageInfoPageState();
}

class _GarageInfoPageState extends State<GarageInfoPage> {
  final String garageName = 'Hoang Ha';
  final String urlCoverImage =
      'https://www.supercar-garage.de/wp-content/uploads/2022/11/IMG_6018-2-6-768x547.jpg';
  final String description =
      'Our comprehensive range of services includes routine maintenance such as oil changes, tire rotations, and brake inspections, as well as more extensive repairs like engine diagnostics and transmission overhauls. No matter the make or model of your vehicle, our expert mechanics are equipped to handle any issue efficiently and effectively.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent
          // title: const Text('gg'),
          // elevation: 0,
          // backgroundColor: Color(0x44000000),
          ),
      body: RepositoryProvider(
        create: (context) => GarageRepo(garageApi: GarageApi()),
        child: BlocProvider(
          create: (context) =>
              GarageBloc(RepositoryProvider.of<GarageRepo>(context))
                ..getGarageDetails(int.parse(widget.idGarage)),
          child: GarageDetailPage(
              urlCoverImage: urlCoverImage,
              garageName: garageName,
              description: description),
        ),
      ),
    );
  }
}

class GarageDetailPage extends StatelessWidget {
  const GarageDetailPage({
    super.key,
    required this.urlCoverImage,
    required this.garageName,
    required this.description,
  });

  final String urlCoverImage;
  final String garageName;
  final String description;

  @override
  Widget build(BuildContext context) {
    final myBloc = context.read<GarageBloc>();
    return BlocBuilder(
      bloc: myBloc,
      builder: (context, state) {
        if (state is CommonState) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.errorMessage != null) {
            return Center(child: Text(state.errorMessage!));
          } else if (state is CommonState<GarageDetail>) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                    height: 250,
                    child: Image.network(
                      state.model.avatarUrl,
                      fit: BoxFit.cover,
                    )),
                Center(
                  child: Column(
                    children: [
                      SB_HEIGHT(25),
                      textB('${state.model.name}', 30),
                      textN(state.model.address, 15),
                      SB_HEIGHT(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: textJustifyN(description, 14),
                      ),
                      SB_HEIGHT(25),
                      buttonGradientOrange(
                        'Schedule A Service Now   >',
                        () => {
                          context.push('/scheduleService', extra: state.model)
                        },
                      ),
                      SB_HEIGHT(25),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25.0),
                                  child: textB('Reviews', 20),
                                ),
                              ],
                            ),
                          ),
                          RatingWidget(4, 15, true),
                          SB_WIDTH(20),
                          textGrey500('(4.599 votes)', 10),
                          SB_WIDTH(20)
                        ],
                      ),
                      SB_HEIGHT(10),
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: ListReviews(),
                        ),
                      ),
                      buttonGradientOrange(
                          'Details', () => {context.push('/garageInfoDetail')}),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class ListReviews extends StatelessWidget {
  const ListReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext ctxt, int index) {
        return ReviewGaragePage();
      },
    );
  }
}
