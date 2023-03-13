import 'package:flutter/material.dart';

Widget PlayerAndLoc(int nowPlayers, List items, int mapIndex) {
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
              style: TextStyle(fontSize: 35, color: Colors.black54),
            ),
            Divider(),
            Text(
              "Lokasyon" ,
              style: TextStyle(fontSize: 35, color: Colors.black54),
            ),
            Text(
              items[mapIndex]["loc"],
              textAlign: TextAlign.center,
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