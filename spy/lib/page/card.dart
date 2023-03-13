import 'dart:math';
import 'package:flutter/material.dart';

import 'package:random_string/random_string.dart';
import 'package:spy/page/players_to_choose.dart';
import 'package:spy/main.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spy/page/rols.dart';
import 'package:spy/widget/spy_card.dart';


import '../widget/card_image.dart';
import '../widget/player_and_loc.dart';
import '../widget/start.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final nameTxtCnt = TextEditingController();
  final ageTxtCnt = TextEditingController();

  List items = [];
  List _biseyler = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/location.json');
    final data = await json.decode(response);

    setState(
      () {
        items = data;
      },
    );
  }

  var locasyonListesi = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  int _mapIndex = randomBetween(0, 50);
  int front = 0;
  int sonLoc = 0;
  int spy = randomBetween(1, players);
  int oyunSonu = 0;
  int nowPlayers = 1;

  @override
  Widget build(BuildContext context) {
    print(_biseyler);

    return Scaffold(
      appBar: AppBar(
        title: Text("Casus",style: TextStyle(color: Colors.white38,fontSize: 24),),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Container(
                  child: Expanded(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            press();
                          });
                        },
                        child: isFront(front)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dynamic isFront(front) {
    if (front % 2 == 0 && nowPlayers <= players + 1) {
      oyunSonu = 0;
      return CardImage();
    } else if (front % 2 == 1 && nowPlayers != spy && nowPlayers <= players) {
      oyunSonu = 0;
      return PlayerAndLoc(nowPlayers, items, _mapIndex);
    } else if (nowPlayers <= players) {
      oyunSonu = 0;
      return CasusCard(nowPlayers);
    } else {
      if (oyunSonu == 0) {
        return OyunBasliyor(context);
      } else {}
      oyunSonu = 1;
      return Roller();
    }
  }

  void listeEkleme(int index) {
    _biseyler.add(index);
  }

  void locRemove() {}

  void press() {
    cardFlip();

    print(spy);
    _getPlayers();
    // print(front);
    front++;
    nowPlayersPlus();
    readJson();
  }

  void cardFlip() {
    Random random = Random();

    int cardValue = random.nextInt(13);
    front % 2 == 0 ? (front = 0) : front = 1;
  }

  void nowPlayersPlus() {
    if (front % 2 == 0) {
      nowPlayers++;
    }
  }

  _getPlayers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    players = (await prefs.getInt("players")) ?? 3;
  }

  
}


