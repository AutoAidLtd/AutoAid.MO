import 'package:autoaid/models/garage_getAll_model.dart';
import 'package:autoaid/utils/color.dart';
import 'package:autoaid/utils/textUtils.dart';
import 'package:autoaid/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.garage,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final GarageGetAll garage;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                // margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    getStorageUrl(garage.avatarUrl),
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                ),
              ),
            ),
            // AspectRatio(
            //   aspectRatio: 1.02,
            //   child: Container(
            //     padding: const EdgeInsets.all(20),
            //     decoration: BoxDecoration(
            //       color: kPrimaryColor.withOpacity(0.1),
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //     child: Image.asset(garage.avatarUrl),
            //   ),
            // ),
            const SizedBox(height: 8),
            textB(
              garage.name,
              // style: Theme.of(context).textTheme.bodyMedium,
              18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${truncateText(garage.address, 15)}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                // InkWell(
                //   borderRadius: BorderRadius.circular(50),
                //   onTap: () {},
                //   child: Container(
                //     padding: const EdgeInsets.all(6),
                //     height: 24,
                //     width: 24,
                //     decoration: BoxDecoration(
                //       color: kPrimaryColor.withOpacity(0.1),
                //       shape: BoxShape.circle,
                //     ),
                //     child: SvgPicture.asset(
                //       "assets/icons/Heart Icon_2.svg",
                //       colorFilter: ColorFilter.mode(
                //           const Color(0xFFFF4848), BlendMode.srcIn),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
