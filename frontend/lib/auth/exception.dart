class UserCancelledException implements Exception {
  final String message;

  const UserCancelledException([this.message = ""]);

  @override
  String toString() => "UserCancelledAuthenticationException: $message";
}