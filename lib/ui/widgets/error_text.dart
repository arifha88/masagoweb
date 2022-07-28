part of 'package:masago_web_reg/ui/pages/pages.dart';

class ErrorText extends StatelessWidget {
  final String? message;

  ErrorText({this.message});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: Text(
        message ?? "error",
        style: labelStyleError,
      ),
      maintainState: true,
      visible: message != null ? true : false,
    );
  }
}
