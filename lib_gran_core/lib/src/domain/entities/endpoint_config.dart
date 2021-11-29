import 'dart:convert';

import '../enums/endpoint_type_enum.dart';

/// https://grancursosonline.com.br:1234/grannews/api/
/// - `grancursos` - [domainUrl]
/// - `1234` - [domainPort]
/// - `grannews/api` - [apiName]
class EndpointConfig {
  late String _domainUrl;
  late String _domainPort;
  late String _apiName;
  late EndpointType _type;

  String get domainUrl => _domainUrl;
  String get domainPort => _domainPort;
  EndpointType get type => _type;
  String get baseUrl {
    String appUrl = _domainUrl;

    if (_domainPort.isNotEmpty) appUrl += ':$_domainPort';
    if (_apiName.isNotEmpty) appUrl += '/$_apiName';

    return appUrl;
  }

  @override
  String toString() {
    return 'domainUrl: $_domainUrl, domainPort: $_domainPort, type: $_type, baseUrl: $baseUrl';
  }

  EndpointConfig._internal({
    required String domainUrl,
    required String domainPort,
    required String apiName,
    required EndpointType type,
  }) {
    domainUrl = _removeBackSlash(domainUrl);
    if (!domainUrl.startsWith('http://') && !domainUrl.startsWith('https://')) {
      domainUrl = 'https://$domainUrl';
    }
    _domainUrl = domainUrl;
    _domainPort = _removeBackSlash(domainPort);
    _apiName = _removeBackSlash(apiName);
    _type = type;
  }

  factory EndpointConfig.production({
    required String apiName,
  }) {
    return EndpointConfig._internal(
      domainUrl: 'https://grancursos.com.br',
      domainPort: '',
      apiName: apiName,
      type: EndpointType.production,
    );
  }

  factory EndpointConfig.qa({
    required String apiName,
  }) {
    return EndpointConfig._internal(
      domainUrl: 'https://grancursos',
      domainPort: '8080',
      apiName: apiName,
      type: EndpointType.qa,
    );
  }

  factory EndpointConfig.development({
    required String apiName,
  }) {
    return EndpointConfig._internal(
      domainUrl: 'https://grancursos',
      domainPort: '8081',
      apiName: apiName,
      type: EndpointType.development,
    );
  }

  factory EndpointConfig.custom({
    required String domainUrl,
    required String apiName,
    String? domainPort,
  }) {
    return EndpointConfig._internal(
      domainUrl: domainUrl,
      apiName: apiName,
      domainPort: domainPort ?? '',
      type: EndpointType.custom,
    );
  }

  EndpointConfig copyWith({
    String? domainUrl,
    String? domainPort,
    String? apiName,
    EndpointType? type,
  }) {
    return EndpointConfig._internal(
      domainUrl: domainUrl ?? _domainUrl,
      domainPort: domainPort ?? _domainPort,
      apiName: apiName ?? _apiName,
      type: type ?? _type,
    );
  }

  String _removeBackSlash(String value) {
    if (value.endsWith('/')) {
      value = value.substring(0, value.length - 1);
    }
    if (value.startsWith('/')) {
      value = value.substring(1, value.length);
    }

    return value;
  }

  Map<String, dynamic> toMap() {
    return {
      'domainUrl': _domainUrl,
      'domainPort': _domainPort,
      'apiName': _apiName,
      'type': _type.index,
    };
  }

  factory EndpointConfig.fromMap(Map<String, dynamic> map) {
    return EndpointConfig._internal(
      domainUrl: map['domainUrl'],
      domainPort: map['domainPort'],
      apiName: map['apiName'],
      type: EndpointType.values[map['type']],
    );
  }

  String toJson() => json.encode(toMap());

  factory EndpointConfig.fromJson(String source) =>
      EndpointConfig.fromMap(json.decode(source));
}
