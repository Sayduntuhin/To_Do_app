import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Home%20page.dart';

class Spleshscreen extends StatefulWidget {
  @override
  State<Spleshscreen> createState() => _SpleshscreenState();
}

class _SpleshscreenState extends State<Spleshscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.tealAccent.shade100,
        child: Center(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined),
                Text(
          'MY TO DO',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
        ),
              ],
            )),
      ),
    );
  }
}
