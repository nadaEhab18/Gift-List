import 'package:depi_gift_list/constant.dart';
import 'package:depi_gift_list/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GiftList());
}

class GiftList extends StatelessWidget {
  const GiftList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift List',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}

