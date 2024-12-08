import 'dart:async';
import 'dart:developer';
import 'package:check_internet2/core/secend_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
              title: Text(dotenv.env['FOO']!),
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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScendScreen()));
              },
              child: Text(
                dotenv.env['FOO']!,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
