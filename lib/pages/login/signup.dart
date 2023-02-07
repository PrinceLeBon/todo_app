import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../models/user.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late File image = File('');
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime _date = DateTime.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: MediaQuery.of(context).padding,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InkWell(
                      child: Stack(
                        children: [
                          Positioned(
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: Color(0xFFF1FF0A),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(File(image.path)),
                                        fit: BoxFit.cover)),
                              )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                              child: Center(
                                child: const Icon(Icons.camera_alt,
                                    color: Color(0xFFF1FF0A)),
                              ),
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        pickImage(ImageSource.gallery);
                      },
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Nom : ',
                            style: TextStyle(color: Colors.white)),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          controller: myController1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon:
                              Icon(Icons.person, color: Color(0xFFF1FF0A)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Prénoms : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          controller: myController2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon:
                            Icon(Icons.person, color: Color(0xFFF1FF0A)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.blueAccent),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Username : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          controller: myController3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon:
                              Icon(Icons.person, color: Color(0xFFF1FF0A)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Date de naissance : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          readOnly: true,
                          controller: myController4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1920),
                                        builder: (context, child) {
                                          return Theme(
                                              data: Theme.of(context)
                                                  .copyWith(
                                                colorScheme:
                                                ColorScheme.light(
                                                  primary:
                                                  Color(0xFFF1FF0A),
                                                  // <-- SEE HERE
                                                  onPrimary:
                                                  Colors.black,
                                                  // <-- SEE HERE
                                                  onSurface: Colors
                                                      .black, // <-- SEE HERE
                                                ),
                                                textButtonTheme:
                                                TextButtonThemeData(
                                                  style:
                                                  TextButton.styleFrom(
                                                    primary: Colors
                                                        .black, // button text color
                                                  ),
                                                ),
                                              ),
                                              child: child!);
                                        },
                                        lastDate: DateTime.now(),
                                        initialEntryMode:
                                        DatePickerEntryMode.calendar)
                                        .then((value) {
                                      setState(() {
                                        _date = value!;
                                        myController4.text =
                                            DateFormat('dd-MM-yyyy')
                                                .format(_date);
                                      });
                                    });
                                  },
                                  icon: const Icon(Icons.date_range,
                                      color: Color(0xFFF1FF0A))),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Email : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          controller: myController5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon:
                              Icon(Icons.mail, color: Color(0xFFF1FF0A)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Password : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: TextStyle(fontSize: 13, color: Colors.white),
                          obscureText: true,
                          obscuringCharacter: '*',
                          controller: myController6,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password,
                                  color: Color(0xFFF1FF0A)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blueGrey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blueAccent),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 10,
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Vous avez déjà un compte ?',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: 10,
                        ),
                        InkWell(
                          child: Text(
                            'Connectez vous',
                            style: TextStyle(color: Color(0xFFF1FF0A)),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Login()));
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                    ),
                    InkWell(
                      child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Color(0xFFF1FF0A),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: Text(
                              'S\'inscrire',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Inscription();
                        }
                      },
                    ),
                    Container(
                      height: 10,
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Future Inscription() async {
    CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await userCollection
        .where("username", isEqualTo: myController3.text.trim())
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
            Text("Le nom d'utilisateur existe déjà choisissez un autre")),
      );
    } else {
      print("Le nom d'utilisateur n'existe pas");
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ));
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: myController5.text.trim(),
            password: myController6.text.trim());
        addUserToFirebase(Users(
            'id',
            myController1.text.trim(),
            myController2.text.trim(),
            image.path,
            myController4.text.trim(),
            myController3.text.trim(),
            myController5.text.trim()));
      } on FirebaseAuthException catch (e) {
        print('Echec dans la sélection de limage: $e');
      }
      FirebaseAuth.instance.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  Future addUserToFirebase(Users user) async {
    final String userId = (FirebaseAuth.instance.currentUser?.uid)!;
    final docUser = FirebaseFirestore.instance.collection('users').doc(userId);
    final ref = FirebaseStorage.instance
        .ref()
        .child('usersimages')
        .child('$userId.jpg');
    await ref.putFile(image);
    user.id = docUser.id;
    user.photo = await ref.getDownloadURL();
    final json = user.toJson();
    await docUser.set(json);
  }

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      final imageTemporary = File(_image.path);
      setState(() {
        image = imageTemporary;
        print(image.path);
      });
    } on PlatformException catch (e) {
      print('Echec dans la sélection de limage: $e');
    }
  }
}
