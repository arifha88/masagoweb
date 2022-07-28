part of '../models.dart';

class Preferences {
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? "";
  }

  Future<void> saveToken(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token ?? "");
  }

  Future<String> getUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid') ?? "";
  }

  Future<void> saveUid(String? uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid ?? "");
  }

  Future<String> getSS() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ss') ?? "";
  }

  Future<void> saveSS(String? ss) async {
    print("save_value_ss : $ss");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('ss', ss ?? "");
  }
}