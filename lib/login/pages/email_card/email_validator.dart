import 'dart:async';

class EmailValidator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (!email.contains("@")) {
      sink.addError("Insira um email valido.");
    } else {
      sink.add(email);
    }
  });


  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    password.isEmpty || password == null
        ? sink.addError("A senha não pode ser vazia.")
        : sink.add(password);
  });
}
