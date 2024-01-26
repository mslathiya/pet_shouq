class Meta {
  int? currentPage;
  int? perPage;
  dynamic nextPageUrl;
  bool? haveMoreRecords;

  Meta({
    this.currentPage,
    this.perPage,
    this.nextPageUrl,
    this.haveMoreRecords,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        perPage: json["per_page"],
        nextPageUrl: json["next_page_url"],
        haveMoreRecords: json["have_more_records"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "per_page": perPage,
        "next_page_url": nextPageUrl,
        "have_more_records": haveMoreRecords,
      };
}
