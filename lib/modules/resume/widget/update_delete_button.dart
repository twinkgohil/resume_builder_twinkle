import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class UpdateDeleteButton extends StatelessWidget {
  final void Function() updateOnPress;
  final void Function() deleteOnPress;
  const UpdateDeleteButton({super.key, required this.updateOnPress, required this.deleteOnPress});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.edit_note_rounded),
        ),
        SizedBox(width: getSize(2)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete_forever_rounded),
          color: Colors.redAccent,
        ),
      ],
    );
  }
}
