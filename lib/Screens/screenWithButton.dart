import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_day_3/Screens/NewsScreen.dart';
import 'package:flutter_day_3/models/Handler.dart';
import 'package:flutter_day_3/services/connection.dart';

class ScreenWithButton extends StatefulWidget {
  @override
  _ScreenWithButtonState createState() => _ScreenWithButtonState();
}

class _ScreenWithButtonState extends State<ScreenWithButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            loading = true;
          });
          Connection data = Connection();
          List articles;
          while (articles == null)
            articles = Handler(await data.getData()).returnList();
          if (articles.isNotEmpty) {
            setState(() {
              loading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsScreen(
                  aritcles: articles,
                ),
              ),
            );
          } else
            setState(() {
              loading = false;
            });
        },
        child: Icon(Icons.add),
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(),
    );
  }
}
