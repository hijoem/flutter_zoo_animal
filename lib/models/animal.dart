import 'dart:convert';

class Animal {
  Animal({
    this.name,
    this.latinName,
    this.animalType,
    this.activeTime,
    this.lengthMin,
    this.lengthMax,
    this.weightMin,
    this.weightMax,
    this.lifespan,
    this.habitat,
    this.diet,
    this.geoRange,
    this.imageLink,
    this.id,
  });

  dynamic name;
  dynamic latinName;
  dynamic animalType;
  dynamic activeTime;
  dynamic lengthMin;
  dynamic lengthMax;
  dynamic weightMin;
  dynamic weightMax;
  dynamic lifespan;
  dynamic habitat;
  dynamic diet;
  dynamic geoRange;
  dynamic imageLink;
  dynamic id;

  factory Animal.fromRawJson(String str) => Animal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Animal.fromJson(Map<String, dynamic> json) => Animal(
        name: json["name"],
        latinName: json["latin_name"],
        animalType: json["animal_type"],
        activeTime: json["active_time"],
        lengthMin: json["length_min"],
        lengthMax: json["length_max"],
        weightMin: json["weight_min"],
        weightMax: json["weight_max"],
        lifespan: json["lifespan"],
        habitat: json["habitat"],
        diet: json["diet"],
        geoRange: json["geo_range"],
        imageLink: json["image_link"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "latin_name": latinName,
        "animal_type": animalType,
        "active_time": activeTime,
        "length_min": lengthMin,
        "length_max": lengthMax,
        "weight_min": weightMin,
        "weight_max": weightMax,
        "lifespan": lifespan,
        "habitat": habitat,
        "diet": diet,
        "geo_range": geoRange,
        "image_link": imageLink,
        "id": id,
      };
}
