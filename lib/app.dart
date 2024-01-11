import 'package:autoaid/routes/router.dart';
import 'package:flutter/material.dart';

class AutoAid extends StatefulWidget {
  const AutoAid({super.key});

  @override
  State<AutoAid> createState() => _AutoAidState();
}

class _AutoAidState extends State<AutoAid> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
