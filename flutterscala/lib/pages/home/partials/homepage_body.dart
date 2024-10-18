import 'package:flutter/material.dart';
import 'package:flutterscala/components/Note.dart';

class HomePageBody extends StatelessWidget {
  final List<String> notes;
  final List<String> notes2;
  final void Function(String note) onDeleteNote;

  const HomePageBody({
    required this.notes,
    required this.notes2,
    required this.onDeleteNote,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
            child: Container(
              color: Color.fromRGBO(0, 128, 0, 1.0),
              /*
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/sfondo.jpg'), // Image from assets
                  fit: BoxFit.fill, // Covers the entire container
                ),
              ),
              */
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        Text(
                          "Agenda",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        */
                        Row(
                          children: notes
                              .map((note) => Note(
                                    text: note,
                                    onDoubleTap: () => onDeleteNote(note),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /*
                        Text(
                          "Agenda",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        */
                        Row(
                          children: notes2
                              .map((note) => Note(
                                    text: note,
                                    onDoubleTap: () => onDeleteNote(note),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
