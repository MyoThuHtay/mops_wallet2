class CoinModel {
  String? id;
  String? symbol;
  String? name;
  String? assetPlatformId;

  Image? image;

  CoinModel({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.image,
  });

  CoinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    symbol = json['symbol'] ?? '';
    name = json['name'] ?? '';
    assetPlatformId = json['asset_platform_id'] ?? '';
    image = Image.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['symbol'] = symbol;
    data['name'] = name;
    data['asset_platform_id'] = assetPlatformId;
    if (image != null) {
      data['image'] = image!.toJson();
    }

    return data;
  }
}

class Image {
  String? thumb;
  String? small;
  String? large;

  Image({this.thumb, this.small, this.large});

  Image.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'] ?? '';
    small = json['small'] ?? '';
    large = json['large'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumb'] = thumb;
    data['small'] = small;
    data['large'] = large;
    return data;
  }
}
