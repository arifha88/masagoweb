part of 'services.dart';

abstract class RequestDelegate {
  void onDismissLoading(bool isDialog);
  void onShowLoading(bool isDialog);
  void onError(String message);
}