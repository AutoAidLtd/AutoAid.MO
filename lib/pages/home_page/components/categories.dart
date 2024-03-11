import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/emer.svg", "text": "Emergency"},
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoryCard(
            icon: "assets/icons/emer.svg",
            text: "Emergency",
            press: () => context.go('/map'),
          ),
          CategoryCard(
            icon: "assets/icons/Flash Icon.svg",
            text: "Flash Deal",
            press: () => context.go('/map'),
          ),
          CategoryCard(
            icon: "assets/icons/Bill Icon.svg",
            text: "Garage",
            press: () => context.push('/garageInfo'),
          ),
          CategoryCard(
            icon: "assets/icons/Gift Icon.svg",
            text: "Daily Gift",
            press: () => context.go('/map'),
          ),
          CategoryCard(
            icon: "assets/icons/Discover.svg",
            text: "More",
            press: () => context.go('/map'),
          ),
        ],
        // children: List.generate(
        //   categories.length,
        //   (index) => CategoryCard(
        //     icon: categories[index]["icon"],
        //     text: categories[index]["text"],
        //     press: () {},
        //   ),
        // ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
