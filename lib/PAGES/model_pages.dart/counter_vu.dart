import 'package:firebase_project_practice/PAGES/model_pages.dart/counter_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ListViewVUVM extends StackedView<ViewModel> {
  @override
  Widget builder(BuildContext context, ViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.appbarTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogFunction(context, viewModel, viewModel.editingIndex);
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("${viewModel.listItems[index].name}"),
              subtitle: Text("${viewModel.listItems[index].number}"),
              trailing: SizedBox(
                width: MediaQuery.of(context).size.width * .3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialogFunction(context, viewModel, index);
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.remove(index);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: viewModel.listItems.length),
    );
  }

  Future<dynamic> showDialogFunction(
      BuildContext context, ViewModel viewModel, int? index) {
    if (index != null) {
      viewModel.nameController.text = viewModel.listItems[index].name;
      viewModel.numberController.text = viewModel.listItems[index].number;

      viewModel.editingIndex = index;
    }
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Crud by VUVM"),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: viewModel.formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: viewModel.nameController,
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
                    controller: viewModel.numberController,
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
                      viewModel.onvalidateVUVM(context);
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
  }

  @override
  ViewModel viewModelBuilder(BuildContext context) {
    return ViewModel();
  }
}
