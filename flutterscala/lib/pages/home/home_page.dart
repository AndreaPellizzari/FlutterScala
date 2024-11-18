import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterscala/pages/home/partials/homepage_body.dart';
import 'package:flutterscala/pages/home/partials/homepage_sidebar.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:math';

import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> notes = [];
  List<String> notes2 = [];
  String nameHostAvversario = "";
  TextEditingController controller1 = new TextEditingController();
  late WebSocketChannel channel;
  String _message = "no message yet";

  void initConnection(String endpoint) {
    channel = IOWebSocketChannel.connect("" + endpoint);
    channel.stream.listen((data) {
      setState(() {
        _message = data; // Update UI when a new message is received
      });
    });
  }

  void sendMessage(String message) {
    channel.sink.add(message); // Send a message to the WebSocket
  }

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

  /*
  // Connect the WebSocketChannel later
  void connectWebSocket() {
    channel = IOWebSocketChannel.connect('ws://example.com/websocket');
    print("WebSocket connected.");
  }
  */

  /*
  // Disconnect the WebSocketChannel
  void disconnectWebSocket() {
    if (channel != null) {
      channel!.sink.close(); // Close the WebSocket connection
      channel = null; // Set the channel to null
      print("WebSocket disconnected.");
    }
  }
  */

  void play() {
    setState(() {
      notes.add("" + controller1.text);
      initConnection("" + controller1.text);
      sendMessage("ciaociao");
      notes.add("" + _message);
    });
  }

  void hostAvversario() {
    setState(() {});
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
          HomePageSidebar(
              addNewNote: addNewNote,
              play: play,
              hostAvversario: hostAvversario,
              controller: controller1),
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
