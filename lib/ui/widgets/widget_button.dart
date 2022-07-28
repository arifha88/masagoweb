part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetButton extends StatelessWidget {
  final String? title;
  final AsyncSnapshot? snapshot;
  final Function()? function;
  final bool? isLoading;
  final double? marginTop;
  final Color? bgColor;
  final double? marginHorizontal;
  final Color? textColor;
  final double? width;

  WidgetButton(
      {this.title,
      this.snapshot,
      this.function,
      this.isLoading,
      this.marginTop,
      this.bgColor,
      this.marginHorizontal,
      this.textColor,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      margin: EdgeInsets.only(top: marginTop ?? defaultMargin),
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: marginHorizontal ?? 0),
      child: isLoading ?? false
          ? loadingIndicatorMain
          : ElevatedButton(
              onPressed: function,
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shape: borderRadius16Px,
                  backgroundColor: MaterialStateProperty.all<Color>(bgColor ?? mainColor)),
              child: Text(
                title ?? "",
                style: GoogleFonts.poppins(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
