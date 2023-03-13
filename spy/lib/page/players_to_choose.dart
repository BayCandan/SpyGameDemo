import 'package:flutter/material.dart';
import 'package:spy/page/card.dart';
import 'package:spy/widget/continue.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerChoose extends StatefulWidget {
  const PlayerChoose({super.key});

  @override
  State<PlayerChoose> createState() => _PlayerChooseState();
}

int players = 3;
int _currentIndex = 0;

class _PlayerChooseState extends State<PlayerChoose> {
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
        title: Text("Casus",style: TextStyle(color: Colors.white38,fontSize: 24),),
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
            
            DevamButton(context, CardScreen())
          ],
        ),
      ),
     
    );
  }
}
