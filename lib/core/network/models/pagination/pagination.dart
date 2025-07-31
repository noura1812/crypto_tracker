class Pagination {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;

  Pagination({this.total, this.perPage, this.currentPage, this.lastPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["per_page"] is int) {
      perPage = json["per_page"];
    }
    if (json["current_page"] is int) {
      currentPage = json["current_page"];
    }
    if (json["last_page"] is int) {
      lastPage = json["last_page"];
    }
  }

  static List<Pagination> fromList(List<Map<String, dynamic>> list) {
    return list.map(Pagination.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total"] = total;
    _data["per_page"] = perPage;
    _data["current_page"] = currentPage;
    _data["last_page"] = lastPage;
    return _data;
  }
}
