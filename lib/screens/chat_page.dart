import 'package:cat_chat_2/services/consts.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final String OPEN_AI_KEY =
      "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";

  final _openAI = OpenAI.instance.build(
      token: apikey,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true);

  final ChatUser _currentUser =
      ChatUser(id: "1", firstName: "Me", lastName: "Myself");
  final ChatUser _otherUser =
      ChatUser(id: "2", firstName: "Cat", lastName: "");
  List<ChatMessage> _messages = <ChatMessage>[];
  List<ChatUser> _typing = <ChatUser>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/cat_logo.png'),
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Cat Chat',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 3, 10, 50),
      ),
      body: DashChat(
        typingUsers: _typing,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Color.fromRGBO(2, 0, 97, 1),
          containerColor: Color.fromRGBO(141, 139, 255, 1),
        ),
        currentUser: _currentUser,
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messages,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      _typing.add(_otherUser);
    });
    List<Messages> _messageHistory = _messages.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(
          role: Role.user,
          content: m.text,
        );
      } else {
        return Messages(
          role: Role.assistant,
          content: m.text,
        );
      }
    }).toList();

    final request = ChatCompleteText(
        model: GptTurbo0301ChatModel(),
        messages: _messageHistory,
        maxToken: 200);
    final response = await _openAI.onChatCompletion(request: request);

    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messages.insert(
              0,
              ChatMessage(
                  text: element.message!.content,
                  user: _otherUser,
                  createdAt: DateTime.now()));
        });
      }
    }
    setState(() {
      _typing.remove(_otherUser);
    });
  }
}
