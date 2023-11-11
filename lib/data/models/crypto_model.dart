class CryptoInfoModel {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? numMarketPairs;
  List<String>? tags;
  int? maxSupply;
  int? cmcRank;
  String? lastUpdated;
  Quote? quote;
  String? logo;

  CryptoInfoModel(
      {this.id,
      this.name,
      this.symbol,
      this.slug,
      this.numMarketPairs,
      this.tags,
      this.maxSupply,
      this.cmcRank,
      this.lastUpdated,
      this.quote,
      this.logo});

  CryptoInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    tags = json['tags'].cast<String>();
    maxSupply = json['max_supply'];
    cmcRank = json['cmc_rank'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['num_market_pairs'] = numMarketPairs;
    data['tags'] = tags;
    data['max_supply'] = maxSupply;
    data['cmc_rank'] = cmcRank;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    data['logo'] = logo;
    return data;
  }
}

class Quote {
  USD? uSD;

  Quote({this.uSD});

  Quote.fromJson(Map<String, dynamic> json) {
    uSD = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (uSD != null) {
      data['USD'] = uSD!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? percentChange24h;
  double? volume24h;
  double? marketCap;

  USD({this.price, this.percentChange24h, this.volume24h, this.marketCap});

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    percentChange24h = json['percent_change_24h'];
    volume24h = json['volume_24h'];
    marketCap = json['market_cap'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['percent_change_24h'] = percentChange24h;
    data['volume_24h'] = volume24h;
    data['market_cap'] = marketCap;
    return data;
  }
}
