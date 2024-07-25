import 'package:firebase_project_practice/PAGESS/ModelClass.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int selectedIndex = 0;
  Color? colorrr = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CRUD OPERATIONS",
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 48,
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: index == selectedIndex
                                  ? Colors.green
                                  : Colors.grey[400]),
                          onPressed: () {
                            selectedIndex = index;
                            setState(() {});
                          },
                          child: const Icon(Icons.abc)),
                    );
                  }),
            ),
            Expanded(
              child: selectedIndex == 0
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(contactsList[index].name),
                          subtitle: Text(contactsList[index].number),
                          trailing: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showDialogMethod(index: index);
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.green,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        contactsList.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: contactsList.length)
                  : selectedIndex == 1
                      ? const WidgetTwo()
                      : selectedIndex == 2
                          ? const WidgetThree()
                          : const WidgetFour(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialogMethod();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? editIndex;

  List<Color> colorsList = [
    Colors.black,
    Colors.blue,
    Colors.blue,
    Colors.blue,
  ];

  onvalidate() {
    if (formKey.currentState!.validate()) {
      debugPrint("ok");

      if (editIndex != null) {
        contactsList[editIndex!] = ModelClass(
            name: nameController.text, number: numberController.text);
      } else {
        contactsList.add(ModelClass(
            name: nameController.text, number: numberController.text));
      }

      nameController.clear();
      numberController.clear();
      editIndex = null;

      setState(() {});
      Navigator.pop(context);
    } else {
      debugPrint("Not ok");
    }
  }

  // onEdit() {
  //   if (formKey.currentState!.validate()) {
  //     debugPrint("ok");

  //     nameController.text = contactsList[indexx].name;
  //     numberController.text = contactsList[indexx].number;

  //     // contactsList.add(
  //     //     ModelClass(name: nameController.text, number: numberController.text));
  //     // nameController.clear();
  //     // numberController.clear();

  //     setState(() {});
  //     Navigator.pop(context);
  //   } else {
  //     debugPrint("Not ok");
  //   }
  // }

  List<ModelClass> contactsList = [
    ModelClass(
      name: "abdullah",
      number: "23423423423",
    ),
    ModelClass(
      name: "abdullah",
      number: "23423423423",
    ),
    ModelClass(
      name: "abdullah",
      number: "23423423423",
    ),
    ModelClass(
      name: "abdullah",
      number: "23423423423",
    ),
  ];
  showDialogMethod({int? index}) {
    if (index != null) {
      nameController.text = contactsList[index].name;
      numberController.text = contactsList[index].number;
      editIndex = index;
    } else {
      nameController.clear();
      numberController.clear();
      editIndex = null;
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(index == null ? "ADD Contact" : "Update"),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trimLeft().isEmpty) {
                          return "requried";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "Enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: numberController,
                      validator: (value) {
                        if (value == null || value.trimLeft().isEmpty) {
                          return "requried";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: "Enter your contact",
                        hintText: "Enter contact here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onvalidate();
                      },
                      child: Text(index == null ? "ADD" : "Update"),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}

class WidgetTwo extends StatefulWidget {
  const WidgetTwo({
    super.key,
  });

  @override
  State<WidgetTwo> createState() => _WidgetTwoState();
}

class _WidgetTwoState extends State<WidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "data 2",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

/////////////
class WidgetThree extends StatefulWidget {
  const WidgetThree({super.key});

  @override
  State<WidgetThree> createState() => _WidgetThreeState();
}

class _WidgetThreeState extends State<WidgetThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "data 3",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class WidgetFour extends StatefulWidget {
  const WidgetFour({super.key});

  @override
  State<WidgetFour> createState() => _WidgetFourState();
}

class _WidgetFourState extends State<WidgetFour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text(
          "data 4",
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
/////////////////
//////////////////
///
///

// class WidgetOne extends StatefulWidget {
//   const WidgetOne({
//     super.key,
//   });

//   @override
//   State<WidgetOne> createState() => _WidgetOneState();
// }

// class _WidgetOneState extends State<WidgetOne> {
//   @override
//   Widget build(BuildContext context) {
//     return
//   }

//   showDialogMethod() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text("ADD Contact"),
//             content: Container(
//               height: MediaQuery.of(context).size.height * .3,
//               child: Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: nameController,
//                       validator: (value) {
//                         if (value == null || value.trimLeft().isEmpty) {
//                           return "requried";
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.text,
//                       decoration: InputDecoration(
//                         labelText: "Enter your name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: numberController,
//                       validator: (value) {
//                         if (value == null || value.trimLeft().isEmpty) {
//                           return "requried";
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.phone,
//                       decoration: InputDecoration(
//                         labelText: "Enter your contact",
//                         hintText: "Enter contact here",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: Text("Cancel"),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         onvalidate(index);
//                       },
//                       child: Text("ADD"),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }






















































// import 'package:firebase_project_practice/PAGESS/ModelClass.dart';
// import 'package:flutter/material.dart';

// class DashBoard extends StatefulWidget {
//   const DashBoard({super.key});

//   @override
//   State<DashBoard> createState() => _DashBoardState();
// }

// class _DashBoardState extends State<DashBoard> {
//   int indexx = 0;
//   Color? colorrr = Colors.blue;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               color: Colors.green,
//               height: MediaQuery.of(context).size.height * .2,
//               width: double.infinity,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
//                 child: Column(
//                   children: [
//                     const Text(
//                       "CRUD OPERATIONS",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: colorsList[0]),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 0;
//                         //       colorsList[0] = Colors.yellow;

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: colorsList[0]),
//                           onPressed: () {
//                             setState(() {
//                               indexx = 0;

//                               colorsList[0] = Colors.black;

//                               colorsList[1] = Colors.blue;

//                               colorsList[2] = Colors.blue;
//                               colorsList[3] = Colors.blue;

//                               debugPrint("$indexx");
//                             });
//                           },
//                           child: Icon(Icons.abc),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: colorsList[1]),
//                           onPressed: () {
//                             setState(() {
//                               indexx = 1;

//                               colorsList[0] = Colors.blue;

//                               colorsList[1] = Colors.black;

//                               colorsList[2] = Colors.blue;
//                               colorsList[3] = Colors.blue;

//                               debugPrint("$indexx");
//                             });
//                           },
//                           child: Icon(Icons.abc),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: colorsList[2]),
//                           onPressed: () {
//                             setState(() {
//                               indexx = 2;

//                               colorsList[0] = Colors.blue;

//                               colorsList[1] = Colors.blue;

//                               colorsList[2] = Colors.black;
//                               colorsList[3] = Colors.blue;

//                               debugPrint("$indexx");
//                             });
//                           },
//                           child: Icon(Icons.abc),
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: colorsList[3]),
//                           onPressed: () {
//                             setState(() {
//                               indexx = 3;

//                               colorsList[0] = Colors.blue;

//                               colorsList[1] = Colors.blue;

//                               colorsList[2] = Colors.blue;
//                               colorsList[3] = Colors.black;

//                               debugPrint("$indexx");
//                             });
//                           },
//                           child: Icon(Icons.abc),
//                         ),

//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: colorsList[0]),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 0;
//                         //       colorsList[0] = Colors.yellow;

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),
//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: colorsList[0]),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 0;
//                         //       colorsList[0] = Colors.yellow;

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),

