import 'dart:convert';
import 'dart:io';
import 'package:http/browser_client.dart';
import 'package:masago_web_reg/models/post_data.dart';
import 'package:http/io_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
// import 'dart:io';
import 'package:http/http.dart' show Client;
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

import 'package:masago_web_reg/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_services.dart';
part 'api_interceptor.dart';
part 'main_view.dart';
// part 'transaction_services.dart';

// https://devapi.onbilling.id/mobile/index.php/
String baseURL = "https://app2.masago.id/mobile-fl/index.php/";