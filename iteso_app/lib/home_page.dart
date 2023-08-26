import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _like = Colors.black45;
  Color _dislike = Colors.black45;
  Color _iconColor1 = Colors.black;
  Color _iconColor2 = Colors.black;
  Color _iconColor3 = Colors.black;
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              Image.network(
                "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg",
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 32,
              ),
              ListTile(
                  title: Text(
                    "El ITESO, Universidad Jesuita de Guadalajara",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "San Pedro Tlaquepaque, Jal.",
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            likes -= 1;
                            _dislike = Colors.blue;
                            _like = Colors.black45;

                            if (likes <= 0) {
                              likes = 0;
                              _dislike = Colors.black45;
                            }
                          });
                        },
                        icon: Icon(Icons.thumb_down, color: _dislike),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            likes += 1;
                            _like = Colors.blue;
                            _dislike = Colors.black45;
                          });
                        },
                        icon: Icon(Icons.thumb_up, color: _like),
                      ),
                      Text("$likes"),
                    ],
                  )),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              _iconColor1 = _iconColor1 == Colors.black
                                  ? Colors.indigo
                                  : Colors.black;
                            });

                            if (_iconColor1 == Colors.indigo) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Icon 1: S')));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }
                          },
                          icon: Icon(Icons.message, color: _iconColor1)),
                      Text("Correo"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              _iconColor2 = _iconColor2 == Colors.black
                                  ? Colors.indigo
                                  : Colors.black;
                            });

                            if (_iconColor2 == Colors.indigo) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Icon 2: A')));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }
                          },
                          icon: Icon(Icons.phone, color: _iconColor2)),
                      Text("Llamada"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          iconSize: 48,
                          onPressed: () {
                            setState(() {
                              _iconColor3 = _iconColor3 == Colors.black
                                  ? Colors.indigo
                                  : Colors.black;
                            });

                            if (_iconColor3 == Colors.indigo) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Icon 3: D')));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }
                          },
                          icon: Icon(Icons.directions, color: _iconColor3)),
                      Text("Ruta"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México.Fundada en el año de 1957 por el Padre Luis Hernández Prieto S.J.,3​ José Aguilar Figueroa y el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas.",
                  //textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
