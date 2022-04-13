import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_event.dart';
import 'package:flutter_vietnam_covid19/src/bloc/news/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  NewsBloc(NewsState initialState) : super(initialState);

  // NewsBloc(): super(NewsState){
  //   on<LoadEvent>(onLoadData);
  //
  //   on<RefreshEvent>(onRefresh);
  // }

  void onLoadData(LoadEvent event, Emitter<NewsState> emitter){
    emit(LoadingState());


  }

  Future<void> onRefresh() async{
    emit(RefreshState());


  }

}