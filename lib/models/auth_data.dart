part of 'models.dart';

class Auth extends Equatable {
  final String? accessToken;
  final String? scope;
  final String? tokenType;
  final int? expiresIn;
  final String? message;
  final String? sc;
  final String? cc;
  final String? dt;
  final String? pasw;
  final String? ss;
  final String? rc;
  final String? uid;
  final String? mti;
  final String? pc;
  final String? sign;
  final String? pan;
  final String? rcm;
  final String? email;
  final String? noHp;
  final String? kota;
  final String? countryId;
  final String? sendEmail;
  final String? tempatLahir;
  final String? jenisKelamin;
  final String? pekerjaan;
  final String? kewarganegaraan;
  final String? noId;
  final String? jenisId;
  final String? tglBerlakuId;
  final String? cidRef;
  final String? dasType;
  final String? dasAccount;
  final String? area;
  final String? address;
  final String? ec;
  final String? ppid;
  final String? bm;

  // static String? token;

  Auth({
    this.accessToken,
    this.scope,
    this.tokenType,
    this.expiresIn,
    this.message,
    this.sc,
    this.cc,
    this.dt,
    this.pasw,
    this.ss,
    this.rc,
    this.uid,
    this.mti,
    this.pc,
    this.sign,
    this.pan,
    this.rcm,
    this.email,
    this.noHp,
    this.kota,
    this.countryId,
    this.sendEmail,
    this.tempatLahir,
    this.jenisKelamin,
    this.pekerjaan,
    this.kewarganegaraan,
    this.noId,
    this.jenisId,
    this.tglBerlakuId,
    this.cidRef,
    this.dasType,
    this.dasAccount,
    this.area,
    this.address,
    this.ec,
    this.ppid,
    this.bm,
  });

  factory Auth.fromJson(Map<String, dynamic> data) => Auth(
        accessToken: data['access_token'],
        scope: data['scope'],
        tokenType: data['token_type'],
        expiresIn: data['expires_in'] ?? 0,
        message: data['message'] ?? data['ErrorMessage']?['Indonesian'],
        sc: data['SC'],
        cc: data['CC'],
        dt: data['DT'],
        pasw: data['PASW'],
        ss: data['SS'],
        rc: data['RC'],
        uid: data['UID'],
        mti: data['MTI'],
        pc: data['PC'],
        sign: data['SIGN'],
        pan: data['PAN'],
        rcm: data['RCM'],
        email: data['EMAIL'],
        noHp: data['NO_HP'],
        kota: data['KOTA'],
        countryId: data['COUNTRY_ID'],
        sendEmail: data['SEND_EMAIL'],
        tempatLahir: data['TEMPAT_LAHIR'],
        jenisKelamin: data['JENIS_KELAMIN'],
        pekerjaan: data['PEKERJAAN'],
        kewarganegaraan: data['KEWARGANEGARAAN'],
        noId: data['NO_ID'],
        jenisId: data['JENIS_ID'],
        tglBerlakuId: data['TGL_BERLAKU_ID'],
        cidRef: data['CID_REF'],
        dasType: data['DAS_TYPE'],
        dasAccount: data['DAS_ACCOUNT'],
        area: data['AREA'],
        address: data['ADDRESS'],
        ec: data['EC'],
        ppid: data['PPID'],
        bm: data['BM'],
      );

  factory Auth.fromJsonRegister(Map<String, dynamic> data) => Auth(
        rc: data['RC'],
        rcm: data['RCM'],
      );

  Auth copyWith({
    String? accessToken,
    String? scope,
    String? tokenType,
    int? expiresIn,
    String? message,
    String? sc,
    String? cc,
    String? dt,
    String? pasw,
    String? ss,
    String? rc,
    String? uid,
    String? mti,
    String? pc,
    String? sign,
    String? pan,
    String? rcm,
    String? email,
    String? noHp,
    String? kota,
    String? countryId,
    String? sendEmail,
    String? tempatLahir,
    String? jenisKelamin,
    String? pekerjaan,
    String? kewarganegaraan,
    String? noId,
    String? jenisId,
    String? tglBerlakuId,
    String? cidRef,
    String? dasType,
    String? dasAccount,
    String? area,
    String? address,
    String? ec,
    String? ppid,
    String? bm,
  }) =>
      Auth(
        accessToken: accessToken ?? this.accessToken,
        scope: scope ?? this.scope,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
        message: message ?? this.message,
        sc: sc ?? this.sc,
        cc: cc ?? this.cc,
        dt: dt ?? this.dt,
        pasw: pasw ?? this.pasw,
        ss: ss ?? this.ss,
        rc: rc ?? this.rc,
        uid: uid ?? this.uid,
        mti: mti ?? this.mti,
        pc: pc ?? this.pc,
        sign: sign ?? this.sign,
        pan: pan ?? this.pan,
        rcm: rcm ?? this.rcm,
        email: email ?? this.email,
        noHp: noHp ?? this.noHp,
        kota: kota ?? this.kota,
        countryId: countryId ?? this.countryId,
        sendEmail: sendEmail ?? this.sendEmail,
        tempatLahir: tempatLahir ?? this.tempatLahir,
        jenisKelamin: jenisKelamin ?? this.jenisKelamin,
        pekerjaan: pekerjaan ?? this.pekerjaan,
        kewarganegaraan: kewarganegaraan ?? this.kewarganegaraan,
        noId: noId ?? this.noId,
        jenisId: jenisId ?? this.jenisId,
        tglBerlakuId: tglBerlakuId ?? this.tglBerlakuId,
        cidRef: cidRef ?? this.cidRef,
        dasType: dasType ?? this.dasType,
        dasAccount: dasAccount ?? this.dasAccount,
        area: area ?? this.area,
        address: address ?? this.address,
        ec: ec ?? this.ec,
        ppid: ppid ?? this.ppid,
        bm: bm ?? this.bm,
      );

  @override
  List<Object?> get props => [
        accessToken,
        scope,
        tokenType,
        expiresIn,
        message,
        sc,
        cc,
        dt,
        pasw,
        ss,
        rc,
        uid,
        mti,
        pc,
        sign,
        pan,
        rcm,
        email,
        noHp,
        kota,
        countryId,
        sendEmail,
        tempatLahir,
        jenisKelamin,
        pekerjaan,
        kewarganegaraan,
        noId,
        jenisId,
        tglBerlakuId,
        cidRef,
        dasType,
        dasAccount,
        area,
        address,
        ec,
        ppid,
        bm,
      ];
}
