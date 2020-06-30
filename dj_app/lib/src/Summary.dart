import 'package:dj_app/src/model/Restaurant.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'Style.dart';

class Summary extends StatelessWidget {
  final Restaurant restaurant;
  final bool horizontal;

  Summary(this.restaurant, {this.horizontal = true});
  Summary.vertical(this.restaurant) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final restaurantThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        tag: "planet-hero-${restaurant.id}",
        child: Image(
          image: AssetImage(restaurant.image),
          height: 92.0,
          width: 92.0,
        ),
      ),
    );

    Widget _restaurantValue({String value, String image}) {
      return Container(
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Image.asset(image, height: 12.0),
          Container(width: 8.0),
          Text(restaurant.gravity, style: regularTextStyle()),
        ]),
      );
    }

    final restaurantCardContent = Container(
      margin: EdgeInsets.fromLTRB(
          horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(restaurant.name, style: headerTextStyle()),
          Container(height: 10.0),
          Text(restaurant.location, style: subHeaderTextStyle()),
          Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              width: 18.0,
              color: Color(0xff00c6ff)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _restaurantValue(
                      value: restaurant.distance,
                      image: 'assets/img/ic_distance.png')),
              Container(
                width: 32.0,
              ),
              Expanded(
                  flex: horizontal ? 1 : 0,
                  child: _restaurantValue(
                      value: restaurant.gravity,
                      image: 'assets/img/ic_gravity.png'))
            ],
          ),
        ],
      ),
    );

    final restaurantCard = Container(
      child: restaurantCardContent,
      height: horizontal ? 124.0 : 154.0,
      margin:
          horizontal ? EdgeInsets.only(left: 46.0) : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => DetailPage(restaurant),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          children: <Widget>[
            restaurantCard,
            restaurantThumbnail,
          ],
        ),
      ),
    );
  }
}
