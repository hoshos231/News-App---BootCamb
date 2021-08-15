import 'package:url_launcher/url_launcher.dart';

class Artical {
  //==================== Variables
  final String title;
  final String description;
  final String author;
  final String source;
  final String image;
  //==================== End

  Artical(this.description, this.author, this.source, this.image,
      {this.title}) {}

  factory Artical.fromJson(Map map) {
    Artical(map["description"], map["author"], map["source"], map["image"]);
  }
  //============= Functions
  Future<bool> getSite() async => await launch(this.source);
  //============= End
}
