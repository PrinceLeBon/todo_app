import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/user.dart';

Users currentUser = Users(
    'id', 'nom', 'prenom', 'photo', 'date_de_naissance', 'username', 'email');

Color? global_yellow = Colors.yellow[200];
Color? global_blue = Colors.blue[200];
