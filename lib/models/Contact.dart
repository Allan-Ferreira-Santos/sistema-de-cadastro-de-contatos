class Contact {
  String? email;
  String? name;
  String? phone;
  String? cpf;
  String? zip;
  String? district;
  String? address;
  String? number;
  String? city;
  String? uf;
  String? complement;

  Contact(
      {this.email,
      this.name,
      this.phone,
      this.cpf,
      this.zip,
      this.district,
      this.address,
      this.number,
      this.city,
      this.uf,
      this.complement});

  Contact.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    cpf = json['cpf'];
    zip = json['zip'];
    district = json['district'];
    address = json['address'];
    number = json['number'];
    city = json['city'];
    uf = json['uf'];
    complement = json['complement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['cpf'] = cpf;
    data['zip'] = zip;
    data['district'] = district;
    data['address'] = address;
    data['number'] = number;
    data['city'] = city;
    data['uf'] = uf;
    data['complement'] = complement;
    return data;
  }
}
