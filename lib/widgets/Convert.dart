import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Convert extends StatelessWidget {
  const Convert({Key? key, required this.konversiSuhu}) : super(key: key);
  final Function konversiSuhu;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(40),
      ),
      onPressed: () {
        konversiSuhu();
      },
      child: Text('Konversi Suhu'),
    );
  }
}
