import 'package:cat_chat_2/screens/audio.dart';
import 'package:cat_chat_2/screens/chat_page.dart';
import 'package:cat_chat_2/screens/img_gen.dart';
import 'package:cat_chat_2/screens/see.dart';
import 'package:cat_chat_2/utils/service_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat Chat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         ServiceCard(serviceName: "Chat", logoPath: "assets/cat_logo.png", onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatPage()));
               }),
               ServiceCard(serviceName: "Audio", logoPath: "assets/cat_logo.png", onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const AudioPage()));
               }),
          ServiceCard(serviceName: "See & Tell", logoPath: "assets/cat_logo.png", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SeePage()));
          }),
          ServiceCard(serviceName: "Image Generate", logoPath: "assets/cat_logo.png", onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GenImage()));
          }),          
        ],
      ),
    );
  }
}
