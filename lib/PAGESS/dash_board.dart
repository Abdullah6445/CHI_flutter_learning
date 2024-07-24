import 'package:firebase_project_practice/PAGESS/ModelClass.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int indexx = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: Colors.green,
              height: MediaQuery.of(context).size.height * .2,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "CRUD OPERATIONS",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              indexx = 0;
                              setState(() {
                                debugPrint("$indexx");
                              });
                            },
                            child: const Text(
                              "All",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            )),
                        TextButton(
                            onPressed: () {
                              indexx = 1;
                              setState(() {
                                debugPrint("$indexx");
                              });
                            },
                            child: const Text(
                              "Missed Calls",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.black),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: indexx == 0
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
                    : const WidgetTwo(),
              ),
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

  onvalidate() {
    if (formKey.currentState!.validate()) {
      debugPrint("ok");

      // String nameee;
      // String numberrrr;

      // contactsList[index].name == nameee;

      contactsList.add(
          ModelClass(name: nameController.text, number: numberController.text));
      nameController.clear();
      numberController.clear();

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
      color: Colors.green.shade200,
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
