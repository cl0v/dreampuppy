import 'package:flutter/material.dart';

class DefaultBottomNavigationBar extends StatefulWidget {
  const DefaultBottomNavigationBar({
    super.key,
    this.onIndexChanged,
  });

  final Function(int idx)? onIndexChanged;
  @override
  State<DefaultBottomNavigationBar> createState() =>
      _DefaultBottomNavigationBarState();
}

class _DefaultBottomNavigationBarState
    extends State<DefaultBottomNavigationBar> {
  int idx = 0;
  
  final iconList = [Icons.pets, Icons.quiz_rounded ,Icons.person];

  onIndexChanged(int i) {
    setState(() {
      idx = i;
    });
    widget.onIndexChanged?.call(i);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: 
              iconList.map(
                (icon) => IconButton(
                  onPressed: () => onIndexChanged(iconList.indexOf(icon)),
                  icon: Icon(icon),
                ),
              )
              .toList()),
    );
  }
}
