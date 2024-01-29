class PetItemBean {
  int? petId;
  String? petName;
  String? petProfilePhoto;
  DateTime? petDob;
  String? petBreed;
  String? fullProfileImageUrl;

  PetItemBean({
    this.petId,
    this.petName,
    this.petProfilePhoto,
    this.petDob,
    this.petBreed,
    this.fullProfileImageUrl,
  });

  factory PetItemBean.fromJson(Map<String, dynamic> json) => PetItemBean(
        petId: json["pet_id"],
        petName: json["pet_name"],
        petProfilePhoto: json["pet_profile_photo"],
        petDob:
            json["pet_dob"] == null ? null : DateTime.parse(json["pet_dob"]),
        petBreed: json["pet_breed"],
        fullProfileImageUrl: json["full_profile_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "pet_id": petId,
        "pet_name": petName,
        "pet_profile_photo": petProfilePhoto,
        "pet_dob":
            "${petDob!.year.toString().padLeft(4, '0')}-${petDob!.month.toString().padLeft(2, '0')}-${petDob!.day.toString().padLeft(2, '0')}",
        "pet_breed": petBreed,
        "full_profile_image_url": fullProfileImageUrl,
      };
}
