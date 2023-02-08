import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/boards.dart';
import 'package:todo_app/widgets/custom_drawer.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/tasks.dart';

import '../models/boards.dart';
import '../models/globals.dart';
import '../models/task.dart';
import '../models/user.dart';
import 'add_tasks_boards_pages.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController? controller;
  int tasksOrBoards = 1;
  int days = 1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfilePicture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
      drawer: const CustomDrawer(),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Color.fromRGBO(5, 4, 43, 1),
              //const Color.fromRGBO(5, 4, 43, 1),
              expandedHeight: 300,
              leading: Padding(
                padding: EdgeInsets.only(left: 10),
                child: InkWell(
                  child: Profile_Picture(
                    taille: 50,
                    image: currentUser.photo,
                  ),
                  onTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                ),
              ),
              actions: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                    color: Colors.white,
                  ),
                ),
                Container(width: 3),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
                Container(width: 20),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 40),
                          (DateTime.now().hour >= 12)
                              ? (DateTime.now().hour >= 18)
                                  ? const Text(
                                      'Good \nEvening',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 60,
                                          letterSpacing: 2),
                                    )
                                  : const Text('Good \nAfternoon',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 60,
                                          letterSpacing: 2))
                              : const Text('Good \nMorning',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 60,
                                      letterSpacing: 2)),
                          Container(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Today\'s ${DateFormat('EEEE').format(DateTime.now())}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  Text(
                                      DateFormat('MMM d, yyyy')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    '75% done',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  const Text('Completed Tasks',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              expandedHeight: (tasksOrBoards == 1) ? 170 : 80,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
              backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
              leading: Icon(Icons.menu),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: (tasksOrBoards == 1)
                                      ? Colors.white
                                      : Color.fromRGBO(5, 4, 43, 1),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: (tasksOrBoards == 1)
                                          ? Color.fromRGBO(5, 4, 43, 1)
                                          : Colors.white,
                                      width: (tasksOrBoards == 1) ? 0 : 1)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Text(
                                  '12',
                                  style: TextStyle(
                                      color: (tasksOrBoards == 1)
                                          ? Color.fromRGBO(5, 4, 43, 1)
                                          : Colors.white,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Container(width: 10),
                            const Text(
                              'Tasks',
                              style: TextStyle(letterSpacing: 2),
                            )
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            tasksOrBoards = 1;
                          });
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color:
                            (tasksOrBoards == 1) ? Colors.white : Colors.grey,
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: (tasksOrBoards == 1)
                                      ? Color.fromRGBO(5, 4, 43, 1)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: (tasksOrBoards == 1)
                                          ? Colors.white
                                          : Colors.transparent,
                                      width: (tasksOrBoards == 1) ? 1 : 0)),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                      color: (tasksOrBoards == 1)
                                          ? Colors.white
                                          : Color.fromRGBO(5, 4, 43, 1),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                            Container(width: 10),
                            const Text(
                              'Boards',
                              style: TextStyle(letterSpacing: 2),
                            )
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            tasksOrBoards = 2;
                          });
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color:
                            (tasksOrBoards != 1) ? Colors.white : Colors.grey,
                      )
                    ],
                  )),
                ],
              ),
              flexibleSpace: (tasksOrBoards == 1)
                  ? FlexibleSpaceBar(
                      background: Padding(
                        padding: EdgeInsets.only(top: 100, right: 20, left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Container(
                                    height: 35,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(40),
                                        border: Border.all(
                                            color: Colors.blueAccent,
                                            width: 1)),
                                    child: const Center(
                                      child: Text(
                                        'Boards',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      child: Container(
                                        height: 35,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Active',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 35,
                                        width: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            border: Border.all(
                                                color: Colors.blueAccent,
                                                width: 1)),
                                        child: const Center(
                                          child: Text(
                                            'Done',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Container(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Mon',
                                      style: TextStyle(
                                          color: (days == 1)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Tue',
                                      style: TextStyle(
                                          color: (days == 2)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Wed',
                                      style: TextStyle(
                                          color: (days == 3)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Thu',
                                      style: TextStyle(
                                          color: (days == 4)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Fri',
                                      style: TextStyle(
                                          color: (days == 5)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Sat',
                                      style: TextStyle(
                                          color: (days == 6)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: InkWell(
                                      child: Center(
                                    child: Text(
                                      'Sun',
                                      style: TextStyle(
                                          color: (days == 7)
                                              ? Colors.white
                                              : Colors.grey),
                                    ),
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
            (tasksOrBoards == 1)
                ? StreamBuilder<List<Task_Model>>(
                    stream: readTasks(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something has wrong! ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        final List<Task_Model> listTasks = snapshot.data!;
                        if (listTasks.isEmpty) {
                          return const Center(
                              child: Text(
                            'No Tasks',
                            style: TextStyle(color: Colors.white),
                          ));
                        } else {
                          return SliverAnimatedList(
                            itemBuilder: (_, index, ___) {
                              return const Padding(
                                padding: EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Tasks(),
                              );
                            },
                            initialItemCount: listTasks.length,
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: Color(0xFFF1FF0A)),
                        );
                      }
                    })
                : StreamBuilder<List<Board_Model>>(
                stream: readBoards(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something has wrong! ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final List<Board_Model> listBoards = snapshot.data!;
                    if (listBoards.isEmpty) {
                      return const Center(
                          child: Text(
                            'No Boards',
                            style: TextStyle(color: Colors.white),
                          ));
                    } else {
                      return SliverAnimatedList(
                        itemBuilder: (_, index, ___) {
                          return const Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, bottom: 10),
                            child: Boards(),
                          );
                        },
                        initialItemCount: listBoards.length,
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: Color(0xFFF1FF0A)),
                    );
                  }
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddTasksBoardsPage()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> getProfilePicture() async {
    final String userId = (FirebaseAuth.instance.currentUser?.uid)!;
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot =
        await userCollection.where("id", isEqualTo: userId).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      print('username trouvé');
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> userFound = doc.data() as Map<String, dynamic>;
        setState(() {
          currentUser = Users(
              userFound['id'],
              userFound['nom'],
              userFound['prenom'],
              userFound['photo'],
              userFound['date_de_naissance'],
              userFound['username'],
              userFound['email']);
        });
      }
    } else {
      print('username non trouvé');
    }
  }

  Stream<List<Task_Model>> readTasks() => FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.id)
      .collection('tasks')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Task_Model.fromJson(doc.data())).toList());

  Stream<List<Board_Model>> readBoards() => FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.id)
      .collection('boards')
      .orderBy("titre")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Board_Model.fromJson(doc.data()))
          .toList());
}
