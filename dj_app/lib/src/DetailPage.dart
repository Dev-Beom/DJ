import 'package:dj_app/src/model/Restaurant.dart';
import 'package:flutter/material.dart';
import 'Style.dart';
import 'Summary.dart';
import 'Separator.dart';

class DetailPage extends StatelessWidget {
  final Restaurant restaurant;
  DetailPage(this.restaurant);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: <Widget>[
            _getBackground(restaurant),
            _getGradient(),
            _getContent(restaurant),
            _getToolbar(context),
          ],
        ),
      ),
    );
  }
}

Container _getBackground(Restaurant restaurant) {
  return Container(
    child: Image.asset(
      restaurant.backgroundImg,
      fit: BoxFit.cover,
      height: 300.0,
    ),
    constraints: BoxConstraints.expand(height: 300.0),
  );
}

Container _getGradient() {
  return Container(
    margin: EdgeInsets.only(top: 190.0),
    height: 110.0,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[Color(0x00736AB7), Color(0xFF736AB7)],
        stops: [0.0, 0.9],
        begin: FractionalOffset(0.0, 0.0),
        end: FractionalOffset(0.0, 1.0),
      ),
    ),
  );
}

Widget _getContent(Restaurant restaurant) {
  final _overviewTitle = "Overview".toUpperCase();
  return ListView(
    padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
    children: <Widget>[
      Summary(
        restaurant,
        horizontal: false,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _overviewTitle,
              style: headerTextStyle(),
            ),
            Separator(),
            Text(restaurant.description),
          ],
        ),
      ),
    ],
  );
}

Container _getToolbar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    child: BackButton(color: Colors.white),
  );
}
