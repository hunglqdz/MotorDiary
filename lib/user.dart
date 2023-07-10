class User {
  final String name;
  final String vehicle;

  User(this.name, this.vehicle);

  Map<String, dynamic> toJson() => {
        'name': name,
        'vehicle': vehicle,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['vehicle']);
  }
}
