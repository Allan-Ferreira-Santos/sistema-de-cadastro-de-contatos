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

  nomeValidator(nome) {
    if (nome == null || nome.isEmpty || nome.length < 4) {
      return 'nome inválido';
    }
    return null;
  }

  phoneValidator(phone) {
    if (phone == null || phone.isEmpty || phone.length < 14) {
      return 'Telefone inválido';
    }
    return null;
  }

  cepValidator(cep) {
    if (cep == null || cep.isEmpty || cep.length < 8) {
      return 'cep inválido';
    }
    return null;
  }

  districtValidator(district) {
    if (district == null || district.isEmpty) {
      return 'bairro inválido';
    }
    return null;
  }

  addressValidator(address) {
    if (address == null || address.isEmpty) {
      return 'Endereço inválido';
    }
    return null;
  }

  numberValidator(number) {
    if (number == null || number.isEmpty) {
      return 'Numero inválido';
    }
    return null;
  }

  cityValidator(city) {
    if (city == null || city.isEmpty) {
      return 'Cidade inválido';
    }
    return null;
  }

  ufValidator(uf) {
    if (uf == null || uf.isEmpty) {
      return 'uf inválido';
    }
    return null;
  }
}
