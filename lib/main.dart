import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:flutter/material.dart';

import 'myapp.dart';

void main() async {
  SendPort mainToIsolateStream = await initIsolate();
  mainToIsolateStream.send("this is from main");
  runApp(const MyApp());
}

Future<SendPort> initIsolate() async {
  /* it will return send port so that the main can send data to isolate*/
  Completer<SendPort> completer = Completer<SendPort>();
  ReceivePort isolate = ReceivePort();
  isolate.listen((message) {
    if (message is SendPort) {
      SendPort mainToIsolate = message;
      completer.complete(mainToIsolate);
    } else {
      print("isolate to main $message");
    }
  });
  await Isolate.spawn(myIsolate, isolate.sendPort);
  return completer.future;
}

void myIsolate(SendPort isolate) {
  ReceivePort main=ReceivePort();
  isolate.send(main.sendPort);
  main.listen((message) {
    print("main to isolate stream ${message}");
   // exit(0);
  });
  isolate.send("this is from my isolate");
}
