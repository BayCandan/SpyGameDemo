import 'dart:math';
import 'package:flutter/material.dart';


import 'package:random_string/random_string.dart';
import 'package:spy/players_to_choose.dart';
import 'package:spy/main.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spy/rols.dart';
import 'package:spy/timer_counter.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final nameTxtCnt = TextEditingController();
  final ageTxtCnt = TextEditingController();

  List _items = [];
  List _biseyler = [];


  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/location.json');
    final data = await json.decode(response);

    setState(
      () {
        _items = data;
      },
    );
  }

  var locasyonListesi= [];
  // void _ListeyiOku() async {
  //   final preferences = await SharedPreferences.getInstance();
  //   locasyonListesi = preferences.getStringl("loc") ?? '';
   
  //   setState(() {});
  // }

  _getPlayers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    players = (await prefs.getInt("players")) ?? 3;
  }

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
      // oyunSonu = 0;
      return CardImage();
    } else if (front % 2 == 1 && nowPlayers != spy && nowPlayers <= players) {
      oyunSonu = 0;
      return PlayerAndLoc();
    } else if (nowPlayers <= players) {
      // oyunSonu = 0;
      return CasusCard();
    } else {
      // oyunSonu = 1;
      return OyunBasliyor();
    }
  }
  void listeEkleme(int index){
    _biseyler.add(index);

  }

  void locRemove(){
    
  }




  // void _veriyiKaydet() async {
  //   final preferences = await SharedPreferences.getInstance();

  //   preferences.setString('loc', _items[_mapIndex]["loc"]);
  //   preferences.setInt('spy', spy);
  //   preferences.setStringList['biseyler', listeEkleme(_mapIndex)];
  // }
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

  Widget OyunBasliyor(){
    return Container(
        width: 350,
        height: 500,
        margin: EdgeInsets.only(bottom: 100),
        child: InkWell(
          onTap: () {
            // _veriyiKaydet();
            print(_mapIndex);
            listeEkleme(_mapIndex);
            print(_biseyler);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => Roller())));
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Oyun Basladi Casusu Ve Lokasyonu Ogrenemk Icin Dokun',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black54),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
      );
  }

  Widget CasusCard(){
    return Container(
        width: 350,
        height: 500,
        margin: EdgeInsets.only(bottom: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Oyuncu " + nowPlayers.toString(),
                style: TextStyle(fontSize: 50, color: Colors.black54),
              ),
              Text(
                'CASUS',
                style: TextStyle(fontSize: 50, color: Colors.black54),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
      );
  }

 Widget PlayerAndLoc(){
  return Container(
        width: 350,
        height: 500,
        margin: EdgeInsets.only(bottom: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Oyuncu " + nowPlayers.toString(),
                style: TextStyle(fontSize: 50, color: Colors.black54),
              ),
              Text(
                _items[_mapIndex]["loc"],
                style: TextStyle(fontSize: 50, color: Colors.black54),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
      );
 }

 Widget CardImage(){
  return Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 500,
                margin: EdgeInsets.only(bottom: 100),
                child: Image(
                  image: AssetImage("assets/card_icon.png"),
                ),
              );
  }

}





//  Navigator.pushReplacement(context,
                // MaterialPageRoute(builder: ((context) => CardScreen())));