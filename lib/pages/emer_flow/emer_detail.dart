import 'package:autoaid/models/approve_response.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';

class EmerDetailScreen extends StatefulWidget {
  const EmerDetailScreen({super.key, required this.approveResponeDto});
  final ApproveResponeDto approveResponeDto;

  @override
  State<EmerDetailScreen> createState() => _EmerDetailScreenState();
}

class _EmerDetailScreenState extends State<EmerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency Detail')),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: containerBoxShadow(
              250,
              30,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textB('Congratulations, you have found the garage!', 13),
                  SB_HEIGHT(10),
                  textB('Emerency Case Id:', 20),
                  textN('  ${this.widget.approveResponeDto.uid}', 20),
                  SB_HEIGHT(10),
                  textB('Number:', 20),
                  textN('  ${this.widget.approveResponeDto.no}', 20),
                  SB_HEIGHT(10),
                  textB('Vehicle:', 20),
                  Row(
                    children: [
                      textN('  ${this.widget.approveResponeDto.vehicle.type}',
                          20),
                      textN(
                          '  - ${this.widget.approveResponeDto.vehicle.brand}',
                          20),
                    ],
                  ),
                  textN(
                      '  Vehicle No: ${this.widget.approveResponeDto.vehicle.verhicleNo}',
                      20),
                  SB_HEIGHT(10),
                  textB('Customer:', 20),
                  Row(
                    children: [
                      textN(
                          '  ${this.widget.approveResponeDto.customer.firstName} ',
                          20),
                      textN(
                          this.widget.approveResponeDto.customer.lastName, 20),
                    ],
                  )
                ],
              )),
        ),
      ]),
    );
  }
}
