class TokensLogo {
  int? chainId;
  String? asset;
  String? type;
  String? address;
  String? name;
  String? symbol;
  int? decimals;
  String? logoURI;
  List<Pairs>? pairs;

  TokensLogo(
      {this.chainId,
      this.asset,
      this.type,
      this.address,
      this.name,
      this.symbol,
      this.decimals,
      this.logoURI,
      this.pairs});

  TokensLogo.fromJson(Map<String, dynamic> json) {
    chainId = json['chainId'];
    asset = json['asset'];
    type = json['type'];
    address = json['address'];
    name = json['name'];
    symbol = json['symbol'];
    decimals = json['decimals'];
    logoURI = json['logoURI'];
    if (json['pairs'] != null) {
      pairs = <Pairs>[];
      json['pairs'].forEach((v) {
        pairs!.add(Pairs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chainId'] = chainId;
    data['asset'] = asset;
    data['type'] = type;
    data['address'] = address;
    data['name'] = name;
    data['symbol'] = symbol;
    data['decimals'] = decimals;
    data['logoURI'] = logoURI;
    if (pairs != null) {
      data['pairs'] = pairs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pairs {
  String? base;

  Pairs({this.base});

  Pairs.fromJson(Map<String, dynamic> json) {
    base = json['base'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    return data;
  }
}

class Version {
  int? major;
  int? minor;
  int? patch;

  Version({this.major, this.minor, this.patch});

  Version.fromJson(Map<String, dynamic> json) {
    major = json['major'];
    minor = json['minor'];
    patch = json['patch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['major'] = major;
    data['minor'] = minor;
    data['patch'] = patch;
    return data;
  }
}
