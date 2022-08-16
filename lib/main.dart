import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(ppost());

class ppost extends StatefulWidget {
  @override
  State<ppost> createState() => _ppostState();
}

class _ppostState extends State<ppost> {
  var _fun = "";
  final url = "https://v2.jokeapi.dev/joke/Any?type=single";

  void etc() async {
    try {
      final respo = await get(Uri.parse(url));
      final data = jsonDecode(respo.body) as Map;
      _fun = data['joke'] as String;
    } catch (err) {}
  }

  void getjokes() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    etc();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 38, 38, 190),
          // ignore: prefer_const_constructors
          title: Center(
            // ignore: prefer_const_constructors
            child: Text(
              'JOKES',
              textAlign: TextAlign.center,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 243, 239, 242),
                fontWeight: FontWeight.bold,
                wordSpacing: 1.5,
                letterSpacing: 2.0,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                _fun,
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(247, 100, 53, 53),
                  height: 2,
                ),
              ),
            ),
            SizedBox(
                height: 50,
                width: 200,
                child: TextButton(
                  onPressed: getjokes,
                  child: Text('punny me'),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(3),
                    primary: Color.fromARGB(255, 248, 248, 248),
                    textStyle: const TextStyle(fontSize: 15),
                    backgroundColor: Color.fromARGB(239, 7, 122, 47),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
