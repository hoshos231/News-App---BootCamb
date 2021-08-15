import 'package:flutter/material.dart';
import 'package:flutter_day_3/models/dataModel.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key key, this.aritcles}) : super(key: key);
  final List aritcles;

  @override
  Widget build(BuildContext context) {
    print(aritcles);
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: aritcles.length + 1,
          itemBuilder: (context, index) {
            Artical aritcal;
            if (index != 0) aritcal = aritcles[index - 1];
            return (index == 0)
                ? SizedBox(height: 5)
                : InkWell(
                    onDoubleTap: () async => await aritcal.getSite(),
                    child: Container(
                      height: 300,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: (aritcal.image != null)
                                    ? NetworkImage(aritcal.image)
                                    : AssetImage('images/flutterLogo.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 15,
                              right: 15,
                            ),
                            child: Text(
                              "Description: ${aritcal.description}",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
