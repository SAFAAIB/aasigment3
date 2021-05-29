import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatelessWidget {
  NewScreenArguments newScreenArguments;

  NewScreen({this.newScreenArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(newScreenArguments.taskName),
            Text('${newScreenArguments.taskIsComlete}')
          ],
        ),
      ),
    );
  }
}

class NewScreenArguments {
  String taskName;
  String taskIsComlete;

  NewScreenArguments({this.taskName, this.taskIsComlete});
}
