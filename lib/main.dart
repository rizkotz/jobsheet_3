import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;

  konversi() {
    setState(() {
      inputUser = double.parse(etInput.text);
      kelvin = inputUser + 273;
      reamur = 4 / 5 * inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: etInput,
                decoration: const InputDecoration(
                    hintText: 'Masukkan Suhu Dalam Celcius'),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Suhu dalam Reamour",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '$reamur',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Suhu dalam Kelvin",
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        '$kelvin',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  onPressed: konversi,
                  color: Colors.lightBlue,
                  textColor: Colors.white,
                  child: Text("Konversi suhu"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
