class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool? success;
  ApiResponse({
    required this.data,
    required this.message,
    required this.success,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse<T>(
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message:
          json['message'] is String
              ? json['message']
              : json['message'] is List<String>
              ? (json['message'] as List<String>).reduce(
                (value, element) => '$value,$element',
              )
              : null,
      success: json['success'] as bool?,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'data': data != null ? toJsonT(data as T) : null,
      'message': message,
    };
  }
}
