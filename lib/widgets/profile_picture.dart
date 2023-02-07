import 'package:flutter/material.dart';

class Profile_Picture extends StatelessWidget {
  final double taille;
  final String image;
  const Profile_Picture({Key? key, required this.taille, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: taille,
      height: taille,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)
      ),
    );
  }
}
