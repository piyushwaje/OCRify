
import 'package:doc_scanner/homescreen.dart';
import 'package:flutter/material.dart';


class lunch extends StatefulWidget {
  const lunch({super.key});

  @override
  State<lunch> createState() => _lunchState();
}

class _lunchState extends State<lunch> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()), // Replace with your HomeScreen widget
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,

      child: Center(
        child: Padding(padding: EdgeInsets.only(left: 20,right: 20),

        child: Image.asset("assets/iconlogo.png"),),
      ),
    );
  }
}
