import 'dart:io';

class SputniknHttpOverrides extends HttpOverrides {
  SputniknHttpOverrides(this.httpProxy);

  final String httpProxy;

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // just for ignore checking self signed certificate
    final client = super.createHttpClient(context);
    if (httpProxy.isNotEmpty) {
      client.findProxy = (uri) => 'PROXY $httpProxy;';
    }
    client.badCertificateCallback = (cert, host, port) {
      return true;
    };
    return client;
  }
}
