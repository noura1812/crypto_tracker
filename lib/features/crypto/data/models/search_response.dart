
class SearchResponse {
  List<Coins>? coins;
  List<Exchanges>? exchanges;
  List<dynamic>? icos;
  List<Categories>? categories;
  List<Nfts>? nfts;

  SearchResponse({this.coins, this.exchanges, this.icos, this.categories, this.nfts});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    if(json["coins"] is List) {
      coins = json["coins"] == null ? null : (json["coins"] as List).map((e) => Coins.fromJson(e)).toList();
    }
    if(json["exchanges"] is List) {
      exchanges = json["exchanges"] == null ? null : (json["exchanges"] as List).map((e) => Exchanges.fromJson(e)).toList();
    }
    if(json["icos"] is List) {
      icos = json["icos"] ?? [];
    }
    if(json["categories"] is List) {
      categories = json["categories"] == null ? null : (json["categories"] as List).map((e) => Categories.fromJson(e)).toList();
    }
    if(json["nfts"] is List) {
      nfts = json["nfts"] == null ? null : (json["nfts"] as List).map((e) => Nfts.fromJson(e)).toList();
    }
  }

  static List<SearchResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(SearchResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(coins != null) {
      _data["coins"] = coins?.map((e) => e.toJson()).toList();
    }
    if(exchanges != null) {
      _data["exchanges"] = exchanges?.map((e) => e.toJson()).toList();
    }
    if(icos != null) {
      _data["icos"] = icos;
    }
    if(categories != null) {
      _data["categories"] = categories?.map((e) => e.toJson()).toList();
    }
    if(nfts != null) {
      _data["nfts"] = nfts?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Nfts {
  String? id;
  String? name;
  String? symbol;
  String? thumb;

  Nfts({this.id, this.name, this.symbol, this.thumb});

  Nfts.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if(json["thumb"] is String) {
      thumb = json["thumb"];
    }
  }

  static List<Nfts> fromList(List<Map<String, dynamic>> list) {
    return list.map(Nfts.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["symbol"] = symbol;
    _data["thumb"] = thumb;
    return _data;
  }
}

class Categories {
  String? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  static List<Categories> fromList(List<Map<String, dynamic>> list) {
    return list.map(Categories.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    return _data;
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
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["market_type"] is String) {
      marketType = json["market_type"];
    }
    if(json["thumb"] is String) {
      thumb = json["thumb"];
    }
    if(json["large"] is String) {
      large = json["large"];
    }
  }

  static List<Exchanges> fromList(List<Map<String, dynamic>> list) {
    return list.map(Exchanges.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["market_type"] = marketType;
    _data["thumb"] = thumb;
    _data["large"] = large;
    return _data;
  }
}

class Coins {
  String? id;
  String? name;
  String? apiSymbol;
  String? symbol;
  int? marketCapRank;
  String? thumb;
  String? large;

  Coins({this.id, this.name, this.apiSymbol, this.symbol, this.marketCapRank, this.thumb, this.large});

  Coins.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["api_symbol"] is String) {
      apiSymbol = json["api_symbol"];
    }
    if(json["symbol"] is String) {
      symbol = json["symbol"];
    }
    if(json["market_cap_rank"] is int) {
      marketCapRank = json["market_cap_rank"];
    }
    if(json["thumb"] is String) {
      thumb = json["thumb"];
    }
    if(json["large"] is String) {
      large = json["large"];
    }
  }

  static List<Coins> fromList(List<Map<String, dynamic>> list) {
    return list.map(Coins.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["api_symbol"] = apiSymbol;
    _data["symbol"] = symbol;
    _data["market_cap_rank"] = marketCapRank;
    _data["thumb"] = thumb;
    _data["large"] = large;
    return _data;
  }
}