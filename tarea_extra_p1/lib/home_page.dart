import 'package:flutter/material.dart';
import 'package:tarea_extra_p1/second_page.dart';
import 'package:tarea_extra_p1/third_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data_page_2 = "";
  String data_page_3 = "";
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              "BIENVENIDOS",
              style: TextStyle(
                fontFamily: "Dancing",
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          Image.asset(
            "assets/images/bird_dart.png",
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: 60,
          ),
          Text("Seleccione la accion a realizar:",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {});
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Ingrese datos"),
                          content: TextField(
                            controller: textController,
                            decoration: InputDecoration(
                              label: Text("Ingrese palabra"),
                            ),
                            maxLength: 10,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Cancelar"),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                data_page_2 = await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      input_text: textController.text,
                                    ),
                                  ),
                                );

                                setState(() {});
                              },
                              child: Text("Aceptar"),
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  "Pagina 2",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              MaterialButton(
                onPressed: () async {
                  data_page_3 = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ),
                  );

                  setState(() {});
                },
                child: Text(
                  "Pagina 3",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Pg2 => $data_page_2"),
                Text("Pg3 => $data_page_3"),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
