import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todotile extends StatelessWidget{

  final String taskname;
  final bool taskcomplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteiteme;

todotile({
    super.key,
    required this.taskname,
    required this.taskcomplete,
    required this.onChanged,
  required this.deleteiteme,
  }) ;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      child: Slidable (
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
                SlidableAction(
                    onPressed: deleteiteme,
                    icon: Icons.delete_rounded,
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(11),

                )

          ],


        ),

        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Checkbox(
                  value: taskcomplete,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Text(
                    taskname,
                    style: TextStyle(decoration: taskcomplete  ? TextDecoration.lineThrough : TextDecoration.none),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius:  BorderRadius.circular(11)
          ),


        ),
      ),
    );

  }

}