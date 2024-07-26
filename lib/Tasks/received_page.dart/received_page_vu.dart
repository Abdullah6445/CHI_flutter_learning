import 'package:firebase_project_practice/Tasks/custom_list_tile/custom_listtile.dart';
import 'package:firebase_project_practice/Tasks/received_page.dart/received_page_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ReceivedPageVU extends StackedView<ReceivedPageVM> {
  @override
  Widget builder(
      BuildContext context, ReceivedPageVM viewModel, Widget? child) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CustomListTile(
            text: "Calls Received",
            leadingIcon: Icons.call_received,
            onDelete: () {
              debugPrint("received delete");
            },
            onEdit: () {
              debugPrint("received edit");
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 19);
  }

  @override
  ReceivedPageVM viewModelBuilder(BuildContext context) {
    return ReceivedPageVM();
  }
}
