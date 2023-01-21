import 'dart:developer';

class Validator {
  emailValidator(email) {
    if (email == null || email.isEmpty || email.length < 5) {
      return 'Email inválido';
    } else if (!email.contains('@')) {
      return 'Email esta faltando @';
    } else if (!email.contains('.')) {
      return 'Email esta faltando .';
    } else if (email.contains('')) {
      return 'Email contem espaço.';
    }
    return null;
  }

  passwordValidator(password) {
    if (password == null || password.isEmpty) {
      return 'Senha inválido';
    } else if (password.length < 8) {
      return 'Senha deve conter no minimo 8 caracteres';
    }
    return null;
  }

  cpfValidator(cpf) {
    if (cpf == null || cpf.isEmpty) {
      return 'CPF inválido';
    } else if (cpf.length < 14) {
      return 'CPF deve conter 11 caracteres';
    }
    return null;
  }
}
