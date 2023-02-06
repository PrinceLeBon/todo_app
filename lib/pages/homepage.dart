import 'package:flutter/material.dart';
import 'package:todo_app/components/list_boards.dart';
import 'package:todo_app/components/list_tasks.dart';
import 'package:todo_app/pages/tabview/tabview_tasks.dart';
import 'package:todo_app/widgets/boards.dart';
import 'package:todo_app/widgets/profile_picture.dart';
import 'package:intl/intl.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:todo_app/widgets/tasks.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final ScrollController? controller;
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: Color.fromRGBO(5, 4, 43, 1),
              //const Color.fromRGBO(5, 4, 43, 1),
              expandedHeight: 300,
              title: const Profile_Picture(taille: 50),
              actions: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_outlined),
                    color: Colors.white,
                  ),
                ),
                Container(width: 3),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blueGrey, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                ),
                Container(width: 20),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(height: 40),
                          (DateTime.now().hour >= 12)
                              ? (DateTime.now().hour >= 18)
                                  ? const Text(
                                      'Good \nEvening',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 60,
                                          letterSpacing: 2),
                                    )
                                  : const Text('Good \nAfternoon',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 60,
                                          letterSpacing: 2))
                              : const Text('Good \nMorning',
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 60,
                                      letterSpacing: 2)),
                          Container(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Today\'s ${DateFormat('EEEE').format(DateTime.now())}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  Text(
                                      DateFormat('MMM d, yyyy')
                                          .format(DateTime.now()),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    '75% done',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Container(
                                    height: 5,
                                  ),
                                  const Text('Completed Tasks',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12))
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              titleTextStyle:
                  TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
              backgroundColor: const Color.fromRGBO(5, 4, 43, 1),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: const Text(
                          'Tasks',
                          style: TextStyle(letterSpacing: 2),
                        ),
                        onTap: (){
                          setState(() {
                            value = 1;
                          });
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color: (value==1) ? Colors.white : Colors.grey,
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const Text(
                          'Boards',
                          style: TextStyle(letterSpacing: 2),
                        ),
                        onTap: (){
                          setState(() {
                            value = 2;
                          });
                        },
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        height: 2,
                        color: (value!=1) ? Colors.white : Colors.grey,
                      )
                    ],
                  )),
                ],
              ),
            ),
            (value == 1)
                ? SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                itemCount: 100,
                  itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Tasks(),
                );
              }),
            )
                : SliverAnimatedList(
                    itemBuilder: (_, index, ___) {
                      return Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Boards(),
                      );
                    },
                    initialItemCount: 100,
                  )
          ],
        ),
      ),
      /*Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 40),
                (DateTime.now().hour >=
                    12)
                    ? (DateTime.now().hour >=
                    18)
                    ? const Text(
                  'Good \nEvening',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 60,
                      letterSpacing: 2),
                )
                    : const Text('Good \nAfternoon',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 60,
                        letterSpacing: 2))
                    : const Text('Good \nMorning',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 60,
                        letterSpacing: 2)),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today\'s ${DateFormat('EEEE').format(DateTime.now())}',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 5,
                        ),
                        Text(DateFormat('MMM d, yyyy').format(DateTime.now()),
                            style: TextStyle(color: Colors.grey, fontSize: 12))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '75% done',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          height: 5,
                        ),
                        const Text('Completed Tasks',
                            style: TextStyle(color: Colors.grey, fontSize: 12))
                      ],
                    ),
                  ],
                ),
                const TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Text(
                        'Tasks',
                        style: TextStyle(letterSpacing: 2),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Board',
                        style: TextStyle(letterSpacing: 2),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                    child:
                    TabBarView(children: [TAbViewTasks(), List_Boards()])),
              ],
            ),
          )
        ,*/
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
