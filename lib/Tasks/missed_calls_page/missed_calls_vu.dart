import 'package:firebase_project_practice/Tasks/custom_list_tile/custom_listtile.dart';
import 'package:firebase_project_practice/Tasks/missed_calls_page/missed_calls_vm.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class MissedCallsPageVU extends StackedView<MissedCallsPageVM> {
  @override
  Widget builder(
      BuildContext context, MissedCallsPageVM viewModel, Widget? child) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return CustomListTile(
            leadingIcon: Icons.missed_video_call,
            text: "Missed Calls",
            onDelete: () {
              debugPrint("missedcalls delete");
            },
            onEdit: () {
              debugPrint("missedcalls edit");
            },
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 5);
  }

  @override
  MissedCallsPageVM viewModelBuilder(BuildContext context) {
    return MissedCallsPageVM();
  }
}
