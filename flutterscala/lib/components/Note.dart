import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  final String text;
  final void Function() onDoubleTap;

  const Note({
    required this.text,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                spreadRadius: 2,
                color: Colors.black12,
              ),
            ]),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 19,
          ),
        ),
      ),
    );
  }
}
