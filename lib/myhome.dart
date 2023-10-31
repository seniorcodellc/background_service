import 'package:background_service/screen1.dart';
import 'package:background_service/screen2.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String email = '';
  String phone = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("email is $email"),
              SizedBox(
                height: 30,
              ),
              Text("phone is $phone"),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Map data = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Screen2(),
                        ));
                    email = data["email"];
                    phone = data["phone"];
                    setState(() {});
                  },
                  child: Text("get data"))
            ],
          ),
        ),
      ),
    );
  }
}
