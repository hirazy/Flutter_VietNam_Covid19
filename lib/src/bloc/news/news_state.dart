import 'package:equatable/equatable.dart';

class NewsState extends Equatable{
  const NewsState();

  @override
  List<Object?> get props => [];

}

class LoadingState extends NewsState{
}

class LoadingSuccessState extends NewsState{
  const LoadingSuccessState();
}