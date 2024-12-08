import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class AppConnectivity {
  
  /// check Internet Connection Status
  static void checkInternetConnection(GlobalKey<NavigatorState> scaffoldKey) {
    InternetConnection().onStatusChange.listen((InternetStatus status) async {
      if (status == InternetStatus.disconnected) {
        showSnackBar(scaffoldKey.currentContext);
      }
    });
  }

  /// Show Snack Bar When not connection
  static void showSnackBar(context) {
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
