import 'package:flutter/material.dart';
import 'package:spy/widget/continue.dart';
import 'players_to_choose.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 130),
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/card_icon.png"),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 50),

              width: double.maxFinite,
              height: 60,

              child: Center(child: Text("Casus",textAlign: TextAlign.center, style: TextStyle(fontSize: 50))),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.only(top: 100),
              width: double.maxFinite,
              height: 60,
              child: Center(
                child: Text(
                  "Kendini Dedektif gibi hissetmekten ve yalancilari bulmaktan hoslananlar icin bir oyun",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
    
          SizedBox(
            height: 20,
          ),
    
         DevamButton(context,PlayerChoose())
        ],
      ),
    );
  }
  Widget MyDrawerList(){
    return Container();
  }
}