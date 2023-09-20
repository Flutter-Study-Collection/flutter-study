import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'feature/common/base_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nfc Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Nfc Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with BaseInterface {
  var _nfcResult = "";

  void _initNfc(BuildContext context) {
    NfcManager.instance.isAvailable().then((isAvailable) async {
      if (!isAvailable) {
        if (Navigator.canPop(context)) {
          if (Platform.isAndroid) {
            final isNotCanceled = await showDialog(context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Activate NFC\n(Standard Mode)\non your phone\nbefore you can use it."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text("turn on".toUpperCase()),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: Text("cancel".toUpperCase()),
                      ),
                    ],
                  );
                });
            if(isNotCanceled) {
              PackageInfo packageInfo =
              await PackageInfo.fromPlatform();
              String buildNumber = packageInfo.buildNumber;
              int buildNumberInt =
                  int.tryParse(buildNumber) ?? 0;

              if (Platform.isAndroid &&
                  buildNumberInt >= 29) {
                AppSettings.openAppSettingsPanel(
                    AppSettingsPanelType.nfc);
              } else {
                AppSettings.openAppSettings(
                    type: AppSettingsType.nfc);
              }
            }
            return;
          }
          throw "NFC is not available in this device or disabled temporarily.";
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listenNfc(onDiscovered: (tag) {
      setState(() {
        _nfcResult = tag.uid;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _initNfc(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'NFC result: $_nfcResult',
            ),
          ],
        ),
      )
    );
  }
}
