part of 'crypto_bloc.dart';

@immutable
sealed class CryptoEvent {}

class GetCryptoDetailsEvent extends CryptoEvent {}
