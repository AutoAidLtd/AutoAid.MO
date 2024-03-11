import 'package:autoaid/models/garage_detail_model.dart';
import 'package:autoaid/utils/palette.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/widgets/rating_widgets.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';

class ServiceGarageCard extends StatefulWidget {
  const ServiceGarageCard({
    Key? key,
    required this.service,
    required this.onServiceSelected,
  }) : super(key: key);

  final GarageService service;
  final Function(GarageService, bool) onServiceSelected;

  @override
  State<ServiceGarageCard> createState() => _ServiceGarageCardState();
}

class _ServiceGarageCardState extends State<ServiceGarageCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onServiceSelected(widget.service, _isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            _isSelected
                ? Icon(Icons.check_circle,
                    color: Colors.green) // Hiển thị dấu tích nếu được chọn
                : Icon(Icons
                    .radio_button_unchecked), // Hiển thị nút radio nếu chưa được chọn
            SizedBox(width: 10),
            containerBoxShadow(
              250,
              10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(widget.service.serviceName),
                  ]),
                  // textGrey500('18/09/2002', 10),
                  SB_WIDTH(10),
                  Text(widget.service.description),
                  SB_WIDTH(10),
                  Text(widget.service.price.toString() + ' VND'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
