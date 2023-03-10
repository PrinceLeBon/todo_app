import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/components/globals.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import '../widgets/packages/confirmation_slider.dart';

class View_Tasks extends StatefulWidget {
  final String id;
  final String boardName;
  final List<String> listPhotos;
  final String userName;
  final String userPicture;
  final String titre;
  final String description;
  final String etat;
  final DateTime date_de_creation;
  final DateTime date_pour_la_tache;
  final String heure_pour_la_tache;

  const View_Tasks(
      {Key? key,
      required this.id,
      required this.boardName,
      required this.listPhotos,
      required this.userName,
      required this.userPicture,
      required this.titre,
      required this.description,
      required this.etat,
      required this.date_de_creation,
      required this.date_pour_la_tache,
      required this.heure_pour_la_tache})
      : super(key: key);

  @override
  State<View_Tasks> createState() => _View_TasksState();
}

class _View_TasksState extends State<View_Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_yellow,
      appBar: AppBar(
        backgroundColor: global_yellow,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(5, 4, 43, 1), shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(5, 4, 43, 1), shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_control),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: const Color.fromRGBO(5, 4, 43, 1), width: 1)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Text(
                    widget.boardName,
                    style: const TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Text(
                widget.titre,
                style: const TextStyle(
                    color: Color.fromRGBO(
                      5,
                      4,
                      43,
                      1,
                    ),
                    fontSize: 60),
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Date & Time',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text('Assignee', style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.heure_pour_la_tache,
                        style: const TextStyle(
                            color: Color.fromRGBO(
                              5,
                              4,
                              43,
                              1,
                            ),
                            fontSize: 30),
                      ),
                      Text(
                        DateFormat('MMM d, yyyy')
                            .format(widget.date_pour_la_tache),
                        style: const TextStyle(
                            color: Color.fromRGBO(
                          5,
                          4,
                          43,
                          1,
                        )),
                      ),
                    ],
                  ),
                  (widget.listPhotos.isNotEmpty)
                      ? SizedBox(
                          width: (widget.listPhotos.length == 1)
                              ? 60
                              : (widget.listPhotos.length == 2)
                                  ? 90
                                  : (widget.listPhotos.length == 3)
                                      ? 120
                                      : (widget.listPhotos.length == 4)
                                          ? 150
                                          : 180,
                          height: 50,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Profile_Picture(
                                  taille: 50,
                                  image: widget.listPhotos[0],
                                ),
                              ),
                              (widget.listPhotos.length >= 2)
                                  ? Positioned(
                                      left: 30,
                                      bottom: 0,
                                      child: Profile_Picture(
                                        taille: 50,
                                        image: widget.listPhotos[1],
                                      ),
                                    )
                                  : Container(),
                              (widget.listPhotos.length >= 3)
                                  ? Positioned(
                                      left: 60,
                                      bottom: 0,
                                      child: Profile_Picture(
                                        taille: 50,
                                        image: widget.listPhotos[2],
                                      ),
                                    )
                                  : Container(),
                              (widget.listPhotos.length >= 4)
                                  ? Positioned(
                                      left: 90,
                                      bottom: 0,
                                      child: Profile_Picture(
                                        taille: 50,
                                        image: widget.listPhotos[3],
                                      ),
                                    )
                                  : Container(),
                              (widget.listPhotos.length >= 5)
                                  ? Positioned(
                                      left: 120,
                                      bottom: 0,
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                            color: Color.fromRGBO(5, 4, 43, 1),
                                            shape: BoxShape.circle),
                                        child: Center(
                                          child: Text(
                                            '+${widget.listPhotos.length - 4}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      : Container()
                ],
              ),
              Container(
                height: 20,
              ),
              const Text(
                'Additional Decription',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 20,
              ),
              Text(
                widget.description,
                style: const TextStyle(
                    color: Color.fromRGBO(
                  5,
                  4,
                  43,
                  1,
                )),
              ),
              Container(
                height: 20,
              ),
              const Text(
                'Created',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    '${DateFormat('MMM d').format(widget.date_de_creation)}, by ${widget.userName}',
                    style: const TextStyle(
                        color: Color.fromRGBO(
                      5,
                      4,
                      43,
                      1,
                    )),
                  ),
                  Profile_Picture(taille: 20, image: widget.userPicture)
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: (widget.etat == 'done' ) ?  Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child:  ConfirmationSlider(
          onConfirmation: (){},
        ),
      ) : Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child:  ConfirmationSlider(
          onConfirmation: setAsDone,
        ),
      ),
    );
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
}
