import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import '../models/globals.dart';
import '../pages/login/login.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(5, 4, 43, 1),
      child: Container(
        margin: MediaQuery.of(context).padding,
        child: Padding(
          padding: const EdgeInsets.only(right: 30, left: 20, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child:
                    Profile_Picture(taille: 50, image: currentUser.photo),
                    onTap: () {
                      /*Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Profile()));*/
                    },
                  ),
                  Icon(Icons.blur_circular, color: Colors.yellow[500])
                ],
              ),
              Container(
                height: 20,
              ),
              Text(
                currentUser.nom + ' ' + currentUser.prenom,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Container(
                height: 5,
              ),
              Text(
                '@' + currentUser.username,
                style: TextStyle(color: Colors.white),
              ),
              Container(
                height: 10,
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.yellow[500],
              ),
              Container(
                height: 30,
              ),
              InkWell(
                child: _childDrawer1(Icons.person_outlined, 'Profil', 18),
                onTap: () {
                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Profile()));*/
                },
              ),
              Container(
                height: 20,
              ),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.yellow[500],
              ),
              Container(
                height: 30,
              ),
              InkWell(
                child: _childDrawer1(Icons.logout, 'Déconnexion', 18),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _childDrawer1(IconData icon, String label, double _size) {
    return Row(
      children: [
        Icon(icon, color: Colors.yellow[500]),
        Container(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _size,
              color: Colors.white),
        ),
      ],
    );
  }
}
