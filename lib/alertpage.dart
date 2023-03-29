import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'details',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              children: [
                Text('Select the Blood Group  '),
                BloodGroup(),
              ],
            ),
            Row(
              children: [
                Text('Select the receving hospital '),
                Hospitals(),
              ],
            ),
            Material(
              elevation: 20,
              child: InkWell(
                  child: Ink(
                    height: 30,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('go to home page'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> bloodgroups = <String>[
  'O',
  'O+',
  'O-',
  'A+',
  'A-',
  'B+',
  'B-',
];

const List<String> hospitalslist = <String>[
  'KGH',
  'GIMSR',
  'Apollo Ramnagar',
  'Medicover',
  'SevenHills'
];

class BloodGroup extends StatefulWidget {
  const BloodGroup({super.key});
  @override
  State<BloodGroup> createState() => _BloodGroup();
}

class _BloodGroup extends State<BloodGroup> {
  String dropdownValue = bloodgroups.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: bloodgroups.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});
  @override
  State<Hospitals> createState() => _Hospitals();
}

class _Hospitals extends State<Hospitals> {
  String dropdownValue = hospitalslist.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: hospitalslist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
