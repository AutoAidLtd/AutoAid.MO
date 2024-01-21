import 'package:autoaid/pages/book_flow/garage_page/review_garage_page.dart';
import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/rating_widgets.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GarageInfoPage extends StatefulWidget {
  const GarageInfoPage({super.key});

  @override
  State<GarageInfoPage> createState() => _GarageInfoPageState();
}

class _GarageInfoPageState extends State<GarageInfoPage> {
  final String garageName = 'Hoang Ha';
  final String urlCoverImage =
      'https://www.supercar-garage.de/wp-content/uploads/2022/11/IMG_6018-2-6-768x547.jpg';
  final String description =
      'Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('gg'),
        elevation: 0,
        backgroundColor: Color(0x44000000),
      ),
      // body: Column(
      //   children: <Widget>[],
      // ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
              height: 250,
              child: Image.network(
                urlCoverImage,
                fit: BoxFit.cover,
              )),
          Center(
            child: Column(children: [
              SB_HEIGHT(25),
              textB('$garageName Garage', 30),
              textN('District 1, HCMC', 15),
              SB_HEIGHT(25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: textJustifyN(description, 14),
              ),
              SB_HEIGHT(25),
              Row(
                children: [
                  Expanded(
                      child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: textB('Reviews', 20),
                    ),
                  ])),
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
                  child: ListReview(),
                ),
              ),
              buttonGradientOrange(
                  'Details', () => {context.push('/garageInfoDetail')}),
            ]),
          ),
        ],
      ),
    );
  }
}

class ListReview extends StatelessWidget {
  const ListReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Text('hehe');
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
