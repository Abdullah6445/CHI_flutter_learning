import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomListTile extends StatelessWidget {
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
  CustomListTile({
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
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text.toString()),
      subtitle: Text(subText.toString()),
      leading: Icon(
        leadingIcon,
        color: leadingIconColor,
      ),
      trailing: Container(
        // color: Colors.blue,
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
  }
}
