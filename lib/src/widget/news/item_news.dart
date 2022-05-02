import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';

class ItemNews extends StatelessWidget {
  NewsModel news;
  Function onClickItem;

  ItemNews({Key? key, required this.news, required this.onClickItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          onClickItem();
        },
        borderRadius: BorderRadius.circular(10),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0.0, 4.0)
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: news.image,
                      fit: BoxFit.fill,
                      // progressIndicatorBuilder: ,
                      errorWidget: (context, url, error) => Container(
                        child: Text(error),
                      ),
                    ),
                  )),
              SizedBox(width: 8,),
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news.title),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(news.pubDate),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
