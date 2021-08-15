import 'package:flutter_day_3/models/dataModel.dart';

class Handler {
  Map data;
  Handler(this.data);
  returnList() {
    List articles = this
        .data['articles']
        .map(
          (aritcle) => Artical(
            aritcle['description'],
            aritcle["author"],
            aritcle["url"],
            aritcle["image"],
          ),
        )
        .toList();

    return articles;
  }
}
