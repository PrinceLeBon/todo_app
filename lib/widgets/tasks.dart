import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/components/list_user_board.dart';
import 'package:todo_app/models/globals.dart';
import 'package:todo_app/widgets/profile_picture.dart';

import '../pages/view_tasks.dart';

class Task_Widget extends StatefulWidget {
  final String id;
  final String id_board;
  final String id_user;
  final String titre;
  final String description;
  final String etat;
  final DateTime date_de_creation;
  final DateTime date_pour_la_tache;
  final String heure_pour_la_tache;

  const Task_Widget(
      {Key? key,
      required this.id,
      required this.id_board,
      required this.id_user,
      required this.titre,
      required this.description,
      required this.etat,
      required this.date_de_creation,
      required this.date_pour_la_tache,
      required this.heure_pour_la_tache})
      : super(key: key);

  @override
  State<Task_Widget> createState() => _Task_WidgetState();
}

class _Task_WidgetState extends State<Task_Widget> {
  List<String> listPhotos = [''];
  String boardName = '';
  String userName = '';
  String userPicture = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBoardInformation();
    getCreatorOfThisTaskInformation(widget.id_user);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: global_yellow, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListUserInABoard(listPhotos: listPhotos),
                  Row(
                    children: [
                      Text(
                        getTimeOfTasks(widget.heure_pour_la_tache),
                        style:
                            const TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                      ),
                      Container(
                        width: 10,
                      ),
                      (widget.etat == "loading")
                          ? Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blueGrey,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: setAsDone,
                                icon: const Icon(Icons.done),
                                color: const Color.fromRGBO(
                                  5,
                                  4,
                                  43,
                                  1,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Text(
                boardName,
                style: const TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.titre,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(5, 4, 43, 1)),
                  ),
                  (widget.etat == "done")
                      ? Row(
                          children: [
                            const Text('Done'),
                            Container(width: 5),
                            Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(5, 4, 43, 1),
                                  shape: BoxShape.circle),
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
              Container(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => View_Tasks(
                id: widget.id,
                boardName: boardName,
                listPhotos: listPhotos,
                userName: userName,
                userPicture: userPicture,
                titre: widget.titre,
                description: widget.description,
                etat: widget.etat,
                date_de_creation: widget.date_de_creation,
                date_pour_la_tache: widget.date_pour_la_tache,
                heure_pour_la_tache:
                    getTimeOfTasks(widget.heure_pour_la_tache))));
      },
    );
  }

  Future<void> getBoardInformation() async {
    listPhotos.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.id)
        .collection("boards")
        .where("titre", isEqualTo: widget.id_board)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> boardFound = doc.data() as Map<String, dynamic>;
        setState(() {
          getProfilesPictures(List<String>.from(boardFound["listOfAssignee"]));
          boardName = boardFound["titre"];
        });
      }
    } else {
      print('board not found');
    }
  }

  Future<void> getProfilesPictures(List<String> l) async {
    listPhotos.clear();
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection("users");
    for (var user in l) {
      QuerySnapshot querySnapshot =
          await userCollection.where("id", isEqualTo: user).limit(1).get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> userFound = doc.data() as Map<String, dynamic>;
          setState(() {
            listPhotos.add(userFound['photo']);
          });
        }
      } else {
        print('username non trouvé');
      }
    }
  }

  String getTimeOfTasks(String time) {
    List<String> heureParts = time.split(':');
    TimeOfDay heure = TimeOfDay(
        hour: int.parse(heureParts[0]), minute: int.parse(heureParts[1]));

    return (DateFormat.Hm().format(DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            heure.hour,
            heure.minute)))
        .replaceAll(":", "h");
  }

  Future<void> getCreatorOfThisTaskInformation(String id_creator) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where("id", isEqualTo: id_creator)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> userFound = doc.data() as Map<String, dynamic>;
        setState(() {
          userName = userFound['username'];
          userPicture = userFound['photo'];
        });
      }
    } else {
      print('Creator Of This TaskInformation not found');
    }
  }

  void setAsDone() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.id)
        .collection('tasks')
        .doc(widget.id)
        .update({'etat': 'done'}).onError((error, stackTrace) => print(
            'Error updating state of this tasks Boards document: $error'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Set As Done')),
    );
  }
}
