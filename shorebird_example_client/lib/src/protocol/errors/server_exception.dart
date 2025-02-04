/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ServerException
    implements _i1.SerializableException, _i1.SerializableModel {
  ServerException._({
    String? message,
    this.errorCode,
  }) : message = message ?? 'Ocorreu um erro no servidor';

  factory ServerException({
    String? message,
    int? errorCode,
  }) = _ServerExceptionImpl;

  factory ServerException.fromJson(Map<String, dynamic> jsonSerialization) {
    return ServerException(
      message: jsonSerialization['message'] as String,
      errorCode: jsonSerialization['errorCode'] as int?,
    );
  }

  String message;

  int? errorCode;

  ServerException copyWith({
    String? message,
    int? errorCode,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      if (errorCode != null) 'errorCode': errorCode,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServerExceptionImpl extends ServerException {
  _ServerExceptionImpl({
    String? message,
    int? errorCode,
  }) : super._(
          message: message,
          errorCode: errorCode,
        );

  @override
  ServerException copyWith({
    String? message,
    Object? errorCode = _Undefined,
  }) {
    return ServerException(
      message: message ?? this.message,
      errorCode: errorCode is int? ? errorCode : this.errorCode,
    );
  }
}
