// ignore_for_file: constant_identifier_names

/// [RequestType] is enum class for [NetworkManager] request type.
enum RequestType {
  /// [RequestType.GET] is used to get data from the server.
  GET,

  /// [RequestType.POST] is used to post data to the server.
  POST,

  /// [RequestType.DELETE] is used to delete data from the server.
  DELETE,

  /// [RequestType.PUT] is used to update data on the server.
  PUT,

  /// [RequestType.PATCH] is used to update data on the server.
  PATCH,
}

/// Network request type extension for equality text value.
extension NetworkTypeExtension on RequestType {
  /// [RequestType] convert to string value.
  String get stringValue {
    switch (this) {
      case RequestType.GET:
        return 'GET';
      case RequestType.POST:
        return 'POST';
      case RequestType.DELETE:
        return 'DELETE';
      case RequestType.PUT:
        return 'PUT';
      case RequestType.PATCH:
        return 'PATCH';
    }
  }
}
