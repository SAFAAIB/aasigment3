import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lect_list/Data/task.dart';

class WidgetTask extends StatelessWidget {
  Task task;
  Function delfunc;
  Function editFun;

  WidgetTask(this.task , this.delfunc , this.editFun);

  // String imageUrl;
  // double width;
  // double height;
  //
  // MyContainer({
  //   this.imageUrl,
  //   this.width = 200,
  //   this.height = 200,
  // });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: task.isComplete
            ? Colors.greenAccent.withOpacity(0.6)
            : Colors.redAccent.withOpacity(0.6),
      ),
      child: ListTile(
        title: Text(task.title),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            delfunc(task);
          },
        ),
        trailing: Checkbox(
          value: task.isComplete,
          onChanged: (value) {
            editFun(task);
          },
        ),
      ),
    );
    // return Container(
    //   // margin: EdgeInsets.only( left: 15, right: 15 ,top: 10 ),
    //   width: width,
    //   height: height,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15),
    //     image: DecorationImage(
    //       image: AssetImage(imageUrl),
    //       fit: BoxFit.cover,
    //       colorFilter: ColorFilter.mode(
    //         Colors.black.withOpacity(0.5),
    //         BlendMode.darken,
    //       ),
    //     ),
    //   ),
    // );
  }
}
