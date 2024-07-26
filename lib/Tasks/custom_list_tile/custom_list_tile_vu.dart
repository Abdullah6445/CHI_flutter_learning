import 'package:firebase_project_practice/Tasks/custom_list_tile/custom_list_tile_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CustomListTileVU extends StackedView<CustomListTileVM> {
  String? text;
  String? subText;

  IconData? leadingIcon;
  IconData? deleteIcon;
  IconData? editIcon;

  Color? leadingIconColor;

  Color? deleteIconColor;

  Color? editIconColor;

  final Function? onDelete;

  final Function? onEdit;
  CustomListTileVU({
    super.key,
    this.text = "Abdullah",
    this.subText = "923317012500",
    this.leadingIcon = Icons.call,
    this.deleteIcon = Icons.delete,
    this.editIcon = Icons.edit,
    this.deleteIconColor = Colors.red,
    this.editIconColor = Colors.green,
    this.leadingIconColor = Colors.blue,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget builder(
          BuildContext context, CustomListTileVM viewModel, Widget? child) =>
      ListTile(
        title: Text(text.toString()),
        subtitle: Text(subText.toString()),
        leading: Icon(
          leadingIcon,
          color: leadingIconColor,
        ),
        trailing: SizedBox(
          width: MediaQuery.sizeOf(context).width * .3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onEdit as void Function()?,
                icon: Icon(editIcon),
                color: editIconColor,
              ),
              IconButton(
                onPressed: onDelete as void Function()?,
                icon: Icon(deleteIcon),
                color: deleteIconColor,
              ),
            ],
          ),
        ),
      );

  @override
  CustomListTileVM viewModelBuilder(BuildContext context) => CustomListTileVM();
}
