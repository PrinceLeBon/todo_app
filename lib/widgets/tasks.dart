import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfilesPictures();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: global_yellow, borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Profile_Picture(taille: 50, image: currentUser.photo),
                  Row(
                    children: [
                      Text(
                        '14h30',
                        style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.done),
                          color: Color.fromRGBO(
                            5,
                            4,
                            43,
                            1,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              const Text(
                'Myself',
                style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
              ),
              Container(
                height: 10,
              ),
              const Text(
                'Go to library',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(5, 4, 43, 1)),
              ),
              Container(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const View_Tasks()));
      },
    );
  }

  Future<void> getProfilesPictures() async {
    listPhotos.clear();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.id)
        .collection("boards")
        .where("id", isEqualTo: widget.id_board)
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> boardFound = doc.data() as Map<String, dynamic>;
        setState(() {
          listPhotos =  List<String>.from(boardFound["listOfAssignee"]);
          boardName = boardFound["titre"];
        });
      }
    } else {
      print('board not found');
    }
  }
}
