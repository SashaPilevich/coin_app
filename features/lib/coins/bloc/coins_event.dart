part of 'coins_bloc.dart';

abstract class CoinsEvent extends Equatable {
  @override
  List<Object?> get props => <Object?>[];
}

class LoadCoinsEvent extends CoinsEvent {}

class DownloadCoinsEvent extends CoinsEvent {}
