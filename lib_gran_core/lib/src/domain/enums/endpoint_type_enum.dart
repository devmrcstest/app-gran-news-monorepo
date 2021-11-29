import 'package:flutter/foundation.dart';

/// - (0) [production] : Produção
/// - (1) [development] : Desenvolvimento
/// - (2) [qa] : Homologação
/// - (3) [custom] : Customizado
enum EndpointType {
  production,
  development,
  qa,
  custom,
}

extension EndpointTypeExtension on EndpointType {
  String toShortString() {
    return describeEnum(this);
  }

  bool get isQA => this == EndpointType.qa;
  bool get isDevelopment => this == EndpointType.development;
  bool get isProduction => this == EndpointType.production;
  bool get isCustom => this == EndpointType.custom;
}
