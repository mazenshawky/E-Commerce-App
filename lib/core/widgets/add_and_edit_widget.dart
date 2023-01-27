import 'package:flutter/material.dart';

import 'my_icon.dart';

class AddAndEditWidget extends StatelessWidget {
  final VoidCallback deletePressed;
  final VoidCallback editPressed;

  const AddAndEditWidget({
    super.key,
    required this.deletePressed,
    required this.editPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyIcon(onPress: deletePressed, icon: Icons.delete),
        MyIcon(
          onPress: editPressed,
          icon: Icons.edit,
        ),
      ],
    );
  }
}
