class ProfileModel {
  String? name;
  String? image;
  String? email;
  String? phone;
  ProfileModel({this.name, this.image,this.email,this.phone});
  static ProfileModel fromjson(Map<String, dynamic> json) {
    return ProfileModel(name: json["name"], image: json["image"],
    email: json["email"],
    phone: json["phone"]
    );
  }
}
