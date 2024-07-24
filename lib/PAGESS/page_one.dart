import 'package:firebase_project_practice/PAGES/contact_list.dart';
import 'package:firebase_project_practice/PAGESS/ModelClass.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.separated(
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
                            showDialogMethod();
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              contactsList.removeAt(index);
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: contactsList.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogMethod();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? index;

  onvalidate(index) {
    if (formKey.currentState!.validate()) {
      debugPrint("ok");
      contactsList.add(
          ModelClass(name: nameController.text, number: numberController.text));
      Navigator.pop(context);
      nameController.clear();
      numberController.clear();
      setState(() {});
      // if (index != null) {
      //   contactsList[index].name == nameController.text;
      //   contactsList[index].number == numberController.text;
      //   // ModelClass(name: nameController.text, number: numberController.text) ==
      //   //     contactsList[index];
      // } else {
      //   contactsList.add(ModelClass(
      //       name: nameController.text, number: numberController.text));
      //   Navigator.pop(context);
      //   nameController.clear();
      //   numberController.clear();
      //   setState(() {});
      // }
    } else {
      debugPrint("Not ok");
    }
  }

  showDialogMethod() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("ADD Contact"),
            content: Container(
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
                      decoration: InputDecoration(
                        labelText: "Enter your name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
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
                      decoration: InputDecoration(
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
                      child: Text("Cancel"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onvalidate(index);
                      },
                      child: Text("ADD"),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
