import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  // List<String> users = ["abdullah", "maaz", "ali", "talha"];

  List<String> contact = [
    "abdullah",
    "maaz",
    "ali",
    "talha",
    "hadi",
  ];
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              number++;
            });
            contact.add("user $number");
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
                      title: Text(contact[index].toString()),
                      subtitle: Text(
                        "Mobile",
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Yesterday"),
                            // SizedBox(
                            //   width: 5,
                            // ),
                            Icon(Icons.info_outline),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: contact.length),
            ),
          ],
        ),
      ),
    );
  }
}
