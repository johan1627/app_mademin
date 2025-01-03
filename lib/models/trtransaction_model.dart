import 'package:app_mademin/models/payment_method_model.dart';
import 'package:app_mademin/models/payment_type_model.dart';
import 'package:app_mademin/models/people_model.dart';
import 'package:app_mademin/models/status_model.dart';
import 'package:app_mademin/models/trinvoice_model.dart';

class TrTransactionmo {
  String? uuid;
  TrInvoicemo? invoicemo;
  PaymentTypemo? paymentTypemo;
  PaymentMethodmo? paymentMethodmo;
  String? paymentDeepLink;
  int? ramount;
  Statusmo? statusmo;
  DateTime? paymentAt;
  Peoplemo? createdPeoplemo;
  DateTime? createdAt;
  DateTime? updatedAt;

  TrTransactionmo({
    this.uuid,
    this.invoicemo,
    this.paymentTypemo,
    this.paymentMethodmo,
    this.paymentDeepLink,
    this.ramount,
    this.statusmo,
    this.paymentAt,
    this.createdPeoplemo,
    this.createdAt,
    this.updatedAt,
  });

  TrTransactionmo.fromJson(Map<String, dynamic> json) {
    uuid = json["uuid"];
    invoicemo = TrInvoicemo.fromJson(json["invoice"]);
    paymentTypemo = PaymentTypemo.fromJson(json["payment_type"]);
    paymentMethodmo = PaymentMethodmo.fromJson(json["payment_method"]);
    paymentDeepLink = json["payment_deep_link"];
    ramount = json["ramount"];
    statusmo = Statusmo.fromJson(json["status"]);
    paymentAt = DateTime.parse(json["payment_at"]);
    createdPeoplemo = Peoplemo.fromJson(json["created_people"]);
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'invoicemo': invoicemo!.toJson(),
      'paymentTypemo': paymentTypemo!.toJson(),
      'paymentMethodmo': paymentMethodmo!.toJson(),
      'paymentDeepLink': paymentDeepLink,
      'ramount': ramount,
      'statusmo': statusmo!.toJson(),
      'paymentAt': paymentAt,
      'createdPeoplemo': createdPeoplemo!.toJson(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
