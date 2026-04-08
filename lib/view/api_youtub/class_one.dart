// class_one.dart
import 'package:flutter/material.dart';
import 'package:test_project/view/api_youtub/model/geet_comments.dart';
import 'package:test_project/view/api_youtub/services/get_services.dart';

class ClassOne extends StatefulWidget {
  const ClassOne({super.key});

  @override
  State<ClassOne> createState() => _ClassOneState();
}

class _ClassOneState extends State<ClassOne> {
  List<Comments> getCommendModel = [];
  bool isLoading = false;

  getCommits() {
    GetApiServices().getCommits().then(
      (value) {
        setState(() {
          getCommendModel = value!;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCommits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : getCommendModel.isEmpty
              ? const Center(child: Text('No data found'))
              : ListView.builder(
                  itemCount: getCommendModel.length,
                  itemBuilder: (context, index) {
                    final apiData = getCommendModel[index];
                    return ListTile(
                      // ✅ Material+Row → ListTile
                      leading: CircleAvatar(
                        child: Text(
                          apiData.id.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      title: Text(apiData.name),
                      subtitle: Text(apiData.email),
                      trailing: Text('#${apiData.postId}'),
                    );
                  },
                ),
    );
  }
}
