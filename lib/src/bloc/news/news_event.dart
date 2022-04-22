import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_vietnam_covid19/src/data/model/news_model.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();
}

class LoadEvent extends NewsEvent{

  const LoadEvent();

  @override
  List<Object?> get props => [];
}

class RefreshEvent extends NewsEvent{
  const RefreshEvent();

  @override
  List<Object?> get props => [];
}

class OnTapItemEvent extends NewsEvent{
  final BuildContext context;
  final NewsModel newsModel;

  OnTapItemEvent({
    required this.context,
    required this.newsModel
  });

  @override
  List<Object?> get props => [];

}