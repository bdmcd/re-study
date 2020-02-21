
class UserCancelledException implements Exception {
  final String message;

  const UserCancelledException([this.message = ""]);

  @override
  String toString() => "${this.runtimeType}: $message";
}

class UserAlreadyExistsException implements Exception {
  final String message;

  const UserAlreadyExistsException([this.message = ""]);
  
  @override
  String toString() => "${this.runtimeType}: $message";
}

class InvalidEmailOrPasswordException implements Exception {
    final String message;

    const InvalidEmailOrPasswordException([this.message = ""]);

    @override
    String toString() => "${this.runtimeType}: $message";
}