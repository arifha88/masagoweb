part of 'models.dart';

class ApiReturnValue<T> {
  T? value;
  final String? rc;
  final String? message;

  ApiReturnValue({this.value, this.rc, this.message});

}