//                         // ),
//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: Colors.amber),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 2;
//                         //       colorrr = colorsList[indexx];

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),
//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: colorrr),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 2;
//                         //       colorrr = Colors.amber;

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),
//                         // ElevatedButton(
//                         //   style: ElevatedButton.styleFrom(
//                         //       backgroundColor: colorrr),
//                         //   onPressed: () {
//                         //     setState(() {
//                         //       indexx = 3;
//                         //       colorrr = Colors.amber;

//                         //       debugPrint("$indexx");
//                         //     });
//                         //   },
//                         //   child: Icon(Icons.abc),
//                         // ),
//                         // TextButton(
//                         //     onPressed: () {
//                         //       indexx = 0;

//                         //       setState(() {
//                         //         debugPrint("$indexx");
//                         //       });
//                         //     },
//                         //     child: const Text(
//                         //       "All",
//                         //       style: TextStyle(
//                         //         fontSize: 20,
//                         //         color: Colors.black,
//                         //       ),
//                         //     )),
//                         // TextButton(
//                         //     onPressed: () {
//                         //       indexx = 1;
//                         //       setState(() {
//                         //         debugPrint("$indexx");
//                         //       });
//                         //     },
//                         //     child: const Text(
//                         //       "Missed Calls",
//                         //       style:
//                         //           TextStyle(fontSize: 25, color: Colors.black),
//                         //     )),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: SizedBox(
//                   width: double.infinity,
//                   child: indexx == 0
//                       ? ListView.separated(
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title: Text(contactsList[index].name),
//                               subtitle: Text(contactsList[index].number),
//                               trailing: SizedBox(
//                                 width: MediaQuery.of(context).size.width / 2,
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {
//                                           showDialogMethod(index: index);
//                                         },
//                                         icon: const Icon(
//                                           Icons.edit,
//                                           color: Colors.green,
//                                         )),
//                                     IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             contactsList.removeAt(index);
//                                           });
//                                         },
//                                         icon: const Icon(
//                                           Icons.delete,
//                                           color: Colors.red,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return const Divider();
//                           },
//                           itemCount: contactsList.length)
//                       : indexx == 1
//                           ? WidgetTwo()
//                           : indexx == 2
//                               ? WidgetThree()
//                               : WidgetFour()),
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showDialogMethod();
//           },
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }

