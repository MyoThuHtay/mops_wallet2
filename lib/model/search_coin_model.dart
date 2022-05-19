import 'dart:convert';


List<SearchCoin> tokenModelFromJson(String str) => List<SearchCoin>.from(json.decode(str).map((x) => CoinsModel.fromJson(x)));

class SearchCoin {
  late List<CoinsModel> _coins;
  // List<Categories>? categories;
  // List<Nfts>? nfts;
  List<CoinsModel> get coins => _coins;

  SearchCoin({
    required coins,
  }) {
    _coins = coins;
  }

  SearchCoin.fromJson(Map<String, dynamic> json) {
    if (json['coins'] != null) {
      _coins = <CoinsModel>[];
      json['coins'].forEach((v) {
        _coins.add(CoinsModel.fromJson(v));
      });
    }
  }
}

class CoinsModel {
  String? id;
  String? name;
  String? symbol;
  //int? marketCapRank;
  String? thumb;
  String? large;

  CoinsModel(
      {this.id,
      this.name,
      this.symbol,
      //this.marketCapRank,
      this.thumb,
      this.large});

  CoinsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    //marketCapRank = json['market_cap_rank'];
    thumb = json['thumb'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    //data['market_cap_rank'] = marketCapRank;
    data['thumb'] = thumb;
    data['large'] = large;
    return data;
  }
}

// class Categories {
//   int? id;
//   String? name;
//
//   Categories({this.id, this.name});
//
//   Categories.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }

// class Nfts {
//   String? id;
//   String? name;
//   String? symbol;
//   String? thumb;
//
//   Nfts({this.id, this.name, this.symbol, this.thumb});
//
//   Nfts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     symbol = json['symbol'];
//     thumb = json['thumb'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = id;
//     data['name'] = name;
//     data['symbol'] = symbol;
//     data['thumb'] = thumb;
//     return data;
//   }
// }
