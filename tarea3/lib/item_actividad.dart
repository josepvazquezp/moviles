import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int i;
  ItemActividad({required this.i, super.key});

  String sc_place(int i) {
    String place = "";

    switch (i) {
      case 1:
        place = "Santuario Meiji";
        break;
      case 2:
        place = "Notre Dame";
        break;
      case 3:
        place = "Neuschwanstein";
        break;
      case 4:
        place = "Ópera de Sídney";
        break;
      default:
        place = "Castillo Osaka";
    }

    return place;
  }

  String sc_img(int i) {
    String place = "";

    switch (i) {
      case 1:
        place = "assets/images/sm.jpeg";
        break;
      case 2:
        place = "assets/images/nd.jpeg";
        break;
      case 3:
        place = "assets/images/ne.jpeg";
        break;
      case 4:
        place = "assets/images/os.jpeg";
        break;
      default:
        place = "assets/images/co.jpeg";
    }

    return place;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            // height: 120,
            // width: 120,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  sc_img(i),
                )),
          ),
          SizedBox(height: 20),
          Text("Day $i", style: TextStyle(fontSize: 11)),
          Text(sc_place(i)),
        ],
      ),
    );
  }
}
