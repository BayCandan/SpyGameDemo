// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:random_string/random_string.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:spy/card.dart';

// class GameScreen extends StatefulWidget {
//   const GameScreen({
//     super.key, 
//   });

//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }

// class _GameScreenState extends State<GameScreen> {
//   _getPlayers() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     players = (await prefs.getInt("players"))?? 3 ;
    
//   }
  
//   int num = randomBetween(0, 5);
//   int spiesrandom = randomBetween(1, 5);
//   int sayac = 1;
//   int bos = 0;
//   int sira = 0;
  
//   int players = 4;
//   var mapsList = [];
//   String blabla = 'HAZIR MISIN';
//   String inkWellText = 'GOSTER';

//   List mapsInPlay = ['edirne', 'istanbul', 'bursa', 'ankara', 'antalya'];
//   int mapsIndex = randomBetween(0, 4);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.black38,
//           title: Text("Casus"),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomRight: Radius.circular(25),
//               bottomLeft: Radius.circular(25),
//             ),
//           ),
//         ),
//       backgroundColor: Colors.blueGrey,
//       body: Column(
//         children: [
//           SizedBox(
//             height: 50,
//           ),
//           Container(
//             padding: EdgeInsets.all(30),
//             width: double.maxFinite,
//             height: 150,
//             // color: Colors.white,
//             child: Text(
//               "Oyuncu $sayac ",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 40),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.only(bottom: 50),
//             margin: EdgeInsets.symmetric(horizontal: 50),
//             width: double.maxFinite,
//             height: 300,
//             decoration: BoxDecoration(
//                 color: Colors.green, borderRadius: BorderRadius.circular(50)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   "Harita",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 50),
//                 ),
//                 Text(blabla)
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 150,
//           ),
//           InkWell(
//             onTap: () {

//               Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => CardScreen()));

//               setState(() {
//                 if (sayac == spiesrandom && sira % 2 == 0) {
//                   blabla = 'CASUS';
//                   print('causu');

//                   sira++;
//                 } else if (sira % 2 == 1 && sayac < players) {
//                   sayac = sayac + 1;
//                   sira = sira + 1;
//                   blabla = "Hazri misin";
//                   inkWellText = 'GOSTER';
//                   print(sayac);
//                 } else if (sira < (players * 2 - 1)) {
//                   blabla = mapsInPlay[mapsIndex].toString();
//                   sira = sira + 1;
//                   inkWellText = 'SAKLA';
//                 } else if (sira == (players * 2 - 1)) {
//                   blabla = 'Oyun Basliyor';
//                   inkWellText = 'OYUNA BASLA';
//                   sira++;
//                 } else {
//                   print("Oyun basladi");
//                 }

                
//               });
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 20, right: 40),
//               height: 80,
//               width: 300,
//               decoration: BoxDecoration(
//                 color: Colors.grey,
//                 borderRadius: BorderRadius.circular(50),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(
//                     Icons.play_arrow,
//                     color: Colors.black,
//                   ),
//                   Text(
//                     inkWellText,
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // ElevatedButton(
//           //   child: Text("Sayfa gec"),
//           //   onPressed: () {
//           //     Route route=MaterialPageRoute(builder: (context){return HomePage();});
//           //     Navigator.push(context, route);
//           //   },
//           // )
//         ],
//       ),
//     );
//   }

//   showCheck(sira) {
//     ;
//     if (sira & 2 == 1) {
//       setState(() {
//         Text(
//           mapsInPlay[mapsIndex].toString(),
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 50),
//         );
//       });
//     } else {
//       setState(() {
//         Text(
//           "Hazir misin",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 50),
//         );
//       });
//     }
//   }
// }
// // array tanimla random spy ekle
// // notifire