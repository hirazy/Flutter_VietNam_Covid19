import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_state.dart';
import 'package:flutter_vietnam_covid19/src/page/news_detail/news_detail_page.dart';

import '../../data/model/news_model.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {

  List<NewsModel> lstNews = [];

  NewsBloc() : super(LoadingState()) {
    on<LoadEvent>(onLoadData);

    on<RefreshEvent>(onRefresh);

    on<OnTapItemEvent>(onTapItem);
  }

  void onLoadData(LoadEvent event, Emitter<NewsState> emit) {
    emit(LoadingState());

  }

  Future<void> onRefresh(RefreshEvent event, Emitter<NewsState> emit) async {
    lstNews.clear();
    emit(LoadingState());

  }

  void onTapItem(OnTapItemEvent event, Emitter<NewsState> emitter){
    Navigator.pushNamed(
      event.context,
      NewsDetailPage.routName,
      arguments: event.newsModel
    );
  }
}
