class Marijuana {
  String name;
  int id;
  String race;
  List<String> flavors;
  List<String> positive;
  List<String> negative;
  List<String> medical;

  Marijuana({
    this.name,
    this.id,
    this.race,
    this.flavors,
    this.positive,
    this.negative,
    this.medical,
  });

  Marijuana.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    race = json['race'];
    flavors = json['flavors'].cast<String>();
    positive = json['effects']['positive'].cast<String>();
    negative = json['effects']['negative'].cast<String>();
    medical = json['effects']['medical'].cast<String>();
  }
}
