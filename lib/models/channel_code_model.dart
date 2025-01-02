class ChannelCodemo {
  int? id;
  String? name;
  String? channelCode;
  String? channelCodeImgPath;
  int? paymentProvider;
  int? paymentType;

  ChannelCodemo({
    this.id,
    this.name,
    this.channelCode,
    this.channelCodeImgPath,
    this.paymentProvider,
    this.paymentType,
  });

  ChannelCodemo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    channelCode = json["channel_code"];
    channelCodeImgPath = json["channel_code_img_path"];
    paymentProvider = json["payment_provider"];
    paymentType = json["payment_type"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'channelCode': channelCode,
      'channelCodeImgPath': channelCodeImgPath,
      'paymentProvider': paymentProvider,
      'paymentType': paymentType,
    };
  }
}
