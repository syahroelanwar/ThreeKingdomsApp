class AllHero{
  String name;
  String kingdom;
  String detail;
  String img;

  AllHero(this.name, this.kingdom, this.detail, this.img);

  factory AllHero.fromJson(dynamic json) {
    return AllHero(json['name']as String, json['kingdom'] as String, json['detail'] as String, json['img'] as String);
  }

  @override
  String toString() {
    return '{ ${this.name}, ${this.kingdom}, ${this.detail}, ${this.img} }';
  }
}