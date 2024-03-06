import 'dart:convert';
import '/services/consts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class GenImage extends StatefulWidget {
  @override
  State<GenImage> createState() => _GenImageState();
}
class _GenImageState extends State<GenImage> {
  TextEditingController inputText = TextEditingController();
  // String apikey = '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';
  String url = 'https://api.openai.com/v1/images/generations';
  String? image;
  void getAIImage() async{
    if(inputText.text.isNotEmpty){
      
      var data ={
        "prompt": inputText.text,
        "n": 1,
        "size": "256x256",
      };
      
      var res = await http.post(Uri.parse(url),
          headers: {"Authorization":"Bearer $apikey","Content-Type": "application/json"},
          body:jsonEncode(data));
      var jsonResponse = jsonDecode(res.body);
      image = jsonResponse['data'][0]['url'];
      setState(() {
      });
      
    }else{
      print("Enter something");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Open AI DALL.E"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null ? Image.network(image!,width: 256,height: 265) : Container(child: Text("Please Enter Text To Generate AI image"),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: inputText,
                decoration: InputDecoration(
                    hintText: "Enter Text to Generate AI Image",
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getAIImage();
        },
        tooltip: 'Generate AI Image',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}