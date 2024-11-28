import 'dart:async';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  @override
  void initState() {
    super.initState();
    // getConnectivity();
  }

  void getConnectivity() {
    // subscription =
    InternetConnection().onStatusChange.listen((InternetStatus status) async {
      // isDeviceConnected = await InternetConnection().hasInternetAccess;
      if (status == InternetStatus.disconnected) {
        showBoxDialog();
        log('dsssssssssss');
      }
    });
  }

  showBoxDialog() {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('No Connction'),
              content: const Text('Please check your internet Connction'),
              actions: [
                TextButton(
                  onPressed: () async {
                    setState(() {});
                    Navigator.pop(context);
                    isDeviceConnected =
                        await InternetConnection().hasInternetAccess;
                    if (!isDeviceConnected) {
                      log('Is not Connected');

                      showBoxDialog();
                    }
                  },
                  child: const Text('Ok'),
                )
              ],
            ));
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Check of internet Connection',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
