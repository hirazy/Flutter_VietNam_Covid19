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
      create: (context) => NewsBloc()..add(LoadEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<NewsBloc>(context);

          if(state is LoadingState){
            print("Size " + bloc.lstNews.length.toString());
          }

          Widget title() {
            return Container(
                child: Container(
                    child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8),
              child: Text(
                "Tin tức covid 19 tại Việt Nam",
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.white,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            )));
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
