import 'package:masago_web_reg/models/models.dart';
import 'package:masago_web_reg/util/general_method.dart';
import 'package:intl/intl.dart';

class PostData {
  String? email;
  String? password;
  late final String? provider;
  String? token;
  late final String? cc;
  late final String? dt;
  late final String? devid;
  List<String>? imei;
  String? mti;
  late final String? pan;
  late final String? pc;
  late final String? sign;
  late final String? st;
  String? uid;
  String? x;
  String? y;
  String? name;
  String? noHp;
  String? address;
  String? referral;
  String? notsType;
  String? otp;
  String? kota;
  String? countryId;
  String? sendEmail;
  String? tempatLahir;
  String? jenisKelamin;
  String? pekerjaan;
  String? kewarganegaraan;
  String? noId;
  String? jenisId;
  String? tglBerlakuId;
  String? cidRef;
  String? dasType;
  String? po;
  String? pn;
  String? pnr;
  String? ss;
  String? oldPin;
  String? newPin;
  String? date;
  String? amt;
  String? noRek;

  PostData({this.email, this.password, this.provider, this.token, this.cc, this.dt, this.devid, this.imei, this.pan, this.pc, this.sign, this.st, this.uid, this.x, this.y});

  Map<String, dynamic> toMapJsonLoginManual() {
    return <String, dynamic>{
      "CC": "02",
      "DEVID": "88999",
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "IMEI": imei ?? "",
      "MTI": "2800",
      "PAN": "1000",
      "PASW": password,
      "PC": "001",
      "SIGN": "dycodesignature",
      "ST": GeneralMethod().generateRandomValue(),
      "UID": uid,
      "X": x ?? "0",
      "Y": y ?? "0",
    };
  }

  Map<String, dynamic> toMapJsonResetPassword() {
    return <String, dynamic>{
      "CC": Strings.CC,
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "MTI": mti ?? "2100",
      "PAN": "RESPASS",
      "PC": "100008",
      "SIGN": Strings.signature,
      "ST": GeneralMethod().generateRandomValue(),
      "UID": uid,
      "NOTSTYPE": notsType ?? "1",
      "OTP": otp,
    };
  }

  Map<String, dynamic> toMapJsonLoginSosmed() {
    return <String, dynamic>{
      "provider": provider,
      "token": token,
    };
  }

  Map<String, dynamic> toJsonInqRegister() {
    return <String, dynamic>{
      "MTI": "2100",
      "PAN": "REG104",
      "PC": "100004",
      "CC": Strings.CC,
      "SIGN": Strings.signature,
      "UID": uid,
      "ST": GeneralMethod().generateRandomValue(),
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "NAME": name ?? "",
      "NO_HP": noHp ?? "",
      "EMAIL": email ?? "",
      "ADDRESS": address ?? "",
      "REFERRAL": referral ?? "",
      "NOTSTYPE": notsType ?? "",
      "AREA": Strings.AREA,
    };
  }

  Map<String, dynamic> toJsonPayRegister() {
    return <String, dynamic>{
      "MTI": "2200",
      "PAN": "REG104",
      "PC": "100004",
      "CC": Strings.CC,
      "SIGN": Strings.signature,
      "UID": uid,
      "ST": GeneralMethod().generateRandomValue(),
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "NAME": name ?? "",
      "NO_HP": noHp ?? "",
      "EMAIL": email ?? "",
      "ADDRESS": address ?? "",
      "REFERRAL": referral ?? "",
      "NOTSTYPE": notsType ?? "",
      "OTP": otp ?? "",
      "KOTA": kota ?? "",
      "COUNTRY_ID": countryId ?? "",
      "SEND_EMAIL": sendEmail ?? "",
      "TEMPAT_LAHIR": tempatLahir ?? "",
      "JENIS_KELAMIN": jenisKelamin ?? "",
      "PEKERJAAN": pekerjaan ?? "",
      "KEWARGANEGARAAN": kewarganegaraan ?? "",
      "NO_ID": noId ?? "",
      "JENIS_ID": jenisId ?? "",
      "TGL_BERLAKU_ID": tglBerlakuId ?? "",
      "CID_REF": cidRef ?? "",
      "PLPWD": "12345",
      "DAS_TYPE": dasType ?? "",
      "AREA": Strings.AREA,
    };
  }

  Map<String, dynamic> toJsonChangePassword() {
    return <String, dynamic>{
      "MTI": "2600",
      "PAN": "12000",
      "PC": "120003",
      "CC": Strings.CC,
      "SIGN": Strings.signature,
      "UID": uid,
      "ST": GeneralMethod().generateRandomValue(),
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "SS": ss ?? "",
      "PO": po ?? "",
      "PN": pn ?? "",
      "PNR": pnr ?? "",
    };
  }

  Map<String, dynamic> toJsonChangePin() {
    return <String, dynamic>{
      "MTI": "2611",
      "PAN": "12000",
      "PC": "000003",
      "CC": Strings.CC,
      "SIGN": Strings.signature,
      "UID": uid,
      "ST": GeneralMethod().generateRandomValue(),
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "DATE": date ?? DateFormat("yyyyMMdd").format(DateTime.now()),
      "SS": ss ?? "",
      "OLDPIN": oldPin,
      "NEWPIN": newPin ?? "",
    };
  }

  Map<String, dynamic> toMapJsonRoleMenu() {
    return <String, dynamic>{
      "CC": Strings.CC,
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "MTI": "2600",
      "PAN": "MOROLE",
      "PC": "18000",
      "SS": ss,
      "SIGN": Strings.signature,
      "ST": GeneralMethod().generateRandomValue(),
      "UID": uid,
    };
  }

  Map<String, dynamic> toMapJsonBm() {
    return <String, dynamic>{
      "CC": Strings.CC,
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "MTI": "2600",
      "PAN": "16000",
      "PC": "310000",
      "SS": ss,
      "SIGN": Strings.signature,
      "ST": GeneralMethod().generateRandomValue(),
      "UID": uid,
    };
  }

  Map<String, dynamic> toMapJsonDepo(String type) {
    var data = <String, dynamic>{
      "CC": Strings.CC,
      "DT": DateFormat("yyyyMMddHHmmss").format(DateTime.now()),
      "MTI": "2600",
      "PAN": "TKDEPO",
      "SS": ss,
      "SIGN": Strings.signature,
      "ST": GeneralMethod().generateRandomValue(),
      "UID": uid,
    };

    if (type == "type") {
      data["REF_ID"] = "00";
      data["PC"] = "TKDEPOLDP";
    } else if (type == "history") {
      data["ROW"] = "5";
      data["PC"] = "TKDEPOLT";
    } else if (type == "BANK" || type == "VA") {
      data["REF_ID"] = "00";
      data["PC"] = "TKDEPOLBV";
      data["TYPE"] = type;
    } else if (type == "deposit") {
      data["AMT"] = amt;
      data["NOREK"] = noRek;
      data["PC"] = "TKDEPOGT";
    }

    return data;
  }
}