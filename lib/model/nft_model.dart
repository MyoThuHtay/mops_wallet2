class NftModel {
  int? total;
  int? page;
  int? pageSize;
  String? cursor;
  List<Result>? result;
  String? status;

  NftModel(
      {this.total,
      this.page,
      this.pageSize,
      this.cursor,
      this.result,
      this.status});

  NftModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pageSize = json['page_size'];
    cursor = json['cursor'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['page_size'] = pageSize;
    data['cursor'] = cursor;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Result {
  String? tokenAddress;
  String? tokenId;
  String? ownerOf;
  String? blockNumber;
  String? blockNumberMinted;
  String? tokenHash;
  String? amount;
  String? contractType;
  String? name;
  String? symbol;
  String? tokenUri;
  String? metadata;
  String? syncedAt;
  String? lastTokenUriSync;
  String? lastMetadataSync;

  Result(
      {this.tokenAddress,
      this.tokenId,
      this.ownerOf,
      this.blockNumber,
      this.blockNumberMinted,
      this.tokenHash,
      this.amount,
      this.contractType,
      this.name,
      this.symbol,
      this.tokenUri,
      this.metadata,
      this.syncedAt,
      this.lastTokenUriSync,
      this.lastMetadataSync});

  Result.fromJson(Map<String, dynamic> json) {
    tokenAddress = json['token_address'];
    tokenId = json['token_id'];
    ownerOf = json['owner_of'];
    blockNumber = json['block_number'];
    blockNumberMinted = json['block_number_minted'];
    tokenHash = json['token_hash'];
    amount = json['amount'];
    contractType = json['contract_type'];
    name = json['name'];
    symbol = json['symbol'];
    tokenUri = json['token_uri'];
    metadata = json['metadata'];
    syncedAt = json['synced_at'];
    lastTokenUriSync = json['last_token_uri_sync'];
    lastMetadataSync = json['last_metadata_sync'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token_address'] = tokenAddress;
    data['token_id'] = tokenId;
    data['owner_of'] = ownerOf;
    data['block_number'] = blockNumber;
    data['block_number_minted'] = blockNumberMinted;
    data['token_hash'] = tokenHash;
    data['amount'] = amount;
    data['contract_type'] = contractType;
    data['name'] = name;
    data['symbol'] = symbol;
    data['token_uri'] = tokenUri;
    data['metadata'] = metadata;
    data['synced_at'] = syncedAt;
    data['last_token_uri_sync'] = lastTokenUriSync;
    data['last_metadata_sync'] = lastMetadataSync;
    return data;
  }
}
