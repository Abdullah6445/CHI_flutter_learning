import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // List<String> users = ["abdullah", "maaz", "ali", "talha"];

  List<String> contactNameList = [
    "abdullah",
    "maaz",
    "ali",
  ];
  List<String> contactNumberList = [
    "0111",
    "0111",
    "0111",
  ];
  int number = 0;

  TextEditingController contacts_name_Controller = TextEditingController();
  TextEditingController contacts_number_Controller = TextEditingController();

  GlobalKey<FormState> form_key = GlobalKey<FormState>();
  validate() {
    if (form_key.currentState!.validate()) {
      debugPrint("OK");

      contactNameList.add(contacts_name_Controller.text);
      contactNumberList.add(contacts_number_Controller.text);
      Navigator.pop(context);
      setState(() {});
    } else {
      debugPrint("Not OK");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("ADD Contact"),
                  content: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    child: Form(
                      key: form_key,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: contacts_name_Controller,
                            validator: (value) {
                              if (value == null || value.trimLeft().isEmpty) {
                                return "requried";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              debugPrint(value);
                            },
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Enter your name",
                              hintText: "Enter name here",
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
                            controller: contacts_number_Controller,
                            validator: (value) {
                              if (value == null || value.trimLeft().isEmpty) {
                                return "requried";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              debugPrint(value);
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
                              validate();
                            },
                            child: Text("ADD"),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.settings,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Recents",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "All",
                            style: TextStyle(color: Colors.blue.shade900),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Missed calls",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.phone_callback_sharp,
                        color: Colors.green,
                      ),
                      title: Text(
                        contactNameList[index].toString(),
                      ),
                      subtitle: Text(
                        contactNumberList[index].toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Container(
                        color: Colors.amber,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Yesterday"),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  debugPrint("selected index edit");
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    contactNameList.removeAt(index);
                                    contactNumberList.removeAt(index);
                                  });
                                  debugPrint("selected index deleted");
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.info_outline),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: contactNameList.length),
            ),
          ],
        ),
      ),
    );
  }
}
