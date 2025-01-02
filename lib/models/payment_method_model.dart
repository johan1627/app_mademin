import 'package:app_mademin/models/channel_code_model.dart';

class PaymentMethodmo {
  String? paymentMethod;
  List<dynamic>? channelCode;

  PaymentMethodmo({
    this.paymentMethod,
    this.channelCode,
  });

  PaymentMethodmo.fromJson(Map<String, dynamic> json) {
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
