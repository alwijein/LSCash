import 'package:akudamadrive/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/background_blur.png"),
            fit: BoxFit.cover,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: buildCard(Icons.money_sharp, "Pemasukan")),
                  Flexible(
                      flex: 1,
                      child: buildCard(Icons.money_off, "Pengeluaran")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Card buildCard(IconData _icon, String _title) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(_title),
            subtitle: Text('Rp 10.000'),
          ),
        ],
      ),
    );
  }
}
