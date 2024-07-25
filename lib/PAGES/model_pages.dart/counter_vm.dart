import 'package:firebase_project_practice/PAGES/model_pages.dart/model_class.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  String appbarTitle = "Crud by VUVM";

  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  onvalidateVUVM(BuildContext context) {
    if (formKey.currentState!.validate()) {
      debugPrint("OK");
      add();
      nameController.clear();
      numberController.clear();
      Navigator.pop(context);
    } else {
      debugPrint("Not OK");
    }
    notifyListeners();
  }

  List<ModelClassForVUVM> listItems = [
    ModelClassForVUVM(name: "AB", number: "923317012500"),
    ModelClassForVUVM(name: "AB", number: "923317012500"),
    ModelClassForVUVM(name: "AB", number: "923317012500"),
  ];

  add() {
    listItems.add(ModelClassForVUVM(
        name: nameController.text, number: numberController.text));
  }

  // onEditOne(int index) {
  //   formKey.currentState!.save();
  //   listItems[index].name = nameController.text ;
  //   listItems[index].number = numberController.text ;
  //   notifyListeners();

  //   // if (index != null) {
  //   //   nameController.text = listItems[index].name;
  //   //   numberController.text = listItems[index].number;
  //   // }
  //   notifyListeners();
  //   // editIndex = index;
  // }

  remove(int index) {
    listItems.removeAt(index);

    notifyListeners();
  }
}
