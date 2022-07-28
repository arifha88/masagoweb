part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetButtonBorder extends StatelessWidget {
  final String? title;
  final AsyncSnapshot? snapshot;
  final Function()? function;
  final bool? isLoading;
  final double? marginTop;
  final Color? textColor;
  final double? valueWidth;

  WidgetButtonBorder(
      {this.title,
      this.snapshot,
      this.function,
      this.isLoading,
      this.marginTop,
      this.textColor,
      this.valueWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: valueWidth ?? double.infinity,
      margin:
          EdgeInsets.only(top: marginTop ?? defaultMargin, left: 0, right: 0),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: mainColor),
      ),
      child: isLoading ?? false
          ? loadingIndicatorMain
          : ElevatedButton(
              onPressed: function,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: borderRadius16Px,
                backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Text(
                title ?? "",
                style: GoogleFonts.poppins(
                  color: textColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
