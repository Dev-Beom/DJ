import 'package:dj_app/src/model/Restaurant.dart';
import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'Style.dart';

class Summary extends StatelessWidget {
  final Restaurant restaurant;
  final bool horizontal;

  Summary(this.restaurant,
      {this.horizontal = true}); //생성자는 restaurant 정보와 horizontal 2개를 받을 수 있게 설정
  Summary.vertical(this.restaurant) : horizontal = false;

  @override
  Widget build(BuildContext context) {
    final restaurantThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      child: Hero(
        //화면 전환간에 특정 이미지를 다른 화면으로 비행시키는 것.
        tag: "planet-hero-${restaurant.id}", //hero의 key역할
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
      //GestureDetector은 사용자가 스크린을 터치하거나 더블클릭, 드래그 등등 사용자 모션을 캡처해서 이벤트를 가져오기 위해 사용되는 위젯
      onTap: horizontal //horizontal이 true일 때 navigator을 사용
          ? () => Navigator.of(context).push(
                PageRouteBuilder(
                  //animation 객체를 재공해주는 클래스. 페이지 시에 애니메이션을 사용할 수 있게 해줌.
                  pageBuilder: (_, __, ___) => DetailPage(restaurant),
                  transitionsBuilder: //transitionsBuilder는 PageRouteBuilder의 리턴 위젯이고, 경로 전환을 위한 콜백함수 역할을 한다.
                      (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                ),
              )
          : null, //horizontal이 false일 때 null을 사용
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(
          //각각의 위젯을 겹쳐서 보여주기 위한 위젯. restaurantCard와 restaurantThumbnail을 겹쳐서 보여준다.
          children: <Widget>[
            restaurantCard,
            restaurantThumbnail,
          ],
        ),
      ),
    );
  }
}
