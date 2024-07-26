import 'package:firebase_project_practice/Tasks/custom_list_tile/custom_listtile.dart';
import 'package:firebase_project_practice/Tasks/dial_page/dial_page_vm.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class DialPageVU extends StackedView<DialPageVM> {
  @override
  Widget builder(BuildContext context, DialPageVM viewModel, Widget? child) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CustomListTile(
            leadingIcon: Icons.dialpad_rounded,
            onDelete: () {
              debugPrint("dial delete");
            },
            onEdit: () {
              debugPrint("dial edit");
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 19);
  }

  @override
  DialPageVM viewModelBuilder(BuildContext context) {
    return DialPageVM();
  }
}
