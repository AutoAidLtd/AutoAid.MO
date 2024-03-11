import 'package:autoaid/bloc/garage/garage_bloc.dart';
import 'package:autoaid/data_api/garage_api.dart';
import 'package:autoaid/pages/home_page/components/SliverSearchAppBar.dart';
import 'package:autoaid/pages/home_page/components/categories.dart';
import 'package:autoaid/pages/home_page/components/home_banner.dart';
import 'package:autoaid/pages/home_page/components/pop_product/garage_list.dart';
import 'package:autoaid/pages/home_page/components/special_offers.dart';
import 'package:autoaid/repositories/garage_repo.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/constants.dart';
import 'package:autoaid/utils/socket_management/socket.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SocketManager socketManager;
  @override
  void initState() {
    socketManager = SocketManager()..setContext(context);
    super.initState();
  }

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const SliverPersistentHeader(
            delegate: SliverSearchAppBar(),
            pinned: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (BuildContext context, int index) {
              return Container(
                  // margin: const EdgeInsets.all(8),
                  // padding: const EdgeInsets.all(16),
                  child: Column(
                children: [
                  DiscountBanner(),
                  Categories(),
                  SpecialOffers(),
                  SizedBox(height: 20),
                  // GARAGE_LIST
                  RepositoryProvider(
                    create: (context) => GarageRepo(garageApi: GarageApi()),
                    child: BlocProvider(
                      create: (context) =>
                          GarageBloc(RepositoryProvider.of<GarageRepo>(context))
                            ..getAllGarages(),
                      child: GarageList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      squareButton('Emergency', () => context.go('/map')),
                      squareButton('emer booking', () {
                        context.push('/emergencyBooking');
                        // SocketManager().userSendRequest();
                      }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      squareButton(
                          'Go to Garage', () => context.push('/garageInfo')),
                      squareButton('Test API', () => testDioApi()),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.black),
                    child: const SizedBox(
                      height: 1000,
                    ),
                  ),
                  const Text('out ot scope')
                ],
              ));
            },
          ))
        ],
      ),
    );
  }

  void testDioApi() async {
    final dio = Dio();
    print('button press');
    final res = await dio.get('https://autoaid.wyvernp.id.vn/garage',
        queryParameters: {'page': 1, 'pageSize': 1});
    // final res = dio.get(AppConstants.domainNode + '/garage',
    //     queryParameters: {'page': '1', 'pageSize': '1'});
    print(res.data['rows']);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
