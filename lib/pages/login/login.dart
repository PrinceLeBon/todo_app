import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/login/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email : ',
                          style: TextStyle(color: Colors.white)),
                      Container(
                        height: 10,
                      ),
                      TextFormField(
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                        controller: myController1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
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
                      const Text('Password : ',
                          style: TextStyle(color: Colors.white)),
                      Container(
                        height: 10,
                      ),
                      TextFormField(
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: myController2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.yellow[500],
                            ),
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
                    ],
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
                            'Log in',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Connexion();
                      }
                    },
                  ),
                  Container(
                    height: 20,
                  ),
                  InkWell(
                    child: Text(
                      'Forgot your password ?',
                      style: TextStyle(color: Colors.yellow[500]),
                    ),
                    onTap: () {},
                  ),
                  Container(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text("Don't have an account ?",
                          style: TextStyle(color: Colors.white)),
                      Container(
                        width: 10,
                      ),
                      InkWell(
                        child: Text(
                          'Create an account',
                          style: TextStyle(color: Colors.yellow[500]),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp()));
                        },
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Future Connexion() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: myController1.text.trim(),
          password: myController2.text.trim());
      print('${FirebaseAuth.instance.currentUser?.uid}');
    } on FirebaseAuthException catch (e) {
      print('Connection failure : $e');
    }
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
