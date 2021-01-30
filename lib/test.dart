import 'dart:io';

import 'package:akudamadrive/constants.dart';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var excel = null;
  List<String> dataList = [
    "Google",
    "loves",
    "Flutter",
    "and",
    "Flutter",
    "loves",
    "Google"
  ];
  _TestState() {
    excel = Excel.createExcel();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Klik Tombol Di Bawah'),
        FlatButton(
          color: kTextColor,
          textColor: Colors.white,
          child: Text('Klik Here'),
          onPressed: () {
            Sheet sheet = excel['SheetName'];
            var cell = sheet.cell(CellIndex.indexByString('A1'));
            // cell.value = 8; // dynamic values support provided;
            sheet.insertRowIterables(dataList, 8);
            // sheet.insertColumn(8);

            // printing cell-type
            // /data/user/0/com.example.akudamadrive/app_flutter
            print("CellType: " + cell.cellType.toString());
            _localPath.then((path) {
              excel.encode().then((onValue) {
                print(path);
                File("${path}/excel.xlsx")
                  ..createSync(recursive: true)
                  ..writeAsBytesSync(onValue);
              });
            });

            /// Inserting and removing column and rows
            // insert column at index = 8
          },
        )
      ],
    );
  }

  Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    final directory = await getExternalStorageDirectory();
    return directory.path;
  }
}
