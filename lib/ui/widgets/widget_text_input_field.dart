part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetTextInputField extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextInputType? keyboard;
  final bool? obscureText;
  final AsyncSnapshot? snapshot;
  final Function(String)? function;
  final AsyncSnapshot? snapshot1;
  final IconData? icons;
  final TextStyle? textStyle;
  final String? icon;
  final String? initialValue;
  final TextEditingController? controller;

  WidgetTextInputField(
      {this.title,
      this.hint,
      this.keyboard,
      this.obscureText,
      this.snapshot,
      this.function,
      this.snapshot1,
      this.icons,
      this.textStyle,
      this.icon,
      this.initialValue,
      this.controller,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          enabled: snapshot1?.hasData ?? true,
          obscureText: obscureText ?? false,
          keyboardType: keyboard,
          controller: controller,
          // initialValue: initialValue ?? "",
          decoration: InputDecoration(
            // border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color:mainColor, width: 1.0),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greyColor, width: 1.0),
            ),
            hintStyle: greyFontStyle,
            fillColor: Colors.white,
            labelText: title,
            hintText: title,
          ),
          onChanged: function,
        ),
        const SizedBox(height: 4.0),
        ErrorText(
            message: (snapshot?.hasError ?? false)
                ? snapshot?.error.toString()
                : null),
      ],
    );
  }
}
