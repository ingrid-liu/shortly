import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class APIs {
  // we suppose not store the api key in the code, I put it here just for demo purpose
  static String apiKey = "sk_NvAHcnJyewJOZYIA";
  static String domain = "do5v.short.gy";
  static Future<String> getShortenedUrl(String originalURL) async {
    try {
      final res = await post(
        Uri.parse('https://api.short.io/links'),
        headers: {
          "Authorization": apiKey,
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"originalURL": originalURL, "domain": domain}),
      );

      final data = jsonDecode(res.body);

      return data["shortURL"];
    } catch (e) {
      return 'Something went wrong (Try again in sometime)';
    }
  }
}
