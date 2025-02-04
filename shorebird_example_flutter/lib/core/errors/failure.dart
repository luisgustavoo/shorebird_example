class Failure implements Exception {
  Failure({
    this.message = 'Ocorreu um erro, tente novamente mais tarde.',
  });
  final String? message;
}
