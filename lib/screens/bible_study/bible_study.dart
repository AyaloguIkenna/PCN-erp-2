import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:epub_viewer/epub_viewer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class BibleStudy extends StatefulWidget {
  @override
  _BibleStudy createState() => _BibleStudy();
}

class _BibleStudy extends State<BibleStudy> {
  bool loading = false;
  Dio dio = new Dio();

  @override
  void initState() {
    super.initState();
//    download();
  }

  download() async {
    if (Platform.isIOS) {
      print('download');
      await downloadFile();
    } else {
      loading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.withOpacity(0.7),
        title: const Text('Bible Study 2022'),
      ),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : TextButton(
                onPressed: () async {
                  Directory appDocDir =
                      await getApplicationDocumentsDirectory();
                  print('$appDocDir');

                  String iosBookPath = '${appDocDir.path}/7.epub';
                  print(iosBookPath);
                  //String androidBookPath = 'file:///android_asset/7.epub';
                  EpubViewer.setConfig(
                      themeColor: Theme.of(context).primaryColor,
                      identifier: "iosBook",
                      scrollDirection: EpubScrollDirection.VERTICAL,
                      allowSharing: true,
                      enableTts: true,
                      nightMode: false);
//                    EpubViewer.open(
//                      Platform.isAndroid ? androidBookPath : iosBookPath,
//                      lastLocation: EpubLocator.fromJson({
//                        "bookId": "2239",
//                        "href": "/OEBPS/ch06.xhtml",
//                        "created": 1539934158390,
//                        "locations": {
//                          "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
//                        }
//                      }),
//                    );

                  await EpubViewer.openAsset(
                    'assets/7.epub',
                    lastLocation: EpubLocator.fromJson({
                      "bookId": "2239",
                      "href": "/OEBPS/ch06.xhtml",
                      "created": 1539934158390,
                      "locations": {
                        "cfi": "epubcfi(/0!/4/4[simple_book]/2/2/6)"
                      }
                    }),
                  );
                  // get current locator
                  EpubViewer.locatorStream.listen((locator) {
                    print(
                        'LOCATOR: ${EpubLocator.fromJson(jsonDecode(locator))}');
                  });
                },
                child: Center(
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Click to Read',
                        style:
                            TextStyle(fontSize: 30, color: Colors.deepPurple),
                      ),
                    ),
                    Container(
                        // padding: EdgeInsets.only(left: 20.0,right: 20.0, top: 30, bottom: 30),
                        height: 400,
                        width: 300,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                image: AssetImage("assets/cover.jpeg"),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.white.withOpacity(0.1),
                                    BlendMode.darken)

                                //child: Icon(Icons.auto_stories,size: 200,),

                                //  width: 300,
                                ))),
                  ]),
                ),
              ),
      ),
    );
  }

  Future downloadFile() async {
    print('download1');
    //Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([PermissionGroup.storage]);

    // if (await Permission.storage.isGranted) {
    //   await Permission.storage.request();
    //   await startDownload();
    // } else {
    //   await startDownload();
    //  }
    //}
  }
}
