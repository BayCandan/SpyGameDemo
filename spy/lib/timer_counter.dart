// import 'dart:async';

// import "package:flutter/material.dart";
// import 'package:spy/rols.dart';

// import 'card.dart';

// class CountdownPage extends StatefulWidget {
//   const CountdownPage({super.key});

//   @override
//   State<CountdownPage> createState() => _CountdownPageState();
// }

// class _CountdownPageState extends State<CountdownPage> {
//   static const countdownDuration = Duration(minutes: 1);
//   Duration duration = Duration();
//   Timer? timer;
//   var isActive = false;


//   bool isCountDown = true;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     startTimer();
//     reset();
//   }

//   void reset() {
//     if (isCountDown) {
//       setState(() => duration = countdownDuration);
//     } else {}
//   }

//   void addTime() {
//     final addSeconds = isCountDown ? -1 : 1;

//     setState(() {
//       final seconds = duration.inSeconds + addSeconds;

//       if (seconds < 30) {
//         timer?.cancel();
//         isActive = true;

//       } else {
//         duration = Duration(seconds: seconds);
//       }
//     });
//   }


//   void startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       body: Center(
//         child: builTime(),
//       ),
//     );
//   }

//   Widget builTime() {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             builTimeCard(time: hours, header: 'HOURS'),
//             const SizedBox(width: 8),
//             builTimeCard(time: minutes, header: "MINUTES"),
//             const SizedBox(width: 8),
//             builTimeCard(time: seconds, header: "SECONDS"),
//           ],
//         ),
//         SizedBox(height: 40,),
//         ElevatedButton(onPressed: (){
//           if (isActive == true) {
//              Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: ((context) => Roller())));
                  
//           } else {
//             Navigator.pushReplacement(context,
//                         MaterialPageRoute(builder: ((context) => Roller())));
//           }
//         }, child: Text("DEvAM",style: TextStyle(fontSize: 40),))
//       ],
//     );
//   }

//   Widget builTimeCard({required String time, required String header}) => Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(
//               time,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//                 fontSize: 50,
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),
//           Text(
//             header,
//             style: TextStyle(fontSize: 24),
//           ),
//         ],
//       );
// }
