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
    channel =
        IOWebSocketChannel.connect("" + endpoint); //  ws://echo.websocket.org
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

  void startWebSocketServer() async {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, 8080);
    print(
        'WebSocket server is running on ws://${server.address.host}:${server.port}');

    notes.add("" +
        'WebSocket server is running on ws://${server.address.host}:${server.port}');

    // Listen for incoming WebSocket connections
    await for (HttpRequest request in server) {
      if (WebSocketTransformer.isUpgradeRequest(request)) {
        WebSocket socket = await WebSocketTransformer.upgrade(request);
        handleWebSocket(socket);
      } else {
        // Respond to non-WebSocket requests
        request.response
          ..statusCode = HttpStatus.forbidden
          ..write('WebSocket connections only!')
          ..close();
      }
    }
  }

  // Handle each WebSocket connection
  void handleWebSocket(WebSocket socket) {
    print('New WebSocket connection established.');

    // Listen for incoming messages
    socket.listen(
      (data) {
        print('Received: $data');
        socket.add('Echo: $data'); // Echo the received message back
      },
      onDone: () {
        print('WebSocket connection closed.');
      },
      onError: (error) {
        print('WebSocket error: $error');
      },
    );
  }

  void listen() {
    setState(() {
      // WebSocket server function
      startWebSocketServer();
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
            controller: controller1,
            listen: listen,
          ),
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
