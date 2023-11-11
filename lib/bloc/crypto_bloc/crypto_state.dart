part of 'crypto_bloc.dart';

@immutable
sealed class CryptoState {}

final class CryptoInitial extends CryptoState {}

final class CryptoLoadingState extends CryptoState {}

final class CryptoSuccessState extends CryptoState {
  final List<CryptoInfoModel>? cryptoList;
  CryptoSuccessState({this.cryptoList});
}

final class CryptoErrorState extends CryptoState {
  final String? error;
  CryptoErrorState({this.error});
}
