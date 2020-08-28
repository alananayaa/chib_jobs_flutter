class Worker {
  String fullName;
  int phoneNumber;
  String profession;
  String jobDescription;
  int priceRate;

  Worker(String fullName, int phoneNumber, String profession,
      String jobDescription, int priceRate) {
    this.fullName = fullName;
    this.phoneNumber = phoneNumber;
    this.profession = profession;
    this.jobDescription = jobDescription;
    this.priceRate = priceRate;
  }

  Worker.fromJson(Map json)
      : fullName = json['firstName'] + json[' lastName'],
        phoneNumber = json['phoneNumber'],
        profession = json['profession'],
        jobDescription = json['jobDescription'],
        priceRate = json['priceRate'];

  Map toJson() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'profession': profession,
      'jobDescription': jobDescription,
      'priceRate': priceRate
    };
  }

  Worker.validateRegistry() {
    
  }
  // static final getData = [
  //   {
  //     'fullName': 'Alan Anaya Araujo',
  //     'phoneNumber': 3323853669,
  //     'profession': 'Software Developer',
  //     'jobDescription': 'Hacer paginas web',
  //     'priceRate': 500
  //   },
  //   {
  //     'fullName': 'Abel Anaya',
  //     'phoneNumber': 3358231450,
  //     'profession': 'Tio cositas',
  //     'jobDescription': 'Puedo hacer cualquier cosa que te pase por la mente',
  //     'priceRate': 1500
  //   },
  //   {
  //     'fullName': 'Luis Genaro Lopez Garcia',
  //     'phoneNumber': 5512302510,
  //     'profession': 'Financiero',
  //     'jobDescription': 'te pongo al orden tus finanzas',
  //     'priceRate': 680
  //   },
  //   {
  //     'fullName': 'Alexis Garcia',
  //     'phoneNumber': 6672351021,
  //     'profession': 'Contador',
  //     'jobDescription': 'te arreglo tus problemas con impuestos',
  //     'priceRate': 750
  //   },
  //   {
  //     'fullName': 'Andrea Bosques',
  //     'phoneNumber': 6580012314,
  //     'profession': 'Administradora',
  //     'jobDescription': 'administro tu trabajo',
  //     'priceRate': 450
  //   }
  // ];
}
