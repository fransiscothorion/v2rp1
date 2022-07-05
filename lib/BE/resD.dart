// ignore_for_file: file_names

import 'dart:convert';

ResultData resultDataFromMap(String str) =>
    ResultData.fromMap(json.decode(str));

String resultDataToMap(ResultData data) => json.encode(data.toMap());

class ResultData {
  ResultData({
    required this.trxid,
    required this.datetime,
    required this.reqid,
    required this.id,
    required this.responsecode,
    required this.message,
    required this.serverkey,
    required this.result,
  });

  String trxid;
  String datetime;
  String reqid;
  String id;
  String responsecode;
  String message;
  int serverkey;
  List<Result> result;

  factory ResultData.fromMap(Map<String, dynamic> json) => ResultData(
        trxid: json["trxid"],
        datetime: json["datetime"],
        reqid: json["reqid"],
        id: json["id"],
        responsecode: json["responsecode"],
        message: json["message"],
        serverkey: json["serverkey"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "trxid": trxid,
        "datetime": datetime,
        "reqid": reqid,
        "id": id,
        "responsecode": responsecode,
        "message": message,
        "serverkey": serverkey,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.stockid,
    required this.itemname,
    required this.unit,
    required this.costperunit,
  });

  String stockid;
  String itemname;
  String unit;
  String costperunit;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        stockid: json["stockid"],
        itemname: json["itemname"],
        unit: json["unit"],
        costperunit: json["costperunit"],
      );

  Map<String, dynamic> toMap() => {
        "stockid": stockid,
        "itemname": itemname,
        "unit": unit,
        "costperunit": costperunit,
      };
}
