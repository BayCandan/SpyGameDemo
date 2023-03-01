import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spy/card.dart';
import 'package:spy/models/den.dart';
import 'package:spy/timer_counter.dart';
import 'package:spy/yan/how_to_play.dart';
import 'yan/connect.dart';
import 'players_to_choose.dart';
import 'dart:io';
import 'dart:convert';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _listeyiDoldur;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listeyiDoldur = jsonOku();
  }
  List locasyonListesi = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    int _selectedIndex = 1;
    void _navigateBottomBar(int index) {
      setState(() {
        _selectedIndex = index;
        print(index);
      });
    }
    locasyonListesi;
    print(_listeyiDoldur);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        backgroundColor: Colors.blueGrey,
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
        body: HomePage(),
      ),
    );
  }

  void _listeyiKaydett() async {
    final preferences = await SharedPreferences.getInstance();

    preferences.setStringList('list' ,_listeyiDoldur);

  }

  jsonOku()async{
    String okunanString = await DefaultAssetBundle.of(context)
    .loadString("assets/location.json");

    var jsonObject = jsonDecode(okunanString);
    List locListesi = jsonObject;

    
    print(locListesi[0]["loc"]);
    locasyonListesi.remove(0);
    print(locListesi[0]["loc"]);
  }
}
// void deneme(){
//   return Navigator.of(context).push(
//         //           MaterialPageRoute(builder: (context) => KayitScreen3()));
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            // padding: EdgeInsets.only(top: 100),
            width: double.maxFinite,
            height: 60,
            // color: Colors.amber,
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
        // BottomNavigationBar(backgroundColor: Colors.amber,),
        SizedBox(
          height: 80,
        ),
        // Container(
        //   alignment: Alignment.bottomCenter,
        //   padding: EdgeInsets.only(top: 52, bottom: 0),
        //   child: InkWell(
        //     onTap: () {
        //       Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => KayitScreen3()));
        //     },
        //     child: Container(
        //       padding: EdgeInsets.only(left: 20, right: 100),
        //       height: 80,
        //       width: 300,
        //       decoration: BoxDecoration(
        //         color: Colors.grey,
        //         borderRadius: BorderRadius.circular(50),
        //       ),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Icon(
        //             Icons.play_arrow,
        //             color: Colors.black,
        //           ),
        //           Text(
        //             "DEVAM ",
        //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        //           )
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: Container(
            alignment: Alignment.bottomCenter,
            child: CurvedNavigationBar(
              backgroundColor: Colors.blueGrey,
              color: Colors.black38,
              index: 1,
              animationDuration: Duration(milliseconds: 300),
              onTap: (index) {
                setState(() {
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HowToPlay()));
                  
                  }
                  if (index == 1) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => KayitScreen3()));
                  }
                  if(index == 2){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Connect()));
                  }
                });
              },
              items: [
                Icon(Icons.info),
                Icon(Icons.arrow_forward_ios_sharp,size: 30,),
                Icon(Icons.contact_mail),
              ],
            ),
          ),
        ),
      ],
    );
  }
  

}
