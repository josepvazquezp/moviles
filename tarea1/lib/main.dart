import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _iconColor1 = Colors.black;
  Color _iconColor2 = Colors.black;
  Color _iconColor3 = Colors.black;
  Color _iconColor4 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter'),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 150,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Flutter McFlutter',
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        'Experienced App Developer',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('123 Main Street'),
                  Text('(415) 555-0198'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.accessibility_sharp, color: _iconColor1),
                    onPressed: () {
                      setState(() {
                        if (_iconColor1 == Colors.black) {
                          _iconColor1 = Colors.indigo;
                        } else {
                          _iconColor1 = Colors.black;
                        }
                      });
                    },
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_iconColor2 == Colors.black) {
                            _iconColor2 = Colors.indigo;
                          } else {
                            _iconColor2 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(Icons.timer, color: _iconColor2)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_iconColor3 == Colors.black) {
                            _iconColor3 = Colors.indigo;
                          } else {
                            _iconColor3 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(Icons.phone_android, color: _iconColor3)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if (_iconColor4 == Colors.black) {
                            _iconColor4 = Colors.indigo;
                          } else {
                            _iconColor4 = Colors.black;
                          }
                        });
                      },
                      icon: Icon(Icons.phone_iphone, color: _iconColor4)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
