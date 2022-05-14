import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_state.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_event.dart';
import 'package:flutter_vietnam_covid19/src/constant/theme.dart';

import '../../widget/news/item_news.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = "/news";

  @override
  NewsPageState createState() {
    return NewsPageState();
  }
}

class NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) =>
      NewsBloc()
        ..add(LoadEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<NewsBloc>(context);

          if (state is LoadingState) {
            print("Size " + bloc.lstNews.length.toString());
          }

          Widget title() {
            return Container(
              color: ThemePrimary.primaryColor,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.all(8),
              child: Text(
                "Tin tức covid 19 tại Việt Nam",
                style: Theme
                    .of(context)
                    .textTheme
                    .headline6!
                    .copyWith(
                  color: Colors.white,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }

          Widget _carouseSlider() {
            Widget _carouseSliderItem(int index) {
              Widget _carouseSliderItemTitle(int itemIndex) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.8),
                    padding: const EdgeInsets.fromLTRB(8, 8, 32, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bloc.lstNews[index].title,
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(bloc.lstNews[index].pubDate,
                            style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.white70,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                );
              }

              Widget _carouseSliderItemImage(int itemIndex) {
                return CachedNetworkImage(
                    imageUrl: bloc.lstNews[itemIndex].image,
                    fit: BoxFit.cover,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)));
              }

              return Container(
                padding: const EdgeInsets.only(bottom: 2),
                child: Container(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3)
                        )
                      ]
                  ),
                  child: InkWell(
                    onTap: () {
                      bloc.add(OnTapItemEvent(context: context,
                          newsModel: bloc.lstNews[index]));
                    },
                    child: SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.4,
                      child: Stack(
                        children: [
                          _carouseSliderItemImage(index),
                          _carouseSliderItemTitle(index),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            return SizedBox(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(
                        microseconds: 1000),
                    autoPlayInterval: const Duration(microseconds: 4000),
                    autoPlayCurve: Curves.easeInOut,
                    viewportFraction: 1.0
                ),
                itemCount: bloc.lstNews.length,
                itemBuilder: (context, itemIndex, pageViewIndex) =>
                    _carouseSliderItem(itemIndex),
              ),
            );
          }

          // return Container(
          //   child: _loadingWidget(),
          // );
          return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  title(),
                  Expanded(
                    child: state is LoadingState
                        ? _loadingWidget()
                        : RefreshIndicator(
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                _carouseSlider(),
                                ...bloc.lstNews.map((item) {
                                  int _index = bloc.lstNews.indexOf(item);
                                  return _index < 5
                                      ? SizedBox()
                                      : ItemNews(
                                      onClickItem: () {
                                        bloc.add(OnTapItemEvent(
                                            context: context,
                                            newsModel: item));
                                      },
                                      news: item);
                                }).toList()
                              ],
                            ),
                          ),
                        ),
                        onRefresh: () async {
                          bloc.add(RefreshEvent());
                        }),
                  )
                ],
              ));
        },
      ),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: SizedBox(
        width: 25,
        height: 25,
        child: SpinKitFadingCircle(
          color: ThemePrimary.primaryColor,
          size: 24,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
