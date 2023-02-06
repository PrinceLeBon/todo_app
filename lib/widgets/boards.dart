import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';

class Boards extends StatelessWidget {
  const Boards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue[200], borderRadius: BorderRadius.circular(40)),
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
                    Profile_Picture(taille: 50)
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
            const Text('2 Active Tasks'),
            Container(
              height: 10,
            ),
            const Text(
              'Myself',
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
}