//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();

//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   int? editIndex;

//   List<Color> colorsList = [
//     Colors.black,
//     Colors.blue,
//     Colors.blue,
//     Colors.blue,
//   ];

//   onvalidate() {
//     if (formKey.currentState!.validate()) {
//       debugPrint("ok");

//       if (editIndex != null) {
//         contactsList[editIndex!] = ModelClass(
//             name: nameController.text, number: numberController.text);
//       } else {
//         contactsList.add(ModelClass(
//             name: nameController.text, number: numberController.text));
//       }

//       nameController.clear();
//       numberController.clear();
//       editIndex = null;

//       setState(() {});
//       Navigator.pop(context);
//     } else {
//       debugPrint("Not ok");
//     }
//   }

//   // onEdit() {
//   //   if (formKey.currentState!.validate()) {
//   //     debugPrint("ok");

//   //     nameController.text = contactsList[indexx].name;
//   //     numberController.text = contactsList[indexx].number;

//   //     // contactsList.add(
//   //     //     ModelClass(name: nameController.text, number: numberController.text));
//   //     // nameController.clear();
//   //     // numberController.clear();

//   //     setState(() {});
//   //     Navigator.pop(context);
//   //   } else {
//   //     debugPrint("Not ok");
//   //   }
//   // }

//   List<ModelClass> contactsList = [
//     ModelClass(
//       name: "abdullah",
//       number: "23423423423",
//     ),
//     ModelClass(
//       name: "abdullah",
//       number: "23423423423",
//     ),
//     ModelClass(
//       name: "abdullah",
//       number: "23423423423",
//     ),
//     ModelClass(
//       name: "abdullah",
//       number: "23423423423",
//     ),
//   ];
//   showDialogMethod({int? index}) {
//     if (index != null) {
//       nameController.text = contactsList[index].name;
//       numberController.text = contactsList[index].number;
//       editIndex = index;
//     } else {
//       nameController.clear();
//       numberController.clear();
//       editIndex = null;
//     }
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(index == null ? "ADD Contact" : "Update"),
//             content: SizedBox(
//               height: MediaQuery.of(context).size.height * .3,
//               child: Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 key: formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: nameController,
//                       validator: (value) {
//                         if (value == null || value.trimLeft().isEmpty) {
//                           return "requried";
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.text,
//                       decoration: const InputDecoration(
//                         labelText: "Enter your name",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFormField(
//                       controller: numberController,
//                       validator: (value) {
//                         if (value == null || value.trimLeft().isEmpty) {
//                           return "requried";
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.phone,
//                       decoration: const InputDecoration(
//                         labelText: "Enter your contact",
//                         hintText: "Enter contact here",
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             actions: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Cancel"),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         onvalidate();
//                       },
//                       child: Text(index == null ? "ADD" : "Update"),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           );
//         });
//   }
// }

