import 'package:ads/ads/admob_helper.dart'; 
import 'package:ads/screens/rewardedad.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialization;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ads Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RewardedAdsPage(),
    );
  }
}


