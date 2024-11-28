import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class AppConnectivity {

  static void getConnectivity(GlobalKey<NavigatorState> scaffoldKey) {
    InternetConnection().onStatusChange.listen((InternetStatus status) async {
      // isDeviceConnected = await InternetConnection().hasInternetAccess;
      if (status == InternetStatus.disconnected) {
        log('dsssssssssss');
        showSnackBar(scaffoldKey.currentContext);
      }
    });
  }

  static void showSnackBar(context) {
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
}
