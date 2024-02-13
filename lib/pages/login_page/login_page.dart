import 'package:autoaid/utils/button.dart';
import 'package:autoaid/utils/widgets/size_box.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import '../../bloc/auth/auth_bloc.dart';

class SignInPhonePage extends StatefulWidget {
  const SignInPhonePage({super.key});

  @override
  State<SignInPhonePage> createState() => _SignInPhonePageState();
}

class _SignInPhonePageState extends State<SignInPhonePage> {
  bool isLoggedAsKitchen = false;

  final TextEditingController phoneController =
      TextEditingController(text: '0981 088 602');

  Country selectedCountry = Country(
    phoneCode: '84',
    countryCode: 'VN',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Vietnam',
    example: 'Vietnam',
    displayName: 'Vietnam',
    displayNameNoCountryCode: 'VN',
    e164Key: '',
  );

  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      SB_HEIGHT(40),
                      const Text(
                        'AUTO AID! USER',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // color: Theme.of(context).colorScheme.primary,
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Tham gia nền tảng\n Auto Aid bằng số điện thoại',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                          child: Text(
                            'SỐ ĐIỆN THOẠI',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                      child: TextFormField(
                        cursorColor: Colors.purple,
                        controller: phoneController,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        onChanged: (value) {
                          setState(() {
                            phoneController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Nhập số điện thoại',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.grey.shade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black12),
                          ),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    countryListTheme:
                                        const CountryListThemeData(
                                      bottomSheetHeight: 550,
                                    ),
                                    onSelect: (value) {
                                      setState(() {
                                        selectedCountry = value;
                                      });
                                    });
                              },
                              child: Text(
                                '${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          suffixIcon: phoneController.text.length > 9
                              ? Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                  ),
                                  child: const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                    SB_HEIGHT(40),
                    SizedBox(
                      width: 350,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        // child: buttonGradientOrange(
                        //     'Login', () => context.go('/home')),
                        child: ButtonOrange(
                          title: 'Login',
                          onPressed: () => sendPhoneNumber(),
                          icon: null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text('Hoặc'),
                    const SizedBox(height: 10),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void sendPhoneNumber() async {
    // final prefs = await SharedPreferences.getInstance();
    String phoneNumber = phoneController.text.trim();
    Logger().i('LOGIN BUTTON PRESSED');
    AuthBloc().loginWithPhone(
        context: context,
        phoneNumber:
            "+${selectedCountry.phoneCode}${phoneNumber.substring(1)}");
  }
}
