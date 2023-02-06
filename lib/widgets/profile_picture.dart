import 'package:flutter/material.dart';

class Profile_Picture extends StatelessWidget {
  final double taille;
  const Profile_Picture({Key? key, required this.taille}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: taille,
      height: taille,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}
