// Routes to all services

import 'package:flutter/material.dart';

import 'package:cat_chat_2/screens/chat_page.dart';
import 'package:cat_chat_2/screens/see.dart';
import 'package:cat_chat_2/screens/audio.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatPage());
      case '/see':
        return MaterialPageRoute(builder: (_) => const SeePage());
      case '/audio':
        return MaterialPageRoute(builder: (_) => const AudioPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}