import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 16,
            width: 200,
            color: Colors.amber,
            child: Row(
              children: <Widget>[
                SizedBox(),
              ],
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
