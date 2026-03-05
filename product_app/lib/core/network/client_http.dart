import 'package:http/http.dart' as http;

class HttpClient {
  final http.Client _client = http.Client();

  Future<http.Response> get(String path) async {
    return await _client.get(Uri.parse(path));
  }
}