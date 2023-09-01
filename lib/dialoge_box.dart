import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/mybutton.dart';

class dialogbox extends StatelessWidget {
  VoidCallback? onsave;
  VoidCallback? oncancle;
  final controller;
  dialogbox(
      {required this.controller, required this.onsave, required this.oncancle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 130,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: 'Add a new task',
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.green)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  mybutton(text: 'Save', onPressed: onsave),
                  SizedBox(
                    width: 8,
                  ),
                  mybutton(text: 'Cancle', onPressed: oncancle)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
