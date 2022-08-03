import 'package:flutter/material.dart';

class TagList extends StatelessWidget {
  final tagList = [
    'High',
    'Intermediate',
    'Low',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: tagList
          .map((e) => Container(
                margin: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: Text(
                  e,
                  style: TextStyle(color: Color.fromARGB(255, 91, 91, 91)),
                ),
              ))
          .toList(),
    );
  }
}
