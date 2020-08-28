class Dollar {
  double dollarPrice;

  Dollar(double dollarPrice) {
    this.dollarPrice = dollarPrice;
  }

  Dollar.fromJson(Map json) : dollarPrice = json['rates']['MXN'];
}
