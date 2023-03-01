import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spy/card.dart';

class Roller extends StatefulWidget {
  const Roller({super.key});

  @override
  State<Roller> createState() => _RollerState();
}

class _RollerState extends State<Roller> {
  var _location = '';
  var _casus = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verilerOku();
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 350,
              height: 500,
              margin: EdgeInsets.only(bottom: 100),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => CardScreen())));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Casus Oyuncu " + _casus.toString(),
                        style: TextStyle(fontSize: 35, color: Colors.black54),
                      ),
                      Text(
                        'Locasyon   ' + _location,
                        style: TextStyle(fontSize: 30, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verilerOku() async {
    final preferences = await SharedPreferences.getInstance();
    _location = preferences.getString("loc") ?? '';
    _casus = preferences.getInt("spy") ?? 0;
    setState(() {});
  }
}
