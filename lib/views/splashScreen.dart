import 'dart:async';
import 'package:flutter/material.dart';
import 'package:publicidade/views/home2.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home2()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.purple[900],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 290.0,
                        child: Image(
                          image: AssetImage('assets/imagens/AppLogo.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 370.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Text(
                  'Agenda Local',
                  style:
                      TextStyle(color: Colors.grey, fontFamily: 'Commissioner'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
