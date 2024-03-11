import 'package:autoaid/pages/home_page/components/background_wave.dart';
import 'package:autoaid/pages/home_page/components/search_bar.dart';
import 'package:flutter/widgets.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 40;

    return Stack(
      children: [
        const BackgroundWave(
          height: 280,
        ),
        // AnimatedOpacity(
        //   duration: Duration(milliseconds: 300), // Thời gian chuyển đổi opacity
        //   opacity: 1,
        //   child: Image.asset(
        //     'assets/images/logo.png',
        //     height: 100, // Thiết lập chiều cao mong muốn cho hình ảnh
        //     fit: BoxFit
        //         .cover, // Thay đổi phương thức căn chỉnh hình ảnh tùy thuộc vào nhu cầu của bạn
        //   ),
        // ),
        Positioned(
          top: topPadding + offset,
          left: 16,
          right: 16,
          child: const SearchBar(),
        )
      ],
    );
  }

  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
