import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTasksBoardsPage extends StatefulWidget {
  const AddTasksBoardsPage({Key? key}) : super(key: key);

  @override
  State<AddTasksBoardsPage> createState() => _AddTasksBoardsPageState();
}

class _AddTasksBoardsPageState extends State<AddTasksBoardsPage> {
  final _formKey = GlobalKey<FormState>();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  int tasksOrBoards = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (tasksOrBoards==1) ? Colors.yellow[500] : Colors.blue[200],
      appBar: AppBar(
          backgroundColor: (tasksOrBoards==1) ? Colors.yellow[500] : Colors.blue[200],
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(5, 4, 43, 1), shape: BoxShape.circle),
              child: Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child:const Text(
                                'Tasks',
                                style: TextStyle(letterSpacing: 2),
                              ),
                              onTap: () {
                                setState(() {
                                  tasksOrBoards = 1;
                                });
                              },
                            ),
                            Container(
                              height: 10,
                            ),
                            Container(
                              height: 2,
                              color: (tasksOrBoards == 1) ? Color.fromRGBO(5, 4, 43, 1) : Colors.white,
                            )
                          ],
                        )),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              child: const Text(
                                'Boards',
                                style: TextStyle(letterSpacing: 2),
                              ),
                              onTap: () {
                                setState(() {
                                  tasksOrBoards = 2;
                                });
                              },
                            ),
                            Container(
                              height: 10,
                            ),
                            Container(
                              height: 2,
                              color: (tasksOrBoards != 1) ? Color.fromRGBO(5, 4, 43, 1) : Colors.grey,
                            )
                          ],
                        ))
                  ],
                ),
                Container(height: 20,),
                (tasksOrBoards==1) ? Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Task : ',
                                style:
                                TextStyle(color: Color.fromRGBO(5, 4, 43, 1))),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 13, color: Colors.white),
                              controller: myController1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.task,
                                    color: Color.fromRGBO(5, 4, 43, 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                            Container(
                              height: 20,
                            ),
                            const Text('Additional Description : ',
                                style:
                                TextStyle(color: Color.fromRGBO(5, 4, 43, 1))),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 13, color: Color.fromRGBO(5, 4, 43, 1)),
                              controller: myController2,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.description_outlined,
                                    color: Color.fromRGBO(5, 4, 43, 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                            Container(
                              height: 20,
                            ),
                            const Text(
                              'Date : ',
                              style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                            ),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 13, color: Color.fromRGBO(5, 4, 43, 1)),
                              readOnly: true,
                              controller: myController3,
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
                                            firstDate: DateTime.now(),
                                            builder: (context, child) {
                                              return Theme(
                                                  data: Theme.of(context)
                                                      .copyWith(
                                                    colorScheme:
                                                    const ColorScheme.light(
                                                      primary: Color.fromRGBO(
                                                          5, 4, 43, 1),
                                                      // <-- SEE HERE
                                                      onPrimary: Colors.white,
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
                                            lastDate: DateTime(3000),
                                            initialEntryMode:
                                            DatePickerEntryMode.calendar)
                                            .then((value) {
                                          setState(() {
                                            _date = value!;
                                            myController3.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(_date);
                                          });
                                        });
                                      },
                                      icon: const Icon(Icons.date_range,
                                          color: Color.fromRGBO(5, 4, 43, 1))),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                            Container(
                              height: 20,
                            ),
                            const Text(
                              'Hour : ',
                              style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                            ),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 13, color: Color.fromRGBO(5, 4, 43, 1)),
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
                                        showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                            builder: (context, child){
                                              return Theme(data: Theme.of(context).copyWith(
                                                colorScheme:
                                                const ColorScheme.light(
                                                  primary: Color.fromRGBO(
                                                      5, 4, 43, 1),
                                                  // <-- SEE HERE
                                                  onPrimary: Colors.white,
                                                  // <-- SEE HERE
                                                  onSurface: Colors
                                                      .black,
                                                ),
                                                textButtonTheme:
                                                TextButtonThemeData(
                                                  style:
                                                  TextButton.styleFrom(
                                                    primary: Colors
                                                        .black, // button text color
                                                  ),
                                                ),
                                              ), child: child!);
                                            }
                                        ).then((value) {
                                          setState(() {
                                            _time = value!;
                                            myController4.text = value.hour.toString()+':'+value.minute.toString();
                                          });
                                        });
                                      },
                                      icon: const Icon(Icons.timelapse_outlined,
                                          color: Color.fromRGBO(5, 4, 43, 1))),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(5, 4, 43, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  'Add Task',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {

                            }
                          },
                        )
                      ],
                    )) : Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Board : ',
                                style:
                                TextStyle(color: Color.fromRGBO(5, 4, 43, 1))),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(fontSize: 13, color: Colors.white),
                              controller: myController6,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.category,
                                    color: Color.fromRGBO(5, 4, 43, 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            ),
                            Container(
                              height: 20,
                            ),
                            const Text(
                              'Color : ',
                              style: TextStyle(color: Color.fromRGBO(5, 4, 43, 1)),
                            ),
                            Container(
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(
                                  fontSize: 13, color: Color.fromRGBO(5, 4, 43, 1)),
                              readOnly: true,
                              controller: myController7,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                      onPressed: () {

                                      },
                                      icon: const Icon(Icons.color_lens,
                                          color: Color.fromRGBO(5, 4, 43, 1))),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(5, 4, 43, 1)),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                  )),
                            )
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        InkWell(
                          child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(5, 4, 43, 1),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                child: Text(
                                  'Add Board',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {

                            }
                          },
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
