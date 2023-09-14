import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool b1 = false;
  bool b2 = false;
  bool b3 = false;

  Color unselectedColor = Color.fromARGB(136, 239, 239, 239);
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 3'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                setState(() {});
                b1 = true;
                b2 = false;
                b3 = false;

                Navigator.of(context).pop("°_°.)");
              },
              color: b1 ? selectedColor : unselectedColor,
              child: Text(
                "°_°.)",
                style: TextStyle(color: b1 ? Colors.white : Colors.black),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {});
                b1 = false;
                b2 = true;
                b3 = false;

                Navigator.of(context).pop("(°^°)");
              },
              color: b2 ? selectedColor : unselectedColor,
              child: Text(
                "(°^°)",
                style: TextStyle(color: b2 ? Colors.white : Colors.black),
              ),
            ),
            MaterialButton(
              onPressed: () {
                setState(() {});
                b1 = false;
                b2 = false;
                b3 = true;

                Navigator.of(context).pop("°_(\"_/)_/");
              },
              color: b3 ? selectedColor : unselectedColor,
              child: Text(
                "°_(\"_/)_/",
                style: TextStyle(color: b3 ? Colors.white : Colors.black),
              ),
            ),
          ],
        ));
  }
}