// class WidgetTwo extends StatefulWidget {
//   const WidgetTwo({
//     super.key,
//   });

//   @override
//   State<WidgetTwo> createState() => _WidgetTwoState();
// }

// class _WidgetTwoState extends State<WidgetTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child: Text(
//           "data 2",
//           style: TextStyle(
//               fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
//         ),
//       ),
//     );
//   }
// }

// /////////////
// class WidgetThree extends StatefulWidget {
//   const WidgetThree({super.key});

//   @override
//   State<WidgetThree> createState() => _WidgetThreeState();
// }

// class _WidgetThreeState extends State<WidgetThree> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child: Text(
//           "data 3",
//           style: TextStyle(
//               fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
//         ),
//       ),
//     );
//   }
// }

// class WidgetFour extends StatefulWidget {
//   const WidgetFour({super.key});

//   @override
//   State<WidgetFour> createState() => _WidgetFourState();
// }

// class _WidgetFourState extends State<WidgetFour> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const Center(
//         child: Text(
//           "data 4",
//           style: TextStyle(
//               fontSize: 20, color: Colors.black, fontWeight: FontWeight.w900),
//         ),
//       ),
//     );
//   }
// }
// /////////////////
// //////////////////
// ///
// ///

// // class WidgetOne extends StatefulWidget {
// //   const WidgetOne({
// //     super.key,
// //   });

// //   @override
// //   State<WidgetOne> createState() => _WidgetOneState();
// // }

// // class _WidgetOneState extends State<WidgetOne> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }

// //   showDialogMethod() {
// //     showDialog(
// //         context: context,
// //         builder: (context) {
// //           return AlertDialog(
// //             title: Text("ADD Contact"),
// //             content: Container(
// //               height: MediaQuery.of(context).size.height * .3,
// //               child: Form(
// //                 autovalidateMode: AutovalidateMode.always,
// //                 key: formKey,
// //                 child: Column(
// //                   children: [
// //                     TextFormField(
// //                       controller: nameController,
// //                       validator: (value) {
// //                         if (value == null || value.trimLeft().isEmpty) {
// //                           return "requried";
// //                         }
// //                         return null;
// //                       },
// //                       keyboardType: TextInputType.text,
// //                       decoration: InputDecoration(
// //                         labelText: "Enter your name",
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.all(
// //                             Radius.circular(10),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(
// //                       height: 20,
// //                     ),
// //                     TextFormField(
// //                       controller: numberController,
// //                       validator: (value) {
// //                         if (value == null || value.trimLeft().isEmpty) {
// //                           return "requried";
// //                         }
// //                         return null;
// //                       },
// //                       keyboardType: TextInputType.phone,
// //                       decoration: InputDecoration(
// //                         labelText: "Enter your contact",
// //                         hintText: "Enter contact here",
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.all(
// //                             Radius.circular(10),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             actions: [
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.end,
// //                   children: [
// //                     TextButton(
// //                       onPressed: () {
// //                         Navigator.pop(context);
// //                       },
// //                       child: Text("Cancel"),
// //                     ),
// //                     SizedBox(
// //                       width: 10,
// //                     ),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         onvalidate(index);
// //                       },
// //                       child: Text("ADD"),
// //                     ),
// //                   ],
// //                 ),
// //               )
// //             ],
// //           );
// //         });
// //   }
// // }
