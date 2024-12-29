class ApiReturnValue<T> {
  final T? value;
  final String message;
  final String? statusCode;

  ApiReturnValue({
    this.value,
    this.message = "",
    this.statusCode,
  });
}
