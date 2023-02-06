import 'package:flutter/material.dart';
import 'package:todo_app/components/list_tasks.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TAbViewTasks extends StatelessWidget {
  const TAbViewTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(color: Colors.blueAccent, width: 1)),
                    child: const Center(
                      child: Text(
                        'Boards',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Center(
                          child: Text(
                            'Active',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        height: 35,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(40),
                            border:
                                Border.all(color: Colors.blueAccent, width: 1)),
                        child: const Center(
                          child: Text(
                            'Done',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(height: 20),
            const TabBar(
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: [
                  Tab(
                    icon: Text(
                      'Mon',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Tue',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Wed',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Thu',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Fri',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Sat',
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Sun',
                    ),
                  ),
                ]),
            const Flexible(
                child: TabBarView(children: [
              List_Tasks(),
              List_Tasks(),
              List_Tasks(),
              List_Tasks(),
              List_Tasks(),
              List_Tasks(),
              List_Tasks(),
            ]))
          ],
        ));
  }
}
