import 'dart:developer';
import 'package:check_internet2/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final GlobalKey<NavigatorState> _scaffoldKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getConnectivity();
  runApp(const MyApp());
}

void getConnectivity() {
  InternetConnection().onStatusChange.listen((InternetStatus status) async {
    // isDeviceConnected = await InternetConnection().hasInternetAccess;
    if (status == InternetStatus.disconnected) {
      log('dsssssssssss');
      showSnackBar(_scaffoldKey.currentContext);
    }
  });
}

void showSnackBar(context) {
  // Navigator.push(context,MaterialPageRoute(builder:(context)=>const NoConnectionScreen()));

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('Please check internet connection'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          print('Undo clicked');
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: _scaffoldKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
