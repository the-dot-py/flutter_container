import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_container/utils/routes.dart';
import 'package:flutter_container/view_model/complaint/student_complaint.dart';
import 'package:flutter_container/view_model/drawer/student_drawer.dart';
import 'package:flutter_container/view_model/services/session_manager.dart';


class StudentDashboardPage extends StatefulWidget {
  const StudentDashboardPage({super.key});

  @override
  State<StudentDashboardPage> createState() => _StudentDashboardPageState();
}

class _StudentDashboardPageState extends State<StudentDashboardPage> {
  Future<bool> onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => buildExitDialog(context),
    );
  }

  AlertDialog buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }
//   final controller = PersistentTabController(initialIndex: 0);
//   List<Widget> _buildScreen() {
//   return[
//     Text('Home'),
//     Text('Support'),
//     Text('Add'),
//     Text('Version'),
//     // StudentProfileScreen(),
//     StudentProfile(),
//
//   ];
// }
// List<PersistentBottomNavBarItem> _navBarItem(){
//     return[
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//         inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.help_outline_sharp,color: Colors.white,),
//           inactiveIcon: Icon(Icons.help_outline_sharp,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//           inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.home,color: Colors.white,),
//           inactiveIcon: Icon(Icons.home,color: Colors.grey,)
//
//       ),
//       PersistentBottomNavBarItem(
//           icon:Icon(Icons.person,color: Colors.white,),
//           inactiveIcon: Icon(Icons.person,color: Colors.grey,)
//
//       ),
//     ];
// }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child:
      Scaffold(
          appBar: AppBar(
            title: const Text("Student Dashboard"),
            actions:[
              IconButton(onPressed:(){
                FirebaseAuth auth =FirebaseAuth.instance;
                auth.signOut().then((value){
                  SessionController().userId = '' ;
                  Navigator.pop(context, MyRoutes.homeRoute);
                });
              }, icon:const Icon(Icons.login_outlined)),
            ],
          ),
          drawer: const StudentDrawer(),
          body:SafeArea(
            child: Material(
              child: Padding(
                padding:  const EdgeInsets.symmetric(vertical:30,horizontal: 5),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:25,vertical: 10),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            InkWell(
                              onTap: null,
                              child: Card(
                                color: Colors.blue.shade300,
                                child: const SizedBox(
                                  width: 140,height: 140,
                                  child: Center(child: Text("Complain",style:TextStyle(fontSize: 16,color: Colors.white))),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MyComplaint()));
                              },
                              child:Card(
                                color: Colors.blue.shade300,
                                child: const SizedBox(
                                  width: 140,height: 140,
                                  child: Center(child: Text("My Room",style:TextStyle(fontSize: 16,color: Colors.white))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            Card(
                              color: Colors.blue.shade300,
                              child: const SizedBox(
                                width: 140,height: 140,
                                child: Center(child: Text("Announcement",style:TextStyle(fontSize: 16,color: Colors.white))),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            Card(
                              color: Colors.blue.shade300,
                              child: const SizedBox(
                                width: 140,height: 140,
                                child: Center(child: Text("Track Complain",style:TextStyle(fontSize: 16,color: Colors.white))),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ),
                    const Spacer(),
                    CupertinoButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const MyComplaint()));
                    }, color: Colors.blue,child: const Text("Create Complaint",style:TextStyle(color: Colors.white),textScaleFactor: 1,textAlign: TextAlign.center,))
                  ],
                ),
              ),

            ),
          )
      ),
      // child: PersistentTabView(
      //   context,
      //   screens: _buildScreen(),
      //   items: _navBarItem(),
      //   backgroundColor: Colors.blue,
      //   decoration: NavBarDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   navBarStyle: NavBarStyle.style15,
      // ),
    );
  }
}

