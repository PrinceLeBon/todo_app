import 'package:flutter/material.dart';

class Great extends StatelessWidget {
  const Great({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (DateTime.now().hour >= 12)
        ? (DateTime.now().hour >= 18)
            ? const Text(
                'Good \nEvening',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 60, letterSpacing: 2),
              )
            : const Text('Good \nAfternoon',
                style: TextStyle(
                    color: Colors.blueAccent, fontSize: 60, letterSpacing: 2))
        : const Text('Good \nMorning',
            style: TextStyle(
                color: Colors.blueAccent, fontSize: 60, letterSpacing: 2));
  }
}
