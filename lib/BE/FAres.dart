// To parse this JSON data, do
//
//     final fixAsset = fixAssetFromMap(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

FixAsset fixAssetFromMap(String str) => FixAsset.fromMap(json.decode(str));

String fixAssetToMap(FixAsset data) => json.encode(data.toMap());

class FixAsset {
  FixAsset({
    required this.trxid,
    required this.datetime,
    required this.reqid,
    required this.id,
    required this.serverkey,
    required this.responsecode,
    required this.message,
    required this.result,
  });

  String trxid;
  String datetime;
  String reqid;
  String id;
  int serverkey;
  String responsecode;
  String message;
  List<Result> result;

  factory FixAsset.fromMap(Map<String, dynamic> json) => FixAsset(
        trxid: json["trxid"],
        datetime: json["datetime"],
        reqid: json["reqid"],
        id: json["id"],
        serverkey: json["serverkey"],
        responsecode: json["responsecode"],
        message: json["message"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "trxid": trxid,
        "datetime": datetime,
        "reqid": reqid,
        "id": id,
        "serverkey": serverkey,
        "responsecode": responsecode,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}

class Result {
  Result({
    required this.fadatano,
    required this.description,
    required this.pchdate,
    required this.amount,
    required this.category,
    required this.categoryname,
    required this.subcategory,
    required this.subcategoryname,
    required this.brandid,
    required this.brandname,
    required this.brandtipe,
    required this.brandtipename,
    required this.countrycode,
    required this.countryname,
    required this.reffno,
    required this.reqno,
    required this.pono,
    required this.requestby,
    required this.serialno,
    required this.supplierid,
    required this.suppliername,
    required this.fatype,
    required this.locationid,
    required this.locationname,
    required this.imagedir,
  });

  String fadatano;
  String description;
  DateTime pchdate;
  String amount;
  String category;
  String categoryname;
  String subcategory;
  String subcategoryname;
  String brandid;
  String brandname;
  String brandtipe;
  String brandtipename;
  String countrycode;
  String countryname;
  String reffno;
  String reqno;
  String pono;
  String requestby;
  String serialno;
  String supplierid;
  String suppliername;
  String fatype;
  String locationid;
  String locationname;
  String imagedir;

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        fadatano: json["fadatano"],
        description: json["description"],
        pchdate: DateTime.parse(json["pchdate"]),
        amount: json["amount"],
        category: json["category"],
        categoryname: json["categoryname"],
        subcategory: json["subcategory"],
        subcategoryname: json["subcategoryname"],
        brandid: json["brandid"],
        brandname: json["brandname"],
        brandtipe: json["brandtipe"],
        brandtipename: json["brandtipename"],
        countrycode: json["countrycode"],
        countryname: json["countryname"],
        reffno: json["reffno"],
        reqno: json["reqno"],
        pono: json["pono"],
        requestby: json["requestby"],
        serialno: json["serialno"],
        supplierid: json["supplierid"],
        suppliername: json["suppliername"],
        fatype: json["fatype"],
        locationid: json["locationid"],
        locationname: json["locationname"],
        imagedir: json["imagedir"],
      );

  Map<String, dynamic> toMap() => {
        "fadatano": fadatano,
        "description": description,
        "pchdate":
            "${pchdate.year.toString().padLeft(4, '0')}-${pchdate.month.toString().padLeft(2, '0')}-${pchdate.day.toString().padLeft(2, '0')}",
        "amount": amount,
        "category": category,
        "categoryname": categoryname,
        "subcategory": subcategory,
        "subcategoryname": subcategoryname,
        "brandid": brandid,
        "brandname": brandname,
        "brandtipe": brandtipe,
        "brandtipename": brandtipename,
        "countrycode": countrycode,
        "countryname": countryname,
        "reffno": reffno,
        "reqno": reqno,
        "pono": pono,
        "requestby": requestby,
        "serialno": serialno,
        "supplierid": supplierid,
        "suppliername": suppliername,
        "fatype": fatype,
        "locationid": locationid,
        "locationname": locationname,
        "imagedir": imagedir,
      };
}
