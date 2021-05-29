import 'package:flutter/material.dart';
import 'package:lect_list/Data/task.dart';
import 'package:lect_list/Widgets/widget_task.dart';

class InCompleteTasks extends StatelessWidget {
  Function delfunc;
  Function editfunc;
  List<Task> tasks;

  InCompleteTasks(this.delfunc,this.editfunc, this.tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tasks.where((element) => !element.isComplete).length,
        itemBuilder: (context, index) {
          return WidgetTask(
            tasks.where((element) => !element.isComplete).toList()[index],
            delfunc,
            editfunc
          );
        },
      ),
    );
  }
}
