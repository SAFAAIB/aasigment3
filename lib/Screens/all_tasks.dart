import 'package:flutter/material.dart';
import 'package:lect_list/Data/Reprisitory.dart';
import 'package:lect_list/Data/task.dart';
import 'package:lect_list/Widgets/widget_task.dart';

class AllTasks extends StatelessWidget {
  Function delfunc;
  Function editfunc;
  List<Task> tasks;

  AllTasks(this.delfunc,this.editfunc, this.tasks);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return WidgetTask(
            tasks[index],
            delfunc,
            editfunc
          );
        },
      ),
    );
  }
}
