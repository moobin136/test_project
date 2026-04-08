// get_services.dart
import 'package:test_project/view/api_youtub/model/geet_comments.dart';
import 'package:http/http.dart' as http;

class GetApiServices {
  Future<List<Comments>?> getCommits() async {
    final client = http.Client();
    final url = Uri.parse("https://jsonplaceholder.typicode.com/comments");

    try {
      final response = await client.get(url); // ✅ try এর ভেতরে নিয়ে আসা হয়েছে

      if (response.statusCode == 200) {
        print('=========================== Success =============');
        final json = response.body;
        return commentsFromJson(json);
      } else {
        print('=================Null==============');
        return null;
      }
    } catch (e) {
      print("=============== Exception ==========>>>> ${e.toString()}");
      return null; // ✅ catch এ return null যোগ করা হয়েছে
    } finally {
      client.close(); // ✅ client close করা হয়েছে (memory leak রোধ)
    }
  }
}
