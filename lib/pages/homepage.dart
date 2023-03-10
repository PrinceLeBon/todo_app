import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/HomePage/great.dart';
import 'package:todo_app/widgets/HomePage/todayDate.dart';
import 'package:todo_app/widgets/boards.dart';
import 'package:todo_app/widgets/custom_drawer.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import 'package:todo_app/widgets/tasks.dart';
import '../models/boards.dart';
import '../components/globals.dart';
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
  int numberOfTasksToday = 0;
  int numberOfBoards = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference userRef = FirebaseFirestore.instance.collection("users");
  CollectionReference taskRef = FirebaseFirestore.instance
      .collection("users")
      .doc(currentUser.id)
      .collection("tasks");

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
              backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
              expandedHeight: 300,
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
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
                    icon: const Icon(Icons.add),
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
                          const Great(),
                          Container(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TodayDate(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FutureBuilder(
                                      future: getNumberOfTaskDone(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final int number = snapshot.data!;
                                          return Text(
                                            '$number% done',
                                            style:
                                                TextStyle(color: Colors.white),
                                          );
                                        } else {
                                          return const Text('');
                                        }
                                      }),
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
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
              backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
              leading: const Icon(Icons.menu),
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
                                      : const Color.fromRGBO(5, 4, 43, 1),
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: (tasksOrBoards == 1)
                                          ? const Color.fromRGBO(5, 4, 43, 1)
                                          : Colors.white,
                                      width: (tasksOrBoards == 1) ? 0 : 1)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Text(
                                  numberOfTasksToday.toString(),
                                  style: TextStyle(
                                      color: (tasksOrBoards == 1)
                                          ? const Color.fromRGBO(5, 4, 43, 1)
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
                                      ? const Color.fromRGBO(5, 4, 43, 1)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      color: (tasksOrBoards == 1)
                                          ? Colors.white
                                          : Colors.transparent,
                                      width: (tasksOrBoards == 1) ? 1 : 0)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 10, right: 10),
                                child: Text(
                                  numberOfBoards.toString(),
                                  style: TextStyle(
                                      color: (tasksOrBoards == 1)
                                          ? Colors.white
                                          : const Color.fromRGBO(5, 4, 43, 1),
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
                        padding: const EdgeInsets.only(
                            top: 100, right: 20, left: 20),
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
                                    ),
                                    onTap: () {
                                      setState(() {
                                        days = 1;
                                      });
                                    },
                                  ),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 2;
                                        });
                                      }),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 3;
                                        });
                                      }),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 4;
                                        });
                                      }),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 5;
                                        });
                                      }),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 6;
                                        });
                                      }),
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
                                      ),
                                      onTap: () {
                                        setState(() {
                                          days = 7;
                                        });
                                      }),
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
                    stream: readTasks(days),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        if (kDebugMode) {
                          print('Something has wrong! ${snapshot.error}');
                        }
                        return SliverToBoxAdapter(
                          child: Text('Something has wrong! ${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        final List<Task_Model> listTasks = snapshot.data!;
                        if (listTasks.isEmpty) {
                          return const SliverToBoxAdapter(
                            child: Center(
                                child: Text(
                              'No Tasks for this day',
                              style: TextStyle(color: Colors.white),
                            )),
                          );
                        } else {
                          return SliverAnimatedList(
                            itemBuilder: (_, index, ___) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: Task_Widget(
                                    id: listTasks[index].id,
                                    id_board: listTasks[index].id_board,
                                    id_user: listTasks[index].id_user,
                                    titre: listTasks[index].titre,
                                    description: listTasks[index].description,
                                    etat: listTasks[index].etat,
                                    date_de_creation:
                                        listTasks[index].date_de_creation,
                                    date_pour_la_tache:
                                        listTasks[index].date_pour_la_tache,
                                    heure_pour_la_tache:
                                        listTasks[index].heure_pour_la_tache),
                              );
                            },
                            initialItemCount: listTasks.length,
                          );
                        }
                      } else {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(
                                color: Colors.yellow[200]),
                          ),
                        );
                      }
                    })
                : StreamBuilder<List<Board_Model>>(
                    stream: readBoards(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                          child: Text('Something has wrong! ${snapshot.error}'),
                        );
                      } else if (snapshot.hasData) {
                        final List<Board_Model> listBoards = snapshot.data!;
                        if (listBoards.isEmpty) {
                          return const SliverToBoxAdapter(
                            child: Center(
                                child: Text(
                              'No Boards',
                              style: TextStyle(color: Colors.white),
                            )),
                          );
                        } else {
                          return SliverAnimatedList(
                            itemBuilder: (_, index, ___) {
                              return FutureBuilder(
                                  future: getNumberOfTaskInOneBoard(
                                      listBoards[index].titre),
                                  builder: (context, snaphotss) {
                                    if (snaphotss.hasData) {
                                      final int numberOfTasks = snaphotss.data!;
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 10),
                                        child: Boards_Widget(
                                          boardName: listBoards[index].titre,
                                          listUsers:
                                              listBoards[index].listOfAssignee,
                                          numberOfTask: numberOfTasks,
                                          color: listBoards[index].couleur,
                                          idBoard: listBoards[index].id,
                                        ),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.yellow[200]),
                                      );
                                    }
                                  });
                            },
                            initialItemCount: listBoards.length,
                          );
                        }
                      } else {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: CircularProgressIndicator(
                                color: Colors.yellow[200]),
                          ),
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
    QuerySnapshot querySnapshot = await userRef
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
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
      if (kDebugMode) {
        print('Current user not found');
      }
    }
  }

  Future<int> getNumberOfTaskInOneBoard(String nameOfThisBoard) async {
    int number = 0;
    QuerySnapshot querySnapshot = await taskRef
        .where("id_board", isEqualTo: nameOfThisBoard)
        .where("etat", isEqualTo: "loading")
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      number = querySnapshot.size;
      return number;
    } else {
      return number;
    }
  }

  Future<int> getNumberOfTaskDone() async {
    Timestamp dateOfToday = Timestamp.fromDate(DateTime(DateTime.now().year,
        DateTime.now().month, DateTime.now().day, 0, 0, 0));

    Timestamp dateOfTodayLimit = Timestamp.fromDate(
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(const Duration(days: 1)));

    QuerySnapshot querySnapshot = await taskRef
        .where("date_pour_la_tache", isGreaterThanOrEqualTo: dateOfToday)
        .where("date_pour_la_tache", isLessThan: dateOfTodayLimit)
        .get();
    int totalTasks = querySnapshot.size;
    int completedTasks =
        querySnapshot.docs.where((doc) => doc["etat"] == "done").length;

    return (totalTasks == 0) ? 0 : (completedTasks * 100 ~/ totalTasks);
  }

  Stream<List<Task_Model>> readTasks(int day) {
    int initialNumberOfTasks = 0;

    DateTime dateOfToday = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0, 0);

    Timestamp dateOfTargetDay = Timestamp.fromDate(
        dateOfToday.add(Duration(days: day - dateOfToday.weekday)));

    Timestamp dateOfTargetDayLimit = Timestamp.fromDate(dateOfToday
        .add(Duration(days: day - dateOfToday.weekday))
        .add(const Duration(days: 1)));

    return userRef
        .doc(currentUser.id)
        .collection('tasks')
        .where('date_pour_la_tache', isGreaterThanOrEqualTo: dateOfTargetDay)
        .where('date_pour_la_tache', isLessThan: dateOfTargetDayLimit)
        .snapshots()
        .map((snapshot) {
      final changes = snapshot.docChanges;
      final List<Task_Model> tasks = [];
      changes.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          /// Add a new Board_Model if a document is added
          tasks.add(Task_Model.fromJson(change.doc.data()!));
        } else if (change.type == DocumentChangeType.modified) {
          // Modify the corresponding Board_Model if a document is modified
          int index = tasks.indexWhere((board) => board.id == change.doc.id);
          if (index != -1) {
            tasks[index] = Task_Model.fromJson(change.doc.data()!);
          }
        } else if (change.type == DocumentChangeType.removed) {
          // Delete the corresponding Board_Model if a document is deleted
          tasks.removeWhere((board) => board.id == change.doc.id);
        }
      });
      // Update the number of boards
      setState(() {
        numberOfTasksToday = initialNumberOfTasks + tasks.length;
      });

      // Return the updated list of Board_Model
      return tasks;
    });
  }

  Stream<List<Board_Model>> readBoards() {
    int initialNumberOfBoards = 0;
    return userRef
        .doc(currentUser.id)
        .collection('boards')
        .orderBy("titre")
        .snapshots()
        .map((snapshot) {
      // Use the docChanges function to retrieve only the modified data
      final changes = snapshot.docChanges;
      final List<Board_Model> boards = [];

      changes.forEach((change) {
        if (change.type == DocumentChangeType.added) {
          // Add a new Board_Model if a document is added
          boards.add(Board_Model.fromJson(change.doc.data()!));
        } else if (change.type == DocumentChangeType.modified) {
          // Modify the corresponding Board_Model if a document is modified
          int index = boards.indexWhere((board) => board.id == change.doc.id);
          if (index != -1) {
            boards[index] = Board_Model.fromJson(change.doc.data()!);
          }
        } else if (change.type == DocumentChangeType.removed) {
          // Delete the corresponding Board_Model if a document is deleted
          boards.removeWhere((board) => board.id == change.doc.id);
        }
      });
      // Update the number of boards
      setState(() {
        numberOfBoards = initialNumberOfBoards + boards.length;
      });
      // Return the updated list of Board_Model
      return boards;
    });
  }
}
