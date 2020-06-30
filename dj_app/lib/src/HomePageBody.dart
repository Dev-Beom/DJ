import 'package:flutter/material.dart';
import 'model/Restaurant.dart';
import 'Summary.dart';

class HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverAppBar(
              //스크롤을 올리면 AppBar를 숨길지 보일지에 대한 설정
              centerTitle: true,
              floating: true, //스크롤 내릴 때 SliverAppBar가 나옴(true), 안 나옴(false)
              pinned: false, //스크롤 올릴 때 SliverAppBar가 남아있음(true), 남 남아 있음(false)
              snap:
                  true, //floating이 true일 때만 true값을 가질 수 있음. floating 중간에 손을 땟을 때 SliverAppBar의 사이즈가 끝으로 감(true), 그대로 멈춤(false)
              title: Text(
                'title',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 36.0,
                ),
              ),
            ),
            SliverPadding(
              //다른 Sliver를 포함하고 패딩을 적용 할 수 있는 간단한 Sliver
              padding: EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                //SliverList와 비슷하지만 '높이가 고정 된 항목'의 경우 사용, slivers 속성 안에 위젯 배열로 자식 데이터들이 들어간다.
                itemExtent: 152.0, //행의 크기를 설정하는 속성, 크기가 모두 같으면 그리는 속도가 빨라진다.
                delegate: SliverChildBuilderDelegate(
                    //ListView.builder와 같은 기능을 제공한다
                    (context, index) => Summary(restaurants[index]),
                    childCount: restaurants
                        .length), //childCount는 아래에 있을 자식들이 몇개인지 설정해주는 속성
              ),
            )
          ],
        ),
      ),
    );
  }
}
