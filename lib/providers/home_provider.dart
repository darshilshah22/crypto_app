import 'package:crypto_app/constants/strings.dart';
import 'package:crypto_app/data/models/crypto_model.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  String _heading = Strings.crypto;
  List<CryptoInfoModel>? _cryptoList;
  List<String> _filter = [];

  String get heading => _heading;
  List<String> get filter => _filter;
  List<CryptoInfoModel>? get cryptoList => _cryptoList;

  setHeading(String val) {
    _heading = val;
    notifyListeners();
  }

  setCryptoList(List<CryptoInfoModel> val) {
    _cryptoList = val;
    notifyListeners();
  }

  setFilter(String val) {
    _filter.add(val);
    notifyListeners();
  }

  removeFilter(String val) {
    _filter.remove(val);
    notifyListeners();
  }

  filterCryptoList() {
    if (filter.contains("Price") && filter.contains("volume 24H")) {
      _cryptoList!
          .sort((a, b) => a.quote!.uSD!.price!.compareTo(b.quote!.uSD!.price!));
      _cryptoList!.sort((a, b) =>
          a.quote!.uSD!.volume24h!.compareTo(b.quote!.uSD!.volume24h!));
    } else if (filter.contains("Price")) {
      _cryptoList!
          .sort((a, b) => a.quote!.uSD!.price!.compareTo(b.quote!.uSD!.price!));
      print(_cryptoList!.first.toJson());
    } else if(filter.contains("volume 24H")){
      _cryptoList!.sort((a, b) =>
          a.quote!.uSD!.volume24h!.compareTo(b.quote!.uSD!.volume24h!));
    }else{
      _cryptoList!.sort((a, b) =>
          a.cmcRank!.compareTo(b.cmcRank!));
    }
    notifyListeners();
  }
}
