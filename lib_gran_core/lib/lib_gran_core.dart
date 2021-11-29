library lib_gran_core;

export 'package:dartz/dartz.dart' show Either, Left, Right;
export 'package:dio/dio.dart';
export 'package:equatable/equatable.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:firebase_storage/firebase_storage.dart';
export 'package:flutter_mobx/flutter_mobx.dart';
export 'package:flutter_modular/flutter_modular.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:logging/logging.dart';
export 'package:mobx/mobx.dart' hide version, Interceptors, Interceptor, Action;
export 'package:shared_preferences/shared_preferences.dart';

/// [ENTITIES]
export 'src/domain/entities/endpoint_config.dart';

/// [ENUMS]
export 'src/domain/enums/endpoint_type_enum.dart';

/// [ERROR]
export 'src/error/exceptions.dart';
export 'src/error/failures.dart';

/// [MODULES]
export 'src/gran_core_module.dart';

/// [NETWORK]
export 'src/network/dio_config.dart';
export 'src/network/network_info.dart';

/// [USECASES]
export 'src/usecases/usecase.dart';

/// [UTILS]
export 'src/utils/debouncer_util.dart';
