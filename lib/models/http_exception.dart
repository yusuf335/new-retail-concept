class HttpExaption implements Exception {
  final String message;

  HttpExaption(this.message);

  @override
    String toString() {
      return message;
    }
}

