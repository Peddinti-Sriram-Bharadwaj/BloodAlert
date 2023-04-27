import 'package:flutter/material.dart';
import 'alertpage.dart';
import 'registerpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('error firebase not initialized');
    // Handle the error accordingly, e.g., show an error message or take appropriate action.
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MaterialApp(
    title: 'landing page',
    home: Mainpage(),
  ));
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Alert',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Blood alert'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Material(
                elevation: 30,
                child: InkWell(
                  autofocus: true,
                  child: Ink(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text('Request for Blood'),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AlertPage()));
                  },
                ),
              ),
              Material(
                elevation: 20,
                child: InkWell(
                  autofocus: true,
                  child: Ink(
                    height: 100,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        'become a blood donor',
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
