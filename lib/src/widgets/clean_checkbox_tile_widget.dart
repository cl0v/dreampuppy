import 'package:flutter/material.dart';

class CleanCheckBoxTileWidget extends StatelessWidget {
  const CleanCheckBoxTileWidget({
    Key? key,
    required this.therms,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String therms;
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onChanged),
          Center(
            child: Text(therms),
          ),
        ],
      ),
    );
  }
}
