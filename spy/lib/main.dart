
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spy/shared_theme.dart';
import 'page/home_page.dart';
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  List locasyonListesi = [];

  @override
  Widget build(BuildContext context) {
    locasyonListesi;

    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: spyThemeData,
        home: Scaffold(
    
          appBar: AppBar(
            title: Text("Casus",style: TextStyle(color: Colors.white38,fontSize: 24),),
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

  Widget MyDrawerList() {
    return Container();
  }

  void _listeyiKaydett() async {
    final preferences = await SharedPreferences.getInstance();


  }

  jsonOku() async {
    String okunanString =
        await DefaultAssetBundle.of(context).loadString("assets/location.json");

    var jsonObject = jsonDecode(okunanString);
    List locListesi = jsonObject;

    print(locListesi[0]["loc"]);
    locasyonListesi.remove(0);
    print(locListesi[0]["loc"]);
  }
}
