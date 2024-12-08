import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class ScendScreen extends StatefulWidget {
  const ScendScreen({super.key});

  @override
  State<ScendScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ScendScreen> {
  // late StreamSubscription subscription;
  // var isDeviceConnected = false;
  // bool isActive = false;
  // @override
  // void initState() {
  //   super.initState();
  //   // getConnectivity();
  // }

  // void getConnectivity() {
  //   subscription =
  //       Connectivity().onConnectivityChanged.listen((connectivity) async {
  //     isDeviceConnected = await InternetConnection().hasInternetAccess;
  //     if (!isDeviceConnected && isActive == false) {
  //       showBoxDialog();
  //       log('Is Connected');
  //       setState(() {
  //         isActive = true;
  //       });
  //     }
  //   });
  // }

  // showBoxDialog() {
  //   return showCupertinoDialog(
  //       context: context,
  //       builder: (context) => CupertinoAlertDialog(
  //             title: const Text('No Connction'),
  //             content: const Text('Please check your internet Connction'),
  //             actions: [
  //               TextButton(
  //                   onPressed: () async {
  //                     isDeviceConnected =
  //                         await InternetConnection().hasInternetAccess;
  //                     if (isDeviceConnected) {
  //                       log('Is Connected');
  //                       setState(() {
  //                         isActive = false;
  // //                       });
  // //                     }
  // //                   },
  // //                   child: const Text('Ok'))
  // //             ],
  // //           ));
  // // }

  // @override
  // void dispose() {
  //   subscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Second Screen ',
          ),
        ],
      ),
    );
  }
}