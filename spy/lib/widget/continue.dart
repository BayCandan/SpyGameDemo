import 'package:flutter/material.dart';

import '../page/players_to_choose.dart';

Widget DevamButton(context, screen) {
  return Expanded(
    child: Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
          

          height: 80,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(

            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "DEVAM ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white38),
              ),
              Icon(
                Icons.play_arrow,
                color: Colors.white38,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
