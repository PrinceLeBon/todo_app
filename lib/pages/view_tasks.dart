import 'package:flutter/material.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class View_Tasks extends StatefulWidget {
  const View_Tasks({Key? key}) : super(key: key);

  @override
  State<View_Tasks> createState() => _View_TasksState();
}

class _View_TasksState extends State<View_Tasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[500],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
            width: 100,
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(5, 4, 43, 1), shape: BoxShape.circle),
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(5, 4, 43, 1), shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.keyboard_control),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: Color.fromRGBO(5, 4, 43, 1), width: 1)),
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  child: Text(
                    'Sweet Home',
                    style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Text(
                'Faire du shopping',
                style: TextStyle(
                    color: Color.fromRGBO(
                      5,
                      4,
                      43,
                      1,
                    ),
                    fontSize: 60),
              ),
              Container(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Date & Time',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text('Assignee', style: TextStyle(color: Colors.blueGrey)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2h 45mn',
                        style: TextStyle(
                            color: Color.fromRGBO(
                              5,
                              4,
                              43,
                              1,
                            ),
                            fontSize: 30),
                      ),
                      Text(
                        'Dec 12, 2022',
                        style: TextStyle(
                            color: Color.fromRGBO(
                          5,
                          4,
                          43,
                          1,
                        )),
                      ),
                    ],
                  ),
                  Container(
                    width: 105,
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Profile_Picture(taille: 50),
                          bottom: 0,
                          right: 0,
                        ),
                        Positioned(
                          child: Profile_Picture(taille: 50),
                          right: 30,
                          bottom: 0,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                height: 20,
              ),
              Text(
                'Additional Decription',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 20,
              ),
              Text(
                'Nous irons faire du shopping. Nous irons faire du shopping. Nous irons faire du shopping. Nous irons faire du shopping. ',
                style: TextStyle(
                    color: Color.fromRGBO(
                  5,
                  4,
                  43,
                  1,
                )),
              ),
              Container(
                height: 20,
              ),
              Text(
                'Created',
                style: TextStyle(color: Colors.blueGrey),
              ),
              Container(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Dec 10, by Matt ',
                    style: TextStyle(
                        color: Color.fromRGBO(
                      5,
                      4,
                      43,
                      1,
                    )),
                  ),
                  Profile_Picture(taille: 20)
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(padding: EdgeInsets.only(left: 20, right: 20, bottom: 20), child: ConfirmationSlider(
        onConfirmation: () {},
        backgroundColor: Color.fromRGBO(
          5,
          4,
          43,
          1,
        ),
        text: 'Set As Done',
        textStyle: TextStyle(color: Colors.white),
        iconColor: Color.fromRGBO(
          5,
          4,
          43,
          1,
        ),
        foregroundColor: Colors.white,
      ),),
    );
  }
}