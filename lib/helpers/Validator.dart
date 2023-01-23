class Validator {
  /*
  * validate email
  * @author  Allan F Santos
  * @param email - email
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  emailValidator(email) {
    if (email == null || email.isEmpty || email.length < 5) {
      return 'Email inválido';
    } else if (!email.contains('@')) {
      return 'Email esta faltando @';
    } else if (!email.contains('.')) {
      return 'Email esta faltando ponto';
    } else if (email.contains(' ')) {
      return 'Email contem espaço.';
    }
    return null;
  }

  /*
  * validate password
  * @author  Allan F Santos
  * @param password - password
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  passwordValidator(password) {
    if (password == null || password.isEmpty) {
      return 'Senha inválido';
    } else if (password.length < 8) {
      return 'Senha deve conter no minimo 8 caracteres';
    }
    return null;
  }

  /*
  * validate cpf
  * @author  Allan F Santos
  * @param cpf - cpf
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  cpfValidator(cpf) {
    if (cpf == null || cpf.isEmpty) {
      return 'CPF inválido';
    } else if (cpf.length < 14) {
      return 'CPF deve conter 11 caracteres';
    }
    return null;
  }

  /*
  * validate name
  * @author  Allan F Santos
  * @param name - name
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  nomeValidator(nome) {
    if (nome == null || nome.isEmpty || nome.length < 4) {
      return 'nome inválido';
    }
    return null;
  }

  /*
  * validate phone
  * @author  Allan F Santos
  * @param phone - phone
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  phoneValidator(phone) {
    if (phone == null || phone.isEmpty || phone.length < 14) {
      return 'Telefone inválido';
    }
    return null;
  }

  /*
  * validate zip
  * @author  Allan F Santos
  * @param zip - zip
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  cepValidator(cep) {
    if (cep == null || cep.isEmpty || cep.length < 8) {
      return 'cep inválido';
    }
    return null;
  }

  /*
  * validate district
  * @author  Allan F Santos
  * @param district - district
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  districtValidator(district) {
    if (district == null || district.isEmpty) {
      return 'bairro inválido';
    }
    return null;
  }

/*
  * validate address
  * @author  Allan F Santos
  * @param address - address
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  addressValidator(address) {
    if (address == null || address.isEmpty) {
      return 'Endereço inválido';
    }
    return null;
  }

  /*
  * validate number
  * @author  Allan F Santos
  * @param number - number
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  numberValidator(number) {
    if (number == null || number.isEmpty) {
      return 'Numero inválido';
    }
    return null;
  }

/*
  * validate city
  * @author  Allan F Santos
  * @param city - city
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  cityValidator(city) {
    if (city == null || city.isEmpty) {
      return 'Cidade inválido';
    }
    return null;
  }

  /*
  * validate uf
  * @author  Allan F Santos
  * @param uf - uf
  * @version 1.0 - 20230121 - initial release
  * @return  null
  */

  ufValidator(uf) {
    if (uf == null || uf.isEmpty) {
      return 'uf inválido';
    }
    return null;
  }
}
