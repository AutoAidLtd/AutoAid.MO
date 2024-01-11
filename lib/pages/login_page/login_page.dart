import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/textField.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            alignedNumberTextField('Nhập số điện thoại của bạn'),
            const SizedBox(height: 16.0),
            alignedGradientButton(
                'Login',
                () => {
                      performLogin(context, phoneNumberController.text),
                    })
          ],
        ),
      ),
    );
  }

  void performLogin(BuildContext context, String phoneNumber) {
    if (true) {
      context.go('/home');
    } else {
      // Nếu số điện thoại không hợp lệ, hiển thị thông báo lỗi
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text(
                'Invalid phone number. Please enter a valid phone number.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
