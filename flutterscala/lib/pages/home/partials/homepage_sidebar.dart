import 'package:flutter/material.dart';

class HomePageSidebar extends StatelessWidget {
  final void Function() addNewNote;
  final void Function() play;
  final void Function() hostAvversario;

  const HomePageSidebar(
      {required this.addNewNote,
      required this.play,
      required this.hostAvversario});

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
                    onPressed: play,
                    icon: Icon(
                      Icons.play_arrow,
                      size: 30,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a search term',
                  ),
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
