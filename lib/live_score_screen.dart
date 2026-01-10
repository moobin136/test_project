import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_project/cicket_score.dart';

class LiveScoreScreen extends StatefulWidget {
  const LiveScoreScreen({super.key});

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  List<CicketScore> cicketScoreList = [];

  // ignore: unused_element
  Future<void> _getScoreData() async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Score'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Badge(
              backgroundColor: _isdiccorerColor(false),
            ),
            title: Text('Match ID'),
            subtitle: Text('Team 1 : Bangladesh Team 2 : England'),
          );
        },
      ),
    );
  }

  // ignore: unused_element
  Color _isdiccorerColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.red;
  }
}
