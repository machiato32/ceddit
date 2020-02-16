import 'package:flutter/material.dart';
import 'main.dart';
import 'user.dart';

class PostRoute extends StatefulWidget {
  @override
  _PostRouteState createState() => _PostRouteState();
}

class _PostRouteState extends State<PostRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
          centerTitle: false,
          title: Text('ceddit')
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(

        ),
      )
    );
  }
}

class PostData{
  String title, text;
  User user;

  PostData(this.title, this.text, this.user);

}
