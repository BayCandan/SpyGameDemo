import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Connect extends StatelessWidget {
  const Connect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Container(
            height: 500,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blueGrey.shade600,
            ),
            margin: EdgeInsets.only(bottom: 100),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: const Text(
                    'ecandan.dev@gmail.com',
                    textScaleFactor: 1.25,
                  ),
                ),
                const ListTile(
                  leading: FaIcon(FontAwesomeIcons.instagram),
                  title: Text(
                    '@candangram',
                    textScaleFactor: 1.25,
                  ),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.linkedin),
                  title: Text(
                    'www.linkedin.com/in/ersincandan',
                    textScaleFactor: 1.25,
                  ),
                ),ListTile(
                  leading: Icon(Icons.add_location_outlined),
                  title: Text(
                    'ISTANBUL / TURKIYE ',
                    textScaleFactor: 1.25,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
