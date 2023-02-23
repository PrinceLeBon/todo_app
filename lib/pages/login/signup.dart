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
            padding: const EdgeInsets.all(20),
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
                                color: Colors.yellow[500],
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
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(5, 4, 43, 1),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(Icons.camera_alt,
                                    color: Colors.yellow[500]),
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
                        const Text('Last Name : ',
                            style: TextStyle(color: Colors.white)),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          controller: myController1,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.yellow[500]),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'First Name : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          controller: myController2,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your fist name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: Colors.yellow[500]),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
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
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          controller: myController3,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.person, color: Colors.yellow[500]),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                        Container(
                          height: 20,
                        ),
                        const Text(
                          'Birthdate : ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          readOnly: true,
                          controller: myController4,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please choose your birth day';
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
                                                        const ColorScheme.light(
                                                      primary: Color.fromRGBO(
                                                          5, 4, 43, 1),
                                                      onPrimary: Colors.white,
                                                      onSurface: Colors.black,
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
                                  icon: Icon(Icons.date_range,
                                      color: Colors.yellow[500])),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
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
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          controller: myController5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon:
                                  Icon(Icons.mail, color: Colors.yellow[500]),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
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
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          obscureText: true,
                          obscuringCharacter: '*',
                          controller: myController6,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password,
                                  color: Colors.yellow[500]),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
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
                        const Text(
                          'Already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          width: 10,
                        ),
                        InkWell(
                          child: Text(
                            'Log In',
                            style: TextStyle(color: Colors.yellow[500]),
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
                              color: Colors.yellow[500],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                            child: Text(
                              'Sign up',
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
            content: Text("The username already exists choose another one")),
      );
    } else {
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
        print('Failed to add user: $e');
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
    await docUser
        .set(json)
        .onError((e, _) => print("Error writing users document: $e"));
    ;
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
      print('Failure to select the image: $e');
    }
  }
}
