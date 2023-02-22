import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:color_parser/color_parser.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/globals.dart';
import '../models/boards.dart';
import '../models/task.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  String __time = '';
  int tasksOrBoards = 1;
  Color pickerColor = Colors.blue;
  Color currentColor = Colors.blue;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myController1.dispose();
    myController2.dispose();
    myController3.dispose();
    myController4.dispose();
    myController5.dispose();
    myController6.dispose();
    myController7.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (tasksOrBoards == 1) ? global_yellow : global_blue,
      appBar: AppBar(
          backgroundColor: (tasksOrBoards == 1) ? global_yellow : global_blue,
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
                          child: const Text(
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
                          color: (tasksOrBoards == 1)
                              ? Color.fromRGBO(5, 4, 43, 1)
                              : Colors.white,
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
                          color: (tasksOrBoards != 1)
                              ? Color.fromRGBO(5, 4, 43, 1)
                              : Colors.white,
                        )
                      ],
                    ))
                  ],
                ),
                Container(
                  height: 20,
                ),
                (tasksOrBoards == 1)
                    ? Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Task : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 4, 43, 1))),
                                Container(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(5, 4, 43, 1)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),
                                Container(
                                  height: 20,
                                ),
                                const Text('Additional Description : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 4, 43, 1))),
                                Container(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(5, 4, 43, 1)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),
                                Container(
                                  height: 20,
                                ),

                                ///
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Date : ',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(5, 4, 43, 1)),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    5, 4, 43, 1)),
                                            readOnly: true,
                                            controller: myController3,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please choose a date';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                prefixIcon: IconButton(
                                                    onPressed: () {
                                                      showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime
                                                                      .now(),
                                                              builder: (context,
                                                                  child) {
                                                                return Theme(
                                                                    data: Theme.of(
                                                                            context)
                                                                        .copyWith(
                                                                      colorScheme:
                                                                          const ColorScheme
                                                                              .light(
                                                                        primary: Color.fromRGBO(
                                                                            5,
                                                                            4,
                                                                            43,
                                                                            1),
                                                                        // <-- SEE HERE
                                                                        onPrimary:
                                                                            Colors.white,
                                                                        // <-- SEE HERE
                                                                        onSurface:
                                                                            Colors.black, // <-- SEE HERE
                                                                      ),
                                                                      textButtonTheme:
                                                                          TextButtonThemeData(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.black, // button text color
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        child!);
                                                              },
                                                              lastDate:
                                                                  DateTime(
                                                                      3000),
                                                              initialEntryMode:
                                                                  DatePickerEntryMode
                                                                      .calendar)
                                                          .then((value) {
                                                        setState(() {
                                                          _date = value!;
                                                          myController3
                                                              .text = DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(_date);
                                                        });
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons.date_range,
                                                        color: Color.fromRGBO(
                                                            5, 4, 43, 1))),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          5, 4, 43, 1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          5, 4, 43, 1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Hour : ',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(5, 4, 43, 1)),
                                        ),
                                        Container(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.3,
                                          child: TextFormField(
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Color.fromRGBO(
                                                    5, 4, 43, 1)),
                                            readOnly: true,
                                            controller: myController4,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please choose an hour';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                prefixIcon: IconButton(
                                                    onPressed: () {
                                                      showTimePicker(
                                                          context: context,
                                                          initialTime:
                                                              TimeOfDay.now(),
                                                          builder:
                                                              (context, child) {
                                                            return Theme(
                                                                data: Theme.of(
                                                                        context)
                                                                    .copyWith(
                                                                  colorScheme:
                                                                      const ColorScheme
                                                                          .light(
                                                                    primary: Color
                                                                        .fromRGBO(
                                                                            5,
                                                                            4,
                                                                            43,
                                                                            1),
                                                                    // <-- SEE HERE
                                                                    onPrimary:
                                                                        Colors
                                                                            .white,
                                                                    // <-- SEE HERE
                                                                    onSurface:
                                                                        Colors
                                                                            .black,
                                                                  ),
                                                                  textButtonTheme:
                                                                      TextButtonThemeData(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .black, // button text color
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: child!);
                                                          }).then((value) {
                                                        setState(() {
                                                          _time = value!;
                                                          myController4
                                                              .text = value.hour
                                                                  .toString() +
                                                              ':' +
                                                              value.minute
                                                                  .toString();
                                                        });
                                                      });
                                                    },
                                                    icon: const Icon(
                                                        Icons
                                                            .timelapse_outlined,
                                                        color: Color.fromRGBO(
                                                            5, 4, 43, 1))),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          5, 4, 43, 1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          5, 4, 43, 1)),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                )),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Container(
                                  height: 20,
                                ),
                                StreamBuilder<List<Board_Model>>(
                                    stream: readBoards(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        print(
                                            'Something has wrong! ${snapshot.error}');
                                        return Text(
                                            'Something has wrong! ${snapshot.error}');
                                      } else if (snapshot.hasData) {
                                        final List<Board_Model> listBoard =
                                            snapshot.data!;
                                        if (listBoard.isEmpty) {
                                          return DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please choose a board';
                                              }
                                              return null;
                                            },
                                            hint: Text('DropDownButton : ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        5, 4, 43, 1))),
                                            icon: const Icon(
                                              Icons.arrow_downward,
                                              color: Colors.black,
                                            ),
                                            items: null,
                                            value: myController5.text.trim(),
                                            isExpanded: true,
                                            onChanged: null,
                                          );
                                        } else {
                                          return DropdownButtonFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please choose a board';
                                              }
                                              return null;
                                            },
                                            hint: Text('Board : ',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        5, 4, 43, 1))),
                                            icon: const Icon(
                                              Icons.arrow_downward,
                                              color: Colors.black,
                                            ),
                                            items:
                                                listBoard.map((Board_Model b) {
                                              return DropdownMenuItem<String>(
                                                value: b.titre,
                                                child: Text(b.titre),
                                              );
                                            }).toList(),
                                            isExpanded: true,
                                            onChanged: (String? value) {
                                              setState(() {
                                                myController5.text = value!;
                                              });
                                            },
                                          );
                                        }
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                              color: Color(0xFFF1FF0A)),
                                        );
                                      }
                                    }),
                                /*TextFormField(
                                  style: const TextStyle(
                                      fontSize: 13, color: Color.fromRGBO(5, 4, 43, 1)),
                                  controller: myController5,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please choose a board';
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),*/
                                Container(
                                  height: 20,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                                  addTasksToFirebase(Task_Model(
                                      id: 'id',
                                      id_board: myController5.text.trim(),
                                      id_user: currentUser.id,
                                      titre: myController1.text.trim(),
                                      description: myController2.text.trim(),
                                      etat: 'loading',
                                      date_de_creation: DateTime.now()
                                      /*DateFormat('dd-MM-yyyy H:m:s')
                                              .format(DateTime.now())*/
                                      ,
                                      date_pour_la_tache:
                                          _date /*
                                          DateFormat('dd-MM-yyyy H:m:s')
                                              .format(_date)*/
                                      ,
                                      //idd: 0,
                                      heure_pour_la_tache:
                                          myController4.text.trim()));
                                }
                              },
                            )
                          ],
                        ))
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Board : ',
                                    style: TextStyle(
                                        color: Color.fromRGBO(5, 4, 43, 1))),
                                Container(
                                  height: 10,
                                ),
                                TextFormField(
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: Color.fromRGBO(5, 4, 43, 1)),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),
                                Container(
                                  height: 20,
                                ),
                                const Text(
                                  'Color : ',
                                  style: TextStyle(
                                      color: Color.fromRGBO(5, 4, 43, 1)),
                                ),
                                Container(
                                  height: 10,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  controller: myController7,
                                  decoration: InputDecoration(
                                      prefixIcon: IconButton(
                                          onPressed: () => pickColor(context),
                                          icon: Icon(Icons.color_lens,
                                              color: pickerColor)),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromRGBO(5, 4, 43, 1)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      hintText: pickerColor.toString(),
                                      hintStyle: TextStyle(color: pickerColor)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                                  addBoardsToFirebase(Board_Model(
                                      id: 'id',
                                      id_user: 'id_user',
                                      titre: myController6.text.trim(),
                                      couleur: myController7.text.trim(),
                                      idd: 0,
                                      listOfAssignee: [currentUser.id]));
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

  Future addTasksToFirebase(Task_Model task) async {
    final docTasks = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.id)
        .collection('tasks')
        .doc();
    final QuerySnapshot _docTasks =
        await FirebaseFirestore.instance.collection('tasks').get();
    task.id = docTasks.id;
    //task.idd = _docTasks.docs.length;
    final json = task.toJson();
    setState(() {
      myController1.text = '';
      myController2.text = '';
      myController3.text = '';
      myController4.text = '';
      myController5.text = '';
    });
    await docTasks
        .set(json)
        .onError((e, _) => print("Error writing Tasks document: $e"));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Board added successfully')),
    );
  }

  Future addBoardsToFirebase(Board_Model board) async {
    final docBoards = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.id)
        .collection('boards')
        .doc();
    final QuerySnapshot _docBoards =
        await FirebaseFirestore.instance.collection('boards').get();
    board.id = docBoards.id;
    board.couleur = ColorParser.color(pickerColor).toHex();
    board.idd = _docBoards.docs.length;
    final json = board.toJson();
    setState(() {
      myController6.text = '';
      myController7.text = '';
    });
    await docBoards
        .set(json)
        .onError((e, _) => print("Error writing Boards document: $e"));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Ajout du board')),
    );
  }

  Stream<List<Board_Model>> readBoards() => FirebaseFirestore.instance
      .collection('users')
      .doc(currentUser.id)
      .collection('boards')
      .orderBy("titre")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Board_Model.fromJson(doc.data()))
          .toList());

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print(ColorParser.color(pickerColor).toHex());
  }

  Future pickColor(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              /*child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),*/
              // Use Material color picker:
              //
              /*child: MaterialPicker(
                 pickerColor: pickerColor,
                 onColorChanged: changeColor,
                 //showLabel: true, // only on portrait mode
               ),*/
              //
              // Use Block color picker:
              //
              child: BlockPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
              ),
              //
              /*child: MultipleChoiceBlockPicker(
                 pickerColors: currentColors,
                 onColorsChanged: changeColors,
               ),*/
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
