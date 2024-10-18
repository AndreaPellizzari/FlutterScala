import 'package:flutter/material.dart';

class HomePageSidebar extends StatelessWidget {
  final void Function() addNewNote;

  const HomePageSidebar({required this.addNewNote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.grey.shade200,
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://lh3.googleusercontent.com/a/ACg8ocL8wHavwlVIriwF8Ul4oUovbR8xyTmFUvAxq4ti5PyJuQ=s360-c-no"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                    onPressed: addNewNote,
                    icon: Icon(
                      Icons.add,
                      size: 30,
                    )),
              ),
            ]),
      ),
    );
  }
}
