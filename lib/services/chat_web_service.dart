// import 'dart:async';
// import 'dart:convert';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class ChatWebService {
//   static final _instance = ChatWebService._internal();
//   late WebSocketChannel? _channel;

//   factory ChatWebService() => _instance;

//   ChatWebService._internal();

//   final _searchResultController =
//       StreamController<Map<String, dynamic>>.broadcast();
//   final _contentController = StreamController<Map<String, dynamic>>.broadcast();
//   // final _searchResultController = StreamController<Map<String, dynamic>>();
//   // final _contentController = StreamController<Map<String, dynamic>>();

//   Stream<Map<String, dynamic>> get searchResult =>
//       _searchResultController.stream;

//   Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

//   void connect() {
//     _channel = WebSocketChannel.connect(
//       Uri.parse("ws://127.0.0.1:8000/ws/chat"),
//     );

//     _channel!.stream.listen((message) {
//       final data = json.decode(message);
//       if (data['type'] == 'search_result') {
//         _searchResultController.add(data);
//       } else if (data['type'] == 'content') {
//         _contentController.add(data);
//       }
//     });
//   }

//   void chat(String query) {
//     // final jsonMessage = json.encode({'query': query});
//     _channel!.sink.add(
//       json.encode({'query': query}),
//     ); // ✅ Use sink.add, not send

//     if (_channel != null) {
//       _channel!.sink.add(json.encode({'query': query}));
//     } else {
//       print("❌ Cannot send. WebSocket not connected.");
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  late WebSocketChannel? _channel;

  factory ChatWebService() => _instance;

  ChatWebService._internal();
  final _searchResultController =
      StreamController<Map<String, dynamic>>.broadcast();
  final _contentController = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse("ws://192.168.100.233:8000/ws/chat"),
    );

    //   _channel = WebSocketChannel.connect(
    //   Uri.parse("ws://192.168.100.233:8000/ws/chat"),
    // );

    _channel!.stream.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_result') {
        _searchResultController.add(data);
      } else if (data['type'] == 'content') {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    print(query);
    print(_channel);
    _channel!.sink.add(json.encode({'query': query}));
  }
}
