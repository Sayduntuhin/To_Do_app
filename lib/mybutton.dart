import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mybutton extends StatelessWidget{

  final String text;
  VoidCallback? onPressed;


  mybutton({
   required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
   return MaterialButton(onPressed: onPressed,
   color:  Colors.tealAccent.shade100,
   child: Text(text),
   );
  }
}