import 'package:flutter/material.dart';
import 'HomePageBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'DJ',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontFamily: 'Poppins',
      //       fontWeight: FontWeight.w600,
      //       fontSize: 36.0,
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        
        backgroundColor: Colors.pink,
        onPressed: () {},
        label: Text('Like'),
        icon: Icon(Icons.thumb_up),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomePageBody(),
        ],
      ),
    );
  }
}
