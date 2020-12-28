import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _frameworkVersion = '';

  Future<File> extractAsset(String assetPath) async {
    final ByteData bytes = await DefaultAssetBundle.of(context).load(assetPath);
    final Uint8List list = bytes.buffer.asUint8List();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempDocumentPath = '${tempDir.path}/$assetPath';
    final File file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return file;
  }

  void showDocument(BuildContext context) async {
    try {
      final assetUrl = await extractAsset("assets/A.pdf");
      Pspdfkit.present(assetUrl.path);
    } on PlatformException catch (e) {
      print("Failed to open document: '${e.message}'.");
    }
  }

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void initPlatformState() async {
    String frameworkVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      frameworkVersion = await Pspdfkit.frameworkVersion;
    } on PlatformException {
      frameworkVersion = 'Failed to get platform version. ';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _frameworkVersion = frameworkVersion;
    });

    // Replace
    Pspdfkit.setLicenseKey("YOUR_LICENSE_KEY_GOES_HERE");
  }

  void _openSettings(ScaffoldState scaffold) {
    scaffold.hideCurrentSnackBar();
    Pspdfkit.openAndroidSettings();
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text(
            'PSPDFKit Flutter example requires file system permissions to open a PDF document into the sdcard folder.'),
        action: SnackBarAction(
            label: 'Open Settings', onPressed: () => _openSettings(scaffold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return new MaterialApp(
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('PSPDFKit Flutter Plugin example app'),
          ),
          body: Builder(
            // Create an inner BuildContext so that the onPressed methods
            // can refer to the Scaffold with Scaffold.of().
            builder: (BuildContext context) {
              return Center(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    new Text('PSPDFKit for $_frameworkVersion\n',
                        style: themeData.textTheme.display1
                            .copyWith(fontSize: 21.0)),
                    new RaisedButton(
                        child: new Text('Tap to Open Document',
                            style: themeData.textTheme.display1
                                .copyWith(fontSize: 21.0)),
                        onPressed: () => showDocument(context))
                  ]));
            },
          )),
    );
  }
}
