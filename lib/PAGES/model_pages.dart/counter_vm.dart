import 'package:firebase_project_practice/PAGES/model_pages.dart/model_class.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ViewModel extends BaseViewModel {
  String appbarTitle = "Crud by VUVM";

  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int? editingIndex;
  onvalidateVUVM(BuildContext context) {
    if (formKey.currentState!.validate()) {
      debugPrint("OK");
      if (editingIndex == null) {
        add();
      } else {
        listItems[editingIndex!] = ModelClassForVUVM(
            name: nameController.text, number: numberController.text);
      }
      nameController.clear();
      numberController.clear();
      editingIndex = null;
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

  remove(int index) {
    listItems.removeAt(index);

    notifyListeners();
  }
}
