import 'package:flutter/material.dart';

class HomePageSidebar extends StatelessWidget {
  final void Function() addNewNote;
  final void Function() play;
  final void Function() hostAvversario;
  final TextEditingController controller;

  HomePageSidebar(
      {required this.addNewNote,
      required this.play,
      required this.hostAvversario,
      required this.controller});

  String _printTextFieldValue() {
    // Step 3: Access the text property of the controller
    String textFieldValue = controller.text;
    return textFieldValue;
  }

  @override
  void dispose() {
    // Step 4: Dispose the controller when no longer needed to free up resources
    controller.dispose();
  }

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
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter',
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
