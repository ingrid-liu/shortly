import 'package:flutter_test/flutter_test.dart';
import 'package:shortly/api/url_shorten.dart';

void main() {
  group('URL Shortener', () {
    test('returns a shortened URL if the http call completes successfully',
        () async {
      const originalURL = 'https://www.google.com';
      const shortURL = 'https://do5v.short.gy/naHuOa';
      expect(await APIs.getShortenedUrl(originalURL), shortURL);
    });

    test('returns an error message if the http call fails', () async {
      const originalURL = '';
      expect(await APIs.getShortenedUrl(originalURL),
          'Something went wrong (Try again in sometime)');
    });
  });
}
