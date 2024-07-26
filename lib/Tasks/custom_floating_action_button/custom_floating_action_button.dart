import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.green,
      useMaterial3: false,
    ),
    home: Scaffold(
      body: Center(child: CustomFloatingActionButton(
        OnFloatingButton: () {
          debugPrint("floating button clicked");
        },
      )),
    ),
  ));
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function OnFloatingButton;
  IconData? floatingIcon;

  CustomFloatingActionButton({
    super.key,
    required this.OnFloatingButton,
    this.floatingIcon = Icons.add,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 10,
      onPressed: OnFloatingButton as void Function()?,
      child: Icon(floatingIcon),
    );
  }
}
