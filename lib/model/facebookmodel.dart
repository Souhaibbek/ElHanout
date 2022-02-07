class FacebookModel {
   String? name;
   String? email;
   PictureModel? picture;
   String? id;


  FacebookModel({this.name, this.email, this.picture, this.id});

  FacebookModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    id = json['id'];
    picture = PictureModel.fromJson(json['picture']['data']);
  }
}

class PictureModel {
  int? height;
  String? url;
  int? width;

  PictureModel({this.height, this.width, this.url});

  PictureModel.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    url = json['url'];
    width = json['width'];
  }
}
