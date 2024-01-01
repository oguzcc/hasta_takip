import 'dart:io';

abstract class IApiOption {
  String get baseUrl;
  Duration get receiveTimeout;
  Duration get connectionTimeout;
}

class ApiOption implements IApiOption {
  const ApiOption(
    this.baseUrl,
    this.receiveTimeout,
    this.connectionTimeout,
  );

  //dev
  ApiOption.dev()
      : baseUrl = Platform.isAndroid
            ? 'http://10.0.2.2:8020'
            : 'http://localhost:8020',
        receiveTimeout = const Duration(seconds: 10),
        connectionTimeout = const Duration(seconds: 10);
  //staging
  const ApiOption.staging()
      : baseUrl = 'https://jsonplaceholder.typicode.com',
        receiveTimeout = const Duration(seconds: 10),
        connectionTimeout = const Duration(seconds: 10);
  //prod
  const ApiOption.prod()
      : baseUrl = 'https://jsonplaceholder.typicode.com',
        receiveTimeout = const Duration(seconds: 10),
        connectionTimeout = const Duration(seconds: 10);

  // base url
  @override
  final String baseUrl;

  // receiveTimeout
  @override
  final Duration receiveTimeout;

  // connectTimeout
  @override
  final Duration connectionTimeout;
}
