import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';

import '../pages/view_tasks.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow[500], borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Profile_Picture(taille: 50),
                  Row(
                    children: [
                      Text('14h30', style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),),
                      Container(
                        width: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.blueGrey, shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.done),
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              const Text('Myself', style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),),
              Container(
                height: 10,
              ),
              const Text(
                'Go to library',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromRGBO(5, 4, 43, 1)),
              ),
              Container(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const View_Tasks()));
      },
    );
  }
}
