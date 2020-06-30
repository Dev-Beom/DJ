import 'package:flutter/material.dart';
import 'HomePageBody.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Alert Dialog title"),
          content: Text("Alert Dialog body"),
          actions: <Widget>[
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomePageBody(),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showDialog();
        },
        label: Text('Like'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
