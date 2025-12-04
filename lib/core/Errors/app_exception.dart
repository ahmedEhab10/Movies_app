abstract class AppException {
  final String message;

  const AppException({required this.message});
}

class RemoteAppException extends AppException {
  const RemoteAppException({required super.message});
}

class LocalAppException extends AppException {
  const LocalAppException({required super.message});
}
