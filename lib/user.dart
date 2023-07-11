class User {
  String name, vehicle;

  User(this.name, this.vehicle);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        vehicle = json['vehicle'];

  Map<String, dynamic> toJson() => {'name': name, 'vehicle': vehicle};
}
