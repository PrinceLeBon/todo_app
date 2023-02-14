import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';

class Boards_Widget extends StatefulWidget {
  final String boardName;
  final String user;
  final String color;
  final int numberOfTask;
  Boards_Widget({Key? key, required this.boardName, required this.user, required this.numberOfTask, required this.color}) : super(key: key);


  @override
  State<Boards_Widget> createState() => _Boards_WidgetState();
}

class _Boards_WidgetState extends State<Boards_Widget> {
  String photo ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfilePicture();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: hexToColor(widget.color), borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                    ),
                    Profile_Picture(taille: 50, image: photo)
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_control_sharp),
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Container(
              height: 10,
            ),
            Text('${widget.numberOfTask} Active Tasks'),
            Container(
              height: 10,
            ),
            Text(
              widget.boardName,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  Future<void> getProfilePicture() async {
    CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot =
    await userCollection.where("id", isEqualTo: widget.user).limit(1).get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> userFound = doc.data() as Map<String, dynamic>;
        setState(() {
          photo = userFound['photo'];
        });
      }
    } else {
      print('username non trouvé');
    }
  }
}
