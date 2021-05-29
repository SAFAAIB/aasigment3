import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lect_list/Data/db_helper.dart';
import 'package:lect_list/Screens/all_tasks.dart';
import 'package:lect_list/Screens/complete_tasks.dart';
import 'package:lect_list/Screens/incomplete-tasks.dart';
import 'package:lect_list/Screens/new_screen.dart';
import 'package:lect_list/Screens/spalsh_screen.dart';
import 'package:lect_list/Widgets/widget_task.dart';

import 'Data/task.dart';

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
    // onGenerateRoute: (RouteSettings routeSettings){
    //   String name = routeSettings.name;
    //   List<String> routeParts = name.split('/');
    //   dynamic args = routeSettings.arguments;
    //
    //   if (routeParts[0] == 'ss'){
    //     NewScreenArguments newScreenArguments = NewScreenArguments(
    //       taskName: routeParts[1],
    //       taskIsComlete: routeParts[2]
    //     );
    //     return MaterialPageRoute(builder: (context){
    //       return NewScreen(newScreenArguments: newScreenArguments,);
    //     });
    //   }
    // },
  ));
}

// class MyApp extends StatelessWidget {
//   List<MyContainer> slider = [
//     MyContainer(
//       imageUrl: 'images/photo1.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo2.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo3.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo4.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo5.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo6.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo3.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo2.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo4.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo5.jpg',
//     ),
//     MyContainer(
//       imageUrl: 'images/photo6.jpg',
//     ),
//   ];
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           margin: EdgeInsets.only( left: 15, right: 15 ,top: 10 ,bottom: 10),
//           child: GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount ,
//             itemCount: slider.length,
//             itemBuilder: (context, index) {
//               return MyContainer(
//                 imageUrl: slider[index].imageUrl,
//               );
//             },
//             // separatorBuilder: (context, index) {
//             //   return (index + 1) % 3 == 0
//             //       ? Text(
//             //           'Hello',
//             //           style: TextStyle(
//             //             fontSize: 30,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //           textAlign: TextAlign.center,
//             //         )
//             //       : SizedBox();
//             // },
//           ),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<StatefulWidget>
    with SingleTickerProviderStateMixin {
  String title = '';
  List<Task> allTasks;

  // String title1 = 'First title';
  // String title2 = 'Second title';
  // bool press = false;
  int index = 0;
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    getAllFunction();
  }

  deleteFunction(Task task) async {
    await DBHelper.dbHelper.deleteTask(task.id);
    await getAllFunction();
  }

  editFunction(Task task) async {
    await DBHelper.dbHelper.upDateTask(task);
    await getAllFunction();
  }

  getAllFunction() async {
    List<Task> tasks = await DBHelper.dbHelper.getAllTasks();
    this.allTasks = tasks;
    setState(() {});
  }

  addFunc(Task task) async {
    await DBHelper.dbHelper.insertTask(task);
    await getAllFunction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
        // bottom: TabBar(
        //   tabs: [
        //     Tab(text : "News", icon: Icon (Icons.list),),
        //     Tab(text : "Profile" , icon: Icon (Icons.person),),
        //     Tab(text : "Favourite" , icon: Icon (Icons.favorite),),
        //   ],
        // ),
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text(
      //       press ? title2 : title1,
      //       textAlign: TextAlign.center,
      //       style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontSize: 25,
      //       ),
      //     ),
      //     Container(
      //       margin: EdgeInsets.all(20),
      //       height: 50,
      //       child: ElevatedButton(
      //         onPressed: () {
      //           press = !press;
      //
      //           setState(() {});
      //         },
      //         child: Text(
      //           'change title',
      //           textAlign: TextAlign.center,
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 25,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      // drawer: Drawer(
      //   child: Column(
      //     children: [
      //       UserAccountsDrawerHeader(
      //         accountName: Text("SAFAA"),
      //         accountEmail: Text("safaa.ib.albanna@gmail.com"),
      //         currentAccountPicture: CircleAvatar(
      //           child: Text(''),
      //           backgroundColor: Colors.white,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('News'),
      //         subtitle: Text('go to News'),
      //         leading: Icon(Icons.list),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         onTap: () {
      //           controller.animateTo(0);
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Favourite'),
      //         subtitle: Text('go to Favourite'),
      //         leading: Icon(Icons.favorite),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         onTap: () {
      //           controller.animateTo(2);
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Profile'),
      //         subtitle: Text('go to Profile'),
      //         leading: Icon(Icons.person),
      //         trailing: Icon(Icons.arrow_forward_ios),
      //         onTap: () {
      //           controller.animateTo(1);
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: allTasks == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : TabBarView(
              // physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                AllTasks(deleteFunction, editFunction, allTasks),
                CompleteTasks(deleteFunction, editFunction, allTasks),
                InCompleteTasks(deleteFunction, editFunction, allTasks),
              ],
            ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        child: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "All Tasks",
              icon: Icon(Icons.list),
            ),
            Tab(
              text: "Complete Tasks",
              icon: Icon(Icons.done),
            ),
            Tab(
              text: "InComplete Tasks",
              icon: Icon(Icons.close),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addFunc(Task('Hello', false));
          // Navigator.pushNamed(context, 'ss/safaa/true');
          // Reprisitory.tasks.add(Task(title: 'New task' , discription: 'this is a new task' , isComplete: false));
          setState(() {});
        },
        child: Icon(Icons.create),
      ),
      // Center(
      //   child: Text(
      //     title,
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 25,
      //     ),
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorite',
      //     ),
      //   ],
      //   onTap: (i) {
      //     index = i;
      //     setState(() {});
      //   },
      //   currentIndex: index,
      // ),
    );
  }
}
