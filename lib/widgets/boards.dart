import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';

class Boards_Widget extends StatefulWidget {
  final String boardName;
  final List<String> listUsers;
  final String color;
  final int numberOfTask;

  const Boards_Widget(
      {Key? key,
      required this.boardName,
      required this.listUsers,
      required this.numberOfTask,
      required this.color})
      : super(key: key);

  @override
  State<Boards_Widget> createState() => _Boards_WidgetState();
}

class _Boards_WidgetState extends State<Boards_Widget> {
  List<String> listPhotos = [''];

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
          color: hexToColor(widget.color),
          borderRadius: BorderRadius.circular(40)),
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
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                      child:
                          IconButton(onPressed: () {}, icon: const Icon(
                            Icons.add, color: Color.fromRGBO(5, 4, 43, 1),)),
                    ),
                    (listPhotos.isNotEmpty) ? SizedBox(
                      width: (listPhotos.length == 1)
                          ? 60
                          : (listPhotos.length == 2)
                              ? 90
                              : (listPhotos.length == 3)
                                  ? 120
                                  : (listPhotos.length == 4)
                                      ? 150
                                      : 180,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 10,
                            child: Profile_Picture(
                              taille: 50,
                              image: listPhotos[0],
                            ),
                          ),
                          (listPhotos.length >= 2)
                              ? Positioned(
                            left: 40,
                                  bottom: 0,
                                  child: Profile_Picture(
                                    taille: 50,
                                    image: listPhotos[1],
                                  ),
                                )
                              : Container(),
                          (listPhotos.length >= 3)
                              ? Positioned(
                            left: 70,
                                  bottom: 0,
                                  child: Profile_Picture(
                                    taille: 50,
                                    image: listPhotos[2],
                                  ),
                                )
                              : Container(),
                          (listPhotos.length >= 4)
                              ? Positioned(
                            left: 100,
                                  bottom: 0,
                                  child: Profile_Picture(
                                    taille: 50,
                                    image: listPhotos[3],
                                  ),
                                )
                              : Container(),
                          (listPhotos.length >= 5)
                              ? Positioned(
                            left: 130,
                                  bottom: 0,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(5, 4, 43, 1),
                                        shape: BoxShape.circle
                                    ),
                                    child: Center(
                                      child: Text('+${widget.listUsers.length-4}', style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ) : Container(),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                      color:  Colors.transparent,
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_control_sharp),
                    color: const Color.fromRGBO(5, 4, 43, 1),
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
    listPhotos.clear();
    CollectionReference userCollection =
        FirebaseFirestore.instance.collection("users");
    for (var user in widget.listUsers) {
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
}
