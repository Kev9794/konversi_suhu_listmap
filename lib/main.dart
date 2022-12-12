import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu_listmap/widgets/Input.dart';
import 'package:konversi_suhu_listmap/widgets/Result.dart';
import 'package:konversi_suhu_listmap/widgets/Convert.dart';
import 'package:konversi_suhu_listmap/widgets/DropdownKonversi.dart';
import 'package:konversi_suhu_listmap/widgets/RiwayatKonversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  TextEditingController Celcius = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double farenheit = 0;
  double reamor = 0;
  String newValue = "Kelvin";
  double result = 0;
  String changeValue = " ";
  var listItem = ["Kelvin", "Farenheit", "Reamur"];
  List<String> listViewItem = <String>[];
  void dropdownOnChanged(String changeValue) {
    setState(() {
      newValue = changeValue;
    });
  }

  void konversiSuhu() {
    setState(() {
      inputUser = double.parse(Celcius.text);
      if (newValue == "Kelvin")
        result = inputUser + 273;
      else if (newValue == "Farenheit")
        result = inputUser * (9 / 5);
      else
        result = inputUser * (4 / 5);
      listViewItem.add(newValue + " : " + result.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu-2041720091-Kevin Natanael Wijaya"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(children: [
            Input(Celcius: Celcius),
            DropdownKonversi(
                dropdownOnChanged: dropdownOnChanged,
                changeValue: changeValue,
                listItem: listItem,
                newValue: newValue),
            Result(result: result),
            Convert(konversiSuhu: konversiSuhu),
            Container(
              margin: EdgeInsets.all(8),
              child: Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Expanded(
              child: RiwayatKonversi(listViewItem: listViewItem),
            ),
          ]),
        ),
      ),
    );
  }
}
