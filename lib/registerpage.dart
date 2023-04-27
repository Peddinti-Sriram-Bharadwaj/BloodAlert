import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseReference users =
        FirebaseDatabase.instance.reference().child("users");
    return MaterialApp(
        title: 'New user registration',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('New User Registration'),
          ),
          body: Center(
              child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter Name',
                    hintText: 'Name'),
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Enter mobile number',
                    hintText: 'mobile number'),
              ),
              Text('Select the availible area  '),
              Areas(),
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
                        child: Text('submit'),
                      ),
                    ),
                    onTap: () {
                      users.set('new user added');
                    }),
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
          )),
        ));
  }
}

class Areas extends StatefulWidget {
  const Areas({super.key});
  @override
  State<Areas> createState() => _Areas();
}

const List<String> areas = <String>[
  'MuraliNagar',
  'Madhavadhara',
  'Siripuram',
  'Endada',
  'Rushikonda',
];

class _Areas extends State<Areas> {
  String dropdownValue = areas.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.brown),
      underline: Container(
        height: 2,
        color: Colors.brown,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: areas.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
