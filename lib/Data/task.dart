import 'package:lect_list/Data/db_helper.dart';

class Task{
  int id;
  String title;
  bool isComplete;

  Task(this.title,this.isComplete);
  Task.fromMap(Map map){
    this.id = map[DBHelper.columnId];
    this.title = map[DBHelper.columnTitle];
    this.isComplete = map[DBHelper.columnDone ] == 1 ? true : false ;
  }

  toMap(){
    return {
      DBHelper.columnTitle : this.title,
      DBHelper.columnDone : this.isComplete? 1 : 0,
    };
  }
}