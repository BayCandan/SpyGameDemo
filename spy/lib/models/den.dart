import 'dart:convert';

import 'package:flutter/material.dart';

class Den extends StatefulWidget {
  const Den({super.key});

  @override
  State<Den> createState() => _DenState();
}

class _DenState extends State<Den> {
  List deniyorum = ['asd','asdasd','das','sadasda'];
  @override
  Widget build(BuildContext context) {
    jsonOku();
    print(deniyorum);
    yapi();
    return Scaffold(
      appBar: AppBar(
        title: Text("DENEME"),
      ),
      body: Center(),
    );
  }
  jsonOku()async{
    String okunanString = await DefaultAssetBundle.of(context)
    .loadString("assets/location.json");

    var jsonObject = jsonDecode(okunanString);
    List locListesi = jsonObject;

   
  }
  void yapi(){
    deniyorum.removeAt(0);
    print(deniyorum);
  }
}