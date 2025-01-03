import 'package:app_mademin/models/channel_code_model.dart';

class OptionPaymentMethodmo {
  String? paymentMethod;
  List<dynamic>? channelCode;

  OptionPaymentMethodmo({
    this.paymentMethod,
    this.channelCode,
  });

  OptionPaymentMethodmo.fromJson(Map<String, dynamic> json) {
    paymentMethod = json["payment_method"];
    channelCode = json["channel_code"]
        .map((item) => ChannelCodemo.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'paymentMethod': paymentMethod,
      'channelCode': channelCode!.map((item) => item.toJson()).toList(),
    };
  }
}
