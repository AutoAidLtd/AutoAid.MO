import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/palette.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  final double coverHeight = 200.0;
  final double profileHeight = 180.0;
  final String urlProfileImage =
      'https://bucksfire.gov.uk/wp-content/uploads/2020/04/Biker-down.jpg';

  @override
  Widget build(BuildContext context) {
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CoverImageZone(coverHeight),
                  Positioned(
                    top: top,
                    child: ProfileImageZone(urlProfileImage, profileHeight),
                  ),
                ],
              ),
              SB_HEIGHT(100),
              const Text(
                'Vicky Hladynets',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SB_HEIGHT(40),
              Container(
                width: 300,
                height: 500,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: [
                    UserLine(
                      contentText: 'Edit Profile',
                      index: 0,
                    ),
                    UserLine(
                      contentText: 'Settings',
                      index: 1,
                    ),
                    UserLine(
                      contentText: 'Support',
                      index: 1,
                    ),
                    UserLine(
                      contentText: 'Order History',
                      index: 1,
                    ),
                    UserLine(
                      contentText: 'Suscriptions',
                      index: 2,
                    ),
                    SB_HEIGHT(40),
                    buttonGradientOrange('Log out', () => {print('hehe')})
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class UserLine extends StatefulWidget {
  const UserLine({super.key, required this.contentText, required this.index});

  final String contentText;
  final int index;

  @override
  State<UserLine> createState() => _UserLineState();
}

class _UserLineState extends State<UserLine> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('1234');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        decoration: (widget.index == 1)
            ? const BoxDecoration(
                // Các user line nằm ở giữa
                color: Colors.white,
                //không bo góc cạnh trên user line
                border: Border(
                  left: BorderSide(color: Colors.grey, width: 0.5),
                  right: BorderSide(color: Colors.grey, width: 0.5),
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              )
            : (widget.index == 0)
                ? BoxDecoration(
                    // Top User line nằm ở đầu
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  )
                : const BoxDecoration(
                    // Bottom User line nằm ở cuối
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Colors.grey, width: 0),
                      left: BorderSide(color: Colors.grey, width: 0.5),
                      right: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SB_WIDTH(1),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                widget.contentText,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

Widget CoverImageZone(height) => Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            secondaryColor,
          ], // Thay đổi màu sắc gradient tùy chọn
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );

Widget ProfileImageZone(urlProfileImage, profileHeight) => CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: (profileHeight / 2) - 10,
        backgroundImage: NetworkImage(
          urlProfileImage,
        ),
      ),
    );
