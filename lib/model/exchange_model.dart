class ExchangeModel {
  String? name;
  int? yearEstablished;
  //Null? country;
  String? description;
  String? url;
  String? image;
  String? facebookUrl;
  String? redditUrl;
  String? telegramUrl;
  String? slackUrl;
  String? otherUrl1;
  String? otherUrl2;
  String? twitterHandle;
  bool? hasTradingIncentive;
  bool? centralized;
  String? publicNotice;
  String? alertNotice;
  int? trustScore;
  int? trustScoreRank;
  double? tradeVolume24hBtc;
  double? tradeVolume24hBtcNormalized;
  //List<Tickers>? tickers;
  //List<Null>? statusUpdates;

  ExchangeModel({
    this.name,
    this.yearEstablished,
    //this.country,
    this.description,
    this.url,
    this.image,
    this.facebookUrl,
    this.redditUrl,
    this.telegramUrl,
    this.slackUrl,
    this.otherUrl1,
    this.otherUrl2,
    this.twitterHandle,
    this.hasTradingIncentive,
    this.centralized,
    this.publicNotice,
    this.alertNotice,
    this.trustScore,
    this.trustScoreRank,
    this.tradeVolume24hBtc,
    this.tradeVolume24hBtcNormalized,
    //this.tickers,
    //this.statusUpdates
  });

  ExchangeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    yearEstablished = json['year_established'];
    //country = json['country'];
    description = json['description'];
    url = json['url'];
    image = json['image'];
    facebookUrl = json['facebook_url'];
    redditUrl = json['reddit_url'];
    telegramUrl = json['telegram_url'];
    slackUrl = json['slack_url'];
    otherUrl1 = json['other_url_1'];
    otherUrl2 = json['other_url_2'];
    twitterHandle = json['twitter_handle'];
    hasTradingIncentive = json['has_trading_incentive'];
    centralized = json['centralized'];
    publicNotice = json['public_notice'];
    alertNotice = json['alert_notice'];
    trustScore = json['trust_score'];
    trustScoreRank = json['trust_score_rank'];
    tradeVolume24hBtc = json['trade_volume_24h_btc'];
    tradeVolume24hBtcNormalized = json['trade_volume_24h_btc_normalized'];
    // if (json['tickers'] != null) {
    //   tickers = <Tickers>[];
    //   json['tickers'].forEach((v) {
    //     tickers!.add(Tickers.fromJson(v));
    //   });
    // }
    // if (json['status_updates'] != null) {
    //   statusUpdates = <Null>[];
    //   json['status_updates'].forEach((v) {
    //     statusUpdates!.add(Null.fromJson(v));
    //   });
  }
}

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = new Map<String, dynamic>();
//   data['name'] = name;
//   data['year_established'] = yearEstablished;
//   data['country'] = country;
//   data['description'] = description;
//   data['url'] = url;
//   data['image'] = image;
//   data['facebook_url'] = facebookUrl;
//   data['reddit_url'] = redditUrl;
//   data['telegram_url'] = telegramUrl;
//   data['slack_url'] = slackUrl;
//   data['other_url_1'] = otherUrl1;
//   data['other_url_2'] = otherUrl2;
//   data['twitter_handle'] = twitterHandle;
//   data['has_trading_incentive'] = hasTradingIncentive;
//   data['centralized'] = centralized;
//   data['public_notice'] = publicNotice;
//   data['alert_notice'] = alertNotice;
//   data['trust_score'] = trustScore;
//   data['trust_score_rank'] = trustScoreRank;
//   data['trade_volume_24h_btc'] = tradeVolume24hBtc;
//   data['trade_volume_24h_btc_normalized'] = tradeVolume24hBtcNormalized;
//   if (tickers != null) {
//     data['tickers'] = tickers!.map((v) => v.toJson()).toList();
//   }
//   if (statusUpdates != null) {
//     data['status_updates'] =
//         statusUpdates!.map((v) => v.toJson()).toList();
//   }
//   return data;
// }

class Tickers {
  String? base;
  String? target;
  Market? market;
  double? last;
  double? volume;
  ConvertedLast? convertedLast;
  ConvertedLast? convertedVolume;
  String? trustScore;
  double? bidAskSpreadPercentage;
  String? timestamp;
  String? lastTradedAt;
  String? lastFetchAt;
  bool? isAnomaly;
  bool? isStale;
  String? tradeUrl;
  String? tokenInfoUrl;
  String? coinId;
  String? targetCoinId;

  Tickers(
      {this.base,
      this.target,
      this.market,
      this.last,
      this.volume,
      this.convertedLast,
      this.convertedVolume,
      this.trustScore,
      this.bidAskSpreadPercentage,
      this.timestamp,
      this.lastTradedAt,
      this.lastFetchAt,
      this.isAnomaly,
      this.isStale,
      this.tradeUrl,
      this.tokenInfoUrl,
      this.coinId,
      this.targetCoinId});

  Tickers.fromJson(Map<String, dynamic> json) {
    base = json['base'];
    target = json['target'];
    market = json['market'] != null ? Market.fromJson(json['market']) : null;
    last = json['last'];
    volume = json['volume'];
    convertedLast = json['converted_last'] != null
        ? ConvertedLast.fromJson(json['converted_last'])
        : null;
    convertedVolume = json['converted_volume'] != null
        ? ConvertedLast.fromJson(json['converted_volume'])
        : null;
    trustScore = json['trust_score'];
    bidAskSpreadPercentage = json['bid_ask_spread_percentage'];
    timestamp = json['timestamp'];
    lastTradedAt = json['last_traded_at'];
    lastFetchAt = json['last_fetch_at'];
    isAnomaly = json['is_anomaly'];
    isStale = json['is_stale'];
    tradeUrl = json['trade_url'];
    tokenInfoUrl = json['token_info_url'];
    coinId = json['coin_id'];
    targetCoinId = json['target_coin_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base'] = base;
    data['target'] = target;
    if (market != null) {
      data['market'] = market!.toJson();
    }
    data['last'] = last;
    data['volume'] = volume;
    if (convertedLast != null) {
      data['converted_last'] = convertedLast!.toJson();
    }
    if (convertedVolume != null) {
      data['converted_volume'] = convertedVolume!.toJson();
    }
    data['trust_score'] = trustScore;
    data['bid_ask_spread_percentage'] = bidAskSpreadPercentage;
    data['timestamp'] = timestamp;
    data['last_traded_at'] = lastTradedAt;
    data['last_fetch_at'] = lastFetchAt;
    data['is_anomaly'] = isAnomaly;
    data['is_stale'] = isStale;
    data['trade_url'] = tradeUrl;
    data['token_info_url'] = tokenInfoUrl;
    data['coin_id'] = coinId;
    data['target_coin_id'] = targetCoinId;
    return data;
  }
}

class Market {
  String? name;
  String? identifier;
  bool? hasTradingIncentive;

  Market({this.name, this.identifier, this.hasTradingIncentive});

  Market.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    identifier = json['identifier'];
    hasTradingIncentive = json['has_trading_incentive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['identifier'] = identifier;
    data['has_trading_incentive'] = hasTradingIncentive;
    return data;
  }
}

class ConvertedLast {
  double? btc;
  double? eth;
  double? usd;

  ConvertedLast({this.btc, this.eth, this.usd});

  ConvertedLast.fromJson(Map<String, dynamic> json) {
    btc = json['btc'];
    eth = json['eth'];
    usd = json['usd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['btc'] = btc;
    data['eth'] = eth;
    data['usd'] = usd;
    return data;
  }
}
