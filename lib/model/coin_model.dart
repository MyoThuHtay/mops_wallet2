class CoinModel {
  String? id;
  String? symbol;
  String? name;
  String? assetPlatformId;
  Platforms? platforms;
  int? blockTimeInMinutes;
  List<String>? categories;
  Description? description;
  Links? links;
  Image? image;
  String? contractAddress;
  int? marketCapRank;
  int? coingeckoRank;
  double? coingeckoScore;
  double? communityScore;
  double? liquidityScore;
  double? publicInterestScore;
  MarketData? marketData;

  CoinModel({this.id, this.symbol, this.name, this.assetPlatformId, this.platforms, this.blockTimeInMinutes, this.categories, this.description, this.links, this.image, this.contractAddress, this.marketCapRank, this.coingeckoRank, this.coingeckoScore, this.communityScore, this.liquidityScore, this.publicInterestScore, this.marketData});

  CoinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    symbol = json['symbol'] ?? '';
    name = json['name'] ?? '';
    assetPlatformId = json['asset_platform_id'] ?? '';
    platforms = json['platforms'] != null ? Platforms.fromJson(json['platforms']) : null;
    blockTimeInMinutes = json['block_time_in_minutes'] ?? 0;
    categories = json['categories'].cast<String>() ?? '';
    description = json['description'] != null ? Description.fromJson(json['description']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    contractAddress = json['contract_address'] ?? '';
    marketCapRank = json['market_cap_rank'] ?? 0;
    coingeckoRank = json['coingecko_rank'] ?? 0;
    coingeckoScore = json['coingecko_score'] ?? 0;
    communityScore = json['community_score'] ?? 0;
    liquidityScore = json['liquidity_score'] ?? 0;
    publicInterestScore = json['public_interest_score'] ?? 0;
    marketData = json['market_data'] != null ? MarketData.fromJson(json['market_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['asset_platform_id'] = assetPlatformId;
    if (platforms != null) {
      data['platforms'] = platforms!.toJson();
    }
    data['block_time_in_minutes'] = blockTimeInMinutes;
    data['categories'] = categories;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['contract_address'] = contractAddress;
    data['market_cap_rank'] = marketCapRank;
    data['coingecko_rank'] = coingeckoRank;
    data['coingecko_score'] = coingeckoScore;
    data['community_score'] = communityScore;
    data['liquidity_score'] = liquidityScore;
    data['public_interest_score'] = publicInterestScore;
    if (marketData != null) {
      data['market_data'] = marketData!.toJson();
    }
    return data;
  }
}

class Platforms {
  String? binanceSmartChain;

  Platforms({this.binanceSmartChain});

  Platforms.fromJson(Map<String, dynamic> json) {
    binanceSmartChain = json['binance-smart-chain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['binance-smart-chain'] = binanceSmartChain;
    return data;
  }
}

class Description {
  String? en;
  String? de;
  String? es;
  String? fr;
  String? it;
  String? pl;
  String? ro;
  String? hu;
  String? nl;
  String? pt;
  String? sv;
  String? vi;
  String? tr;
  String? ru;
  String? ja;
  String? zh;
  String? zhTw;
  String? ko;
  String? ar;
  String? th;
  String? id;
  String? cs;
  String? da;
  String? el;
  String? hi;
  String? no;
  String? sk;
  String? uk;
  String? he;
  String? fi;
  String? bg;
  String? hr;
  String? lt;
  String? sl;

  Description({this.en, this.de, this.es, this.fr, this.it, this.pl, this.ro, this.hu, this.nl, this.pt, this.sv, this.vi, this.tr, this.ru, this.ja, this.zh, this.zhTw, this.ko, this.ar, this.th, this.id, this.cs, this.da, this.el, this.hi, this.no, this.sk, this.uk, this.he, this.fi, this.bg, this.hr, this.lt, this.sl});

  Description.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    it = json['it'];
    pl = json['pl'];
    ro = json['ro'];
    hu = json['hu'];
    nl = json['nl'];
    pt = json['pt'];
    sv = json['sv'];
    vi = json['vi'];
    tr = json['tr'];
    ru = json['ru'];
    ja = json['ja'];
    zh = json['zh'];
    zhTw = json['zh-tw'];
    ko = json['ko'];
    ar = json['ar'];
    th = json['th'];
    id = json['id'];
    cs = json['cs'];
    da = json['da'];
    el = json['el'];
    hi = json['hi'];
    no = json['no'];
    sk = json['sk'];
    uk = json['uk'];
    he = json['he'];
    fi = json['fi'];
    bg = json['bg'];
    hr = json['hr'];
    lt = json['lt'];
    sl = json['sl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en'] = en;
    data['de'] = de;
    data['es'] = es;
    data['fr'] = fr;
    data['it'] = it;
    data['pl'] = pl;
    data['ro'] = ro;
    data['hu'] = hu;
    data['nl'] = nl;
    data['pt'] = pt;
    data['sv'] = sv;
    data['vi'] = vi;
    data['tr'] = tr;
    data['ru'] = ru;
    data['ja'] = ja;
    data['zh'] = zh;
    data['zh-tw'] = zhTw;
    data['ko'] = ko;
    data['ar'] = ar;
    data['th'] = th;
    data['id'] = id;
    data['cs'] = cs;
    data['da'] = da;
    data['el'] = el;
    data['hi'] = hi;
    data['no'] = no;
    data['sk'] = sk;
    data['uk'] = uk;
    data['he'] = he;
    data['fi'] = fi;
    data['bg'] = bg;
    data['hr'] = hr;
    data['lt'] = lt;
    data['sl'] = sl;
    return data;
  }
}

class Links {
  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  String? twitterScreenName;
  String? facebookUsername;
  String? telegramChannelIdentifier;
  ReposUrl? reposUrl;

  Links({this.homepage, this.blockchainSite, this.officialForumUrl, this.chatUrl, this.announcementUrl, this.twitterScreenName, this.facebookUsername, this.telegramChannelIdentifier, this.reposUrl});

  Links.fromJson(Map<String, dynamic> json) {
    homepage = json['homepage'].cast<String>();
    blockchainSite = json['blockchain_site'].cast<String>();
    officialForumUrl = json['official_forum_url'].cast<String>();
    chatUrl = json['chat_url'].cast<String>();
    announcementUrl = json['announcement_url'].cast<String>();
    twitterScreenName = json['twitter_screen_name'];
    facebookUsername = json['facebook_username'];
    telegramChannelIdentifier = json['telegram_channel_identifier'];
    reposUrl = json['repos_url'] != null ? ReposUrl.fromJson(json['repos_url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homepage'] = homepage;
    data['blockchain_site'] = blockchainSite;
    data['official_forum_url'] = officialForumUrl;
    data['chat_url'] = chatUrl;
    data['announcement_url'] = announcementUrl;
    data['twitter_screen_name'] = twitterScreenName;
    data['facebook_username'] = facebookUsername;
    data['telegram_channel_identifier'] = telegramChannelIdentifier;
    if (reposUrl != null) {
      data['repos_url'] = reposUrl!.toJson();
    }
    return data;
  }
}

class ReposUrl {
  List<String>? github;

  ReposUrl({this.github});

  ReposUrl.fromJson(Map<String, dynamic> json) {
    github = json['github'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['github'] = github;
    return data;
  }
}

class Image {
  String? thumb;
  String? small;
  String? large;

  Image({this.thumb, this.small, this.large});

  Image.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    small = json['small'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}

class MarketData {
  CurrentPrice? currentPrice;
  double? priceChangePercentage24h;
  double? totalSupply;
  double? circulatingSupply;
  String? lastUpdated;

  MarketData({this.currentPrice, this.priceChangePercentage24h, this.totalSupply, this.circulatingSupply, this.lastUpdated});

  MarketData.fromJson(Map<String, dynamic> json) {
    currentPrice = json['current_price'] != null ? CurrentPrice.fromJson(json['current_price']) : null;
    priceChangePercentage24h = json['price_change_percentage_24h'];
    totalSupply = json['total_supply'];
    circulatingSupply = json['circulating_supply'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (currentPrice != null) {
      data['current_price'] = currentPrice!.toJson();
    }
    data['price_change_percentage_24h'] = priceChangePercentage24h;
    data['total_supply'] = totalSupply;
    data['circulating_supply'] = circulatingSupply;
    data['last_updated'] = lastUpdated;
    return data;
  }
}

class CurrentPrice {
  double? aed;
  double? ars;
  double? aud;
  double? bch;
  double? bdt;
  double? bhd;
  double? bmd;
  double? bnb;
  double? brl;
  double? btc;
  double? cad;
  double? chf;
  double? clp;
  double? cny;
  double? czk;
  double? dkk;
  double? dot;
  double? eos;
  double? eth;
  double? eur;
  double? gbp;
  double? hkd;
  double? huf;
  double? idr;
  double? ils;
  double? inr;
  double? jpy;
  double? krw;
  double? kwd;
  double? lkr;
  double? ltc;
  double? mmk;
  double? mxn;
  double? myr;
  double? ngn;
  double? nok;
  double? nzd;
  double? php;
  double? pkr;
  double? pln;
  double? rub;
  double? sar;
  double? sek;
  double? sgd;
  double? thb;
  //double? try;
  double? twd;
  double? uah;
  double? usd;
  double? vef;
  double? vnd;
  double? xag;
  double? xau;
  double? xdr;
  double? xlm;
  double? xrp;
  double? yfi;
  double? zar;
  double? bits;
  double? link;
  double? sats;

  CurrentPrice({this.aed, this.ars, this.aud, this.bch, this.bdt, this.bhd, this.bmd, this.bnb, this.brl, this.btc, this.cad, this.chf, this.clp, this.cny, this.czk, this.dkk, this.dot, this.eos, this.eth, this.eur, this.gbp, this.hkd, this.huf, this.idr, this.ils, this.inr, this.jpy, this.krw, this.kwd, this.lkr, this.ltc, this.mmk, this.mxn, this.myr, this.ngn, this.nok, this.nzd, this.php, this.pkr, this.pln, this.rub, this.sar, this.sek, this.sgd, this.thb,this.twd, this.uah, this.usd, this.vef, this.vnd, this.xag, this.xau, this.xdr, this.xlm, this.xrp, this.yfi, this.zar, this.bits, this.link, this.sats});

CurrentPrice.fromJson(Map<String, dynamic> json) {
aed = json['aed'];
ars = json['ars'];
aud = json['aud'];
bch = json['bch'];
bdt = json['bdt'];
bhd = json['bhd'];
bmd = json['bmd'];
bnb = json['bnb'];
brl = json['brl'];
btc = json['btc'];
cad = json['cad'];
chf = json['chf'];
clp = json['clp'];
cny = json['cny'];
czk = json['czk'];
dkk = json['dkk'];
dot = json['dot'];
eos = json['eos'];
eth = json['eth'];
eur = json['eur'];
gbp = json['gbp'];
hkd = json['hkd'];
huf = json['huf'];
idr = json['idr'];
ils = json['ils'];
inr = json['inr'];
jpy = json['jpy'];
krw = json['krw'];
kwd = json['kwd'];
lkr = json['lkr'];
ltc = json['ltc'];
mmk = json['mmk'];
mxn = json['mxn'];
myr = json['myr'];
ngn = json['ngn'];
nok = json['nok'];
nzd = json['nzd'];
php = json['php'];
pkr = json['pkr'];
pln = json['pln'];
rub = json['rub'];
sar = json['sar'];
sek = json['sek'];
sgd = json['sgd'];
thb = json['thb'];

twd = json['twd'];
uah = json['uah'];
usd = json['usd'];
vef = json['vef'];
vnd = json['vnd'];
xag = json['xag'];
xau = json['xau'];
xdr = json['xdr'];
xlm = json['xlm'];
xrp = json['xrp'];
yfi = json['yfi'];
zar = json['zar'];
bits = json['bits'];
link = json['link'];
sats = json['sats'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['aed'] = aed;
  data['ars'] = ars;
  data['aud'] = aud;
  data['bch'] = bch;
  data['bdt'] = bdt;
  data['bhd'] = bhd;
  data['bmd'] = bmd;
  data['bnb'] = bnb;
  data['brl'] = brl;
  data['btc'] = btc;
  data['cad'] = cad;
  data['chf'] = chf;
  data['clp'] = clp;
  data['cny'] = cny;
  data['czk'] = czk;
  data['dkk'] = dkk;
  data['dot'] = dot;
  data['eos'] = eos;
  data['eth'] = eth;
  data['eur'] = eur;
  data['gbp'] = gbp;
  data['hkd'] = hkd;
  data['huf'] = huf;
  data['idr'] = idr;
  data['ils'] = ils;
  data['inr'] = inr;
  data['jpy'] = jpy;
  data['krw'] = krw;
  data['kwd'] = kwd;
  data['lkr'] = lkr;
  data['ltc'] = ltc;
  data['mmk'] = mmk;
  data['mxn'] = mxn;
  data['myr'] = myr;
  data['ngn'] = ngn;
  data['nok'] = nok;
  data['nzd'] = nzd;
  data['php'] = php;
  data['pkr'] = pkr;
  data['pln'] = pln;
  data['rub'] = rub;
  data['sar'] = sar;
  data['sek'] = sek;
  data['sgd'] = sgd;
  data['thb'] = thb;
  data['twd'] = twd;
  data['uah'] = uah;
  data['usd'] = usd;
  data['vef'] = vef;
  data['vnd'] = vnd;
  data['xag'] = xag;
  data['xau'] = xau;
  data['xdr'] = xdr;
  data['xlm'] = xlm;
  data['xrp'] = xrp;
  data['yfi'] = yfi;
  data['zar'] = zar;
  data['bits'] = bits;
  data['link'] = link;
  data['sats'] = sats;
  return data;
}
}
