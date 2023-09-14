import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String input_text;
  SecondPage({super.key, required this.input_text});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int r_number = Random().nextInt(999);
  String fusion = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 2'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.blue,
                  Colors.white,
                ]),
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Genere numero random",
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("$r_number",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {});
                    r_number = Random().nextInt(999);
                  },
                  child: Text("Generar"),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 8,
                ),
                MaterialButton(
                  onPressed: () {
                    fusion = widget.input_text + r_number.toString();
                    Navigator.of(context).pop(fusion);
                    Navigator.of(context).pop();
                  },
                  child: Text("Guardar"),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ));
  }
}
