class MedicationType {
  int? id;
  String? title;

  MedicationType({
    this.id,
    this.title,
  });

  factory MedicationType.fromJson(Map<String, dynamic> json) => MedicationType(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
