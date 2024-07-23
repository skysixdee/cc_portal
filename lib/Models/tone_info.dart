class ToneInfo {
  String? toneId;
  String? toneName;
  String? artistName;
  String? albumName;
  String? price;
  String? categoryId;
  String? expiryDate;
  String? toneIdStreamingUrl;
  String? toneIdpreviewImageUrl;

  ToneInfo({
    this.toneId,
    this.toneName,
    this.artistName,
    this.albumName,
    this.price,
    this.categoryId,
    this.expiryDate,
    this.toneIdStreamingUrl,
    this.toneIdpreviewImageUrl,
  });

  factory ToneInfo.fromJson(Map<String, dynamic> json) => ToneInfo(
        toneId: json["toneId"],
        toneName: json["toneName"],
        artistName: json["artistName"],
        albumName: json["albumName"],
        price: "${json["price"]}",
        categoryId: "${json["categoryId"]}",
        expiryDate: json["expiryDate"],
        toneIdStreamingUrl: json["toneIdStreamingUrl"],
        toneIdpreviewImageUrl: json["toneIdpreviewImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "toneId": toneId,
        "toneName": toneName,
        "artistName": artistName,
        "albumName": albumName,
        "price": price,
        "categoryId": categoryId,
        "expiryDate": expiryDate,
        "toneIdStreamingUrl": toneIdStreamingUrl,
        "toneIdpreviewImageUrl": toneIdpreviewImageUrl,
      };
}
