import 'package:flutter/material.dart';
import 'package:flutterscala/pages/home/partials/homepage_body.dart';
import 'package:flutterscala/pages/home/partials/homepage_sidebar.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];
  List<String> notes2 = [];

  void addNewNote() {
    setState(() {
      int lowerBound = 0;
      int upperBound = 13;
      int i = 0;

      // Creazione dell'istanza di Random
      Random random = Random();

      for (i = 0; i < 13; i++) {
        // Generazione di un numero casuale tra lowerBound e upperBound (escluso)
        int randomNumber = lowerBound + random.nextInt(upperBound - lowerBound);
        int randomNumber2 =
            lowerBound + random.nextInt(upperBound - lowerBound);

        notes.add("" + randomNumber.toString());
        notes2.add("" + randomNumber2.toString());
      }
    });
  }

  void onDeleteNote(String note) {
    setState(() {
      notes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomePageSidebar(addNewNote: addNewNote),
          HomePageBody(
            notes: notes,
            notes2: notes2,
            onDeleteNote: onDeleteNote,
          )
        ],
      ),
    );
  }
}
