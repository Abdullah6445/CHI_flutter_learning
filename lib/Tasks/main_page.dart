import 'package:firebase_project_practice/Tasks/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:firebase_project_practice/Tasks/dial_page/dial_page_vm.dart';
import 'package:firebase_project_practice/Tasks/dial_page/dial_page_vu.dart';
import 'package:firebase_project_practice/Tasks/missed_calls_page/missed_calls_vu.dart';
import 'package:firebase_project_practice/Tasks/received_page.dart/received_page_vu.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  Color? colorrr = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Reuseable Component",
          ),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .07,
              child: ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: index == selectedIndex
                                ? Colors.green
                                : Colors.grey[400]),
                        onPressed: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: index == 0
                            ? Icon(
                                Icons.dialpad,
                              )
                            : index == 1
                                ? Icon(Icons.missed_video_call_sharp)
                                : Icon(Icons.call_received),
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                child: selectedIndex == 0
                    ? DialPageVU()
                    : selectedIndex == 1
                        ? MissedCallsPageVU()
                        : ReceivedPageVU(),
              ),
            ),
          ],
        ),
        floatingActionButton: selectedIndex == 0
            ? CustomFloatingActionButton(OnFloatingButton: () {
                // debugPrint("Dial floating button clicked");
                DialPageVM().someValue();
              })
            : selectedIndex == 1
                ? CustomFloatingActionButton(OnFloatingButton: () {
                    debugPrint("missedcalls floating button clicked");
                  })
                : CustomFloatingActionButton(OnFloatingButton: () {
                    debugPrint("received floating button clicked");
                  }),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
