import 'dart:ui';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/models/payment_group_model.dart';
import 'package:app_mademin/models/people_model.dart';
import 'package:app_mademin/models/status_model.dart';

class TrInvoicemo {
  String? uuid;
  String? dueAt;
  String? dueStatus;
  String? invNumber;
  PaymentGroupmo? paymentGroupmo;
  int? ramount;
  Statusmo? statusmo;
  Color? statusColor;
  Peoplemo? createdPeople;
  DateTime? paymentAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  TrInvoicemo({
    this.uuid,
    this.dueAt,
    this.dueStatus,
    this.invNumber,
    this.paymentGroupmo,
    this.ramount,
    this.statusmo,
    this.statusColor,
    this.createdPeople,
    this.paymentAt,
    this.createdAt,
    this.updatedAt,
  });

  TrInvoicemo.fromJson(Map<String, dynamic> json) {
    var temp = Statusmo.fromJson(json["status"]);
    var st = temp.id;

    Color statusColorTemp = blackFlat;
    if (st == 0) {
      statusColorTemp = greenColor;
    } else if (st == 1) {
      statusColorTemp = blueColor;
    } else if (st == 4) {
      statusColorTemp = redColor;
    } else {
      statusColorTemp = greenColor;
    }

    uuid = json["uuid"];
    dueAt = json["due_at"];
    dueStatus = json["due_status"];
    invNumber = json["inv_number"];
    paymentGroupmo = PaymentGroupmo.fromJson(json["payment_group"]);
    ramount = json["ramount"];
    statusmo = Statusmo.fromJson(json["status"]);
    statusColor = statusColorTemp;
    createdPeople = Peoplemo.fromJson(json["created_people"]);
    paymentAt = DateTime.parse(json["payment_at"]);
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'dueAt': dueAt,
      'dueStatus': dueStatus,
      'invNumber': invNumber,
      'paymentGroupmo': paymentGroupmo!.toJson(),
      'ramount': ramount,
      'statusmo': statusmo!.toJson(),
      'statusColor': statusColor,
      'createdPeople': createdPeople!.toJson(),
      'paymentAt': paymentAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
