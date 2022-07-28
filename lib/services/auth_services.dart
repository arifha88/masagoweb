part of 'services.dart';

class AuthServices {
  static InterceptedClient clientToken = InterceptedClient.build(
    requestTimeout: const Duration(seconds: 100),
    client: BrowserClient(),
    // client: IOClient(HttpClient()
    //   ..badCertificateCallback =
    //       ((X509Certificate cert, String host, int port) => true)),
    interceptors: [
      ApiTokenInterceptor(statusToken: true),
    ],
  );

  static InterceptedClient client = InterceptedClient.build(
    requestTimeout: Duration(seconds: 100),
    client: BrowserClient(),
    // client: IOClient(
    //   HttpClient()
    //     ..badCertificateCallback =
    //         ((X509Certificate cert, String host, int port) => true),
    // ),
    interceptors: [
      ApiTokenInterceptor(statusToken: false),
    ],
  );

  static Future<String> getToken() async {
    try {
      print("before_request");
      var response = await clientToken
          .post(Uri.parse(baseURL), body: {'grant_type': 'client_credentials'});

      print("after_request");
      if (response.statusCode != 200) {
        return "error";
      }

      var data = jsonDecode(response.body);
      Auth value = Auth.fromJson(data);

      await Preferences().saveToken(value.accessToken);

      return value.accessToken ?? "";
    } catch (e) {
      return "error_catch : ${e.toString()}";
    }
  }

  static Future<Auth> resetPassword(PostData postData) async {
    try {
      var responseToken = await clientToken
          .post(Uri.parse(baseURL), body: {'grant_type': 'client_credentials'});

      if (responseToken.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      var dataToken = jsonDecode(responseToken.body);
      Auth valueToken = Auth.fromJson(dataToken);

      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', valueToken.accessToken ?? "");
      await Preferences().saveToken(valueToken.accessToken);

      var response = await client.post(Uri.parse(baseURL),
          body: jsonEncode(postData.toMapJsonResetPassword()));

      if (response.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      print("response_before_decode : ${response.body}");
      var data = jsonDecode(response.body);
      Auth value = Auth.fromJson(data);

      print("response : ${data}");

      return value;
    } catch (e) {
      return Auth(message: "error_catch : " + e.toString());
    }
  }

  static Future<Auth> signUp(PostData postData) async {
    try {
      print("before_request");
      var responseToken = await clientToken
          .post(Uri.parse(baseURL), body: {'grant_type': 'client_credentials'});

      print("after_request");
      if (responseToken.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      var dataToken = json.decode(responseToken.body);
      Auth valueToken = Auth.fromJson(dataToken);

      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', valueToken.accessToken ?? "");
      await Preferences().saveToken(valueToken.accessToken);

      var response = await client.post(Uri.parse(baseURL),
          body: json.encode(postData.mti == "2200"
              ? postData.toJsonPayRegister()
              : postData.toJsonInqRegister()));

      if (response.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      print("response_before_decode : ${response.body}");
      var data = json.decode(response.body);
      Auth value = Auth.fromJson(data);

      print("response : $value");

      return value;
    } catch (e) {
      return Auth(message: "error_catch : " + e.toString());
    }
  }

  static Future<Auth> changePassword(PostData postData) async {
    try {
      var token = await Preferences().getToken();
      if (token == "") {
        token = await getToken();
        if (token == "" || token.contains("error")) {
          return Auth(message: "Please try again");
        }
      }

      var response = await client.post(Uri.parse(baseURL),
          body: jsonEncode(postData.toJsonChangePassword()));

      if (response.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      var data = jsonDecode(response.body);
      Auth value = Auth.fromJson(data);

      print("response : ${data}");

      return value;
    } catch (e) {
      return Auth(message: "error_catch : " + e.toString());
    }
  }

  static Future<Auth> changePin(PostData postData) async {
    try {
      var token = await Preferences().getToken();
      if (token == "") {
        token = await getToken();
        if (token == "" || token.contains("error")) {
          return Auth(message: "Please try again");
        }
      }

      var response = await client.post(Uri.parse(baseURL),
          body: jsonEncode(postData.toJsonChangePin()));

      if (response.statusCode != 200) {
        return Auth(message: "Please try again");
      }

      var data = jsonDecode(response.body);
      Auth value = Auth.fromJson(data);

      print("response : ${data}");

      return value;
    } catch (e) {
      return Auth(message: "error_catch : " + e.toString());
    }
  }
}
