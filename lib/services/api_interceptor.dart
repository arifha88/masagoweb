part of 'services.dart';

class ApiTokenInterceptor implements InterceptorContract {
  final bool statusToken;

  ApiTokenInterceptor({required this.statusToken});

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
  
      data.headers["Accept"] = "application/json";
      data.headers["Access-Control_Allow_Origin"] = "*";
      data.headers["Access-Control-Allow-Credentials"] = "true";
      data.headers["Access-Control-Allow-Headers"] = "Origin, X-Requested-With, Content-Type, Accept";
      data.headers["Access-Control-Allow-Methods"] = "GET,PUT,PATCH,POST,DELETE";
      if (statusToken) {
        data.headers["Content-Type"] = "application/x-www-form-urlencoded";
        String encoded = base64.encode(utf8.encode("clientid:clientkey"));
        data.headers["Authorization"] = "Basic " + encoded;
      } else {
        data.headers["Content-Type"] = "application/json; charset=utf-8";
        // final prefs = await SharedPreferences.getInstance();
        // final String token = prefs.getString('token') ?? "";
        String token = await Preferences().getToken();

        String timestamp = DateFormat("yyyyMMddHHmmss").format(DateTime.now());

        // var parsedQueryParameters = Uri.splitQueryString(data.body);

        print("request_body_split : " + data.body);
        // print("token : $token");
        String sha256ReqBody = sha256.convert(utf8.encode(data.body)).toString();
        String signature = data.method.name + ":" + "/index.php" + ":" + token + ":" + sha256ReqBody + ":" + timestamp;
        
        print("signature : " + signature);

        var key = utf8.encode('apikey');
        var bytes = utf8.encode(signature);

        var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
        var digest = hmacSha256.convert(bytes);

        String signatureEncrypt = "$digest";

        print("signatureEncrypt : " + signatureEncrypt);

        data.headers["X-Auth-Key"] = "apiid";
        data.headers["X-Auth-Timestamp"] = timestamp;
        data.headers["X-Auth-Signature"] = signatureEncrypt;
        data.headers["Authorization"] = "Bearer " + token;
      }

    } catch (e) {
      print("error_set_header : " + e.toString());
    }
    print("header_request ${data.headers.toString()}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async => data;
  
}
