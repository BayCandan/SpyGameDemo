import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spy/card.dart';
import 'package:spy/yan/connect.dart';
import 'package:spy/game_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'yan/how_to_play.dart';

class KayitScreen3 extends StatefulWidget {
  const KayitScreen3({super.key});

  @override
  State<KayitScreen3> createState() => _KayitScreen3State();
}

int players = 3;
int _currentIndex = 0;

class _KayitScreen3State extends State<KayitScreen3> {
  _setPlayers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("players", players);
  }

  _getPlayers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    players = (await prefs.getInt("players")) ?? 3;
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Casus"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Oyuncu Secimi",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  width: 300,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Text(
                        '$players',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        activeColor: Colors.black54,
                        inactiveColor: Colors.black26,
                        value: players.toDouble(),
                        onChanged: (newPlayers) {
                          setState(() {
                            players = newPlayers.round();
                          });
                        },
                        min: 3,
                        max: 10,
                        // label: '$players',
                        divisions: 7,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
            child: Container(
             

            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              backgroundColor: Colors.blueGrey,
              color: Colors.black38,
              index: 1,
              animationDuration: Duration(milliseconds: 300),
              onTap: (index) {
                 _setPlayers();
                setState(() {
                  
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HowToPlay()));
                  
                  }
                  if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CardScreen()));
                  }
                  if(index == 2){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Connect()));
                  }
                });
              },
              items: [
                Icon(Icons.info),
                Icon(Icons.arrow_right_rounded,size: 50,),
                Icon(Icons.contact_mail),
              ],
            ),
          ),
        ),
          ],
        ),
      ),
     
    );
  }
}
