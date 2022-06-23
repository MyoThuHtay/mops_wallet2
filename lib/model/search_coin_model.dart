class SearchModel {
  List<Coins>? coins;
  List<Exchanges>? exchanges;
  
  List<Categories>? categories;
  List<Nfts>? nfts;

  SearchModel(
      {this.coins, this.exchanges, this.categories, this.nfts});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['coins'] != null) {
      coins = <Coins>[];
      json['coins'].forEach((v) {
        coins!.add(Coins.fromJson(v));
      });
    }
    if (json['exchanges'] != null) {
      exchanges = <Exchanges>[];
      json['exchanges'].forEach((v) {
        exchanges!.add(Exchanges.fromJson(v));
      });
    }
    
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['nfts'] != null) {
      nfts = <Nfts>[];
      json['nfts'].forEach((v) {
        nfts!.add(Nfts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coins != null) {
      data['coins'] = coins!.map((v) => v.toJson()).toList();
    }
    if (exchanges != null) {
      data['exchanges'] = exchanges!.map((v) => v.toJson()).toList();
    }
    
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (nfts != null) {
      data['nfts'] = nfts!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  //List<SearchModel> asMap() {}
}

class Coins {
  String? id;
  String? name;
  String? symbol;
  int? marketCapRank;
  String? thumb;
  String? large;

  Coins(
      {this.id,
      this.name,
      this.symbol,
      this.marketCapRank,
      this.thumb,
      this.large});

  Coins.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    marketCapRank = json['market_cap_rank'];
    thumb = json['thumb'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['market_cap_rank'] = marketCapRank;
    data['thumb'] = thumb;
    data['large'] = large;
    return data;
  }
}

class Exchanges {
  String? id;
  String? name;
  String? marketType;
  String? thumb;
  String? large;

  Exchanges({this.id, this.name, this.marketType, this.thumb, this.large});

  Exchanges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    marketType = json['market_type'];
    thumb = json['thumb'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['market_type'] = marketType;
    data['thumb'] = thumb;
    data['large'] = large;
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Nfts {
  String? id;
  String? name;
  String? symbol;
  String? thumb;

  Nfts({this.id, this.name, this.symbol, this.thumb});

  Nfts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['thumb'] = thumb;
    return data;
  }
}
