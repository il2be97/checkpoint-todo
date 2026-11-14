abstract class AppError extends Error {
  String get message;

  @override
  String toString() => message;
}
