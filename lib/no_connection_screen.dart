import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({super.key});

  @override
  State<NoConnectionScreen> createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  var isDeviceConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () async {
              isDeviceConnected = await InternetConnection().hasInternetAccess;
              if (!isDeviceConnected) {
                log('Is not Connected');
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }
}
