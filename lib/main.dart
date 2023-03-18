import 'package:flutter/material.dart';

void main() {
  runApp(BloodAlert());
}

class BloodAlert extends StatelessWidget {
  const BloodAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Alert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Blood alert'),
        ),
        body: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Material(
                elevation: 20,
                child: InkWell(
                  child: Ink(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(child: Text('Request for Blood')),
                  ),
                  onTap: () {},
                )),
            Material(
                elevation: 20,
                child: InkWell(
                  child: Ink(
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                          child: Text(
                        'become a blood donor',
                      ))),
                  onTap: () {},
                ))
          ],
        )),
      ),
    );
  }
}
