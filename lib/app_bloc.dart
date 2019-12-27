import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/services.dart';


class AppBloc extends BlocBase {
  //Event Channel creation
  static const stream = const EventChannel('https.andy.dragonvc.com/events');

  //Method channel creation
  static const platform =
      const MethodChannel('https.andy.dragonvc.com/cnannel');

  StreamController<Uri> _stateController = StreamController();

  Stream<Uri> get state => _stateController.stream;

  Sink<Uri> get stateSink => _stateController.sink;

  Future<String> startUri() async {
    try {
      return platform.invokeMethod('initialLink');
    } catch (e) {
      return "Failed to Invoke: '${e.message}'.";
    }
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
    _stateController.close();
  }
}
