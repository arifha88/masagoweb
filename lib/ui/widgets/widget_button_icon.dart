part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetButtonIcon extends StatelessWidget {
  final String? title;
  final AsyncSnapshot? snapshot;
  final Function()? function;
  final bool? isLoading;
  final double? marginTop;
  final Color? textColor;
  final Color? bgColor;
  final String? icon;

  WidgetButtonIcon(
      {this.title,
      this.snapshot,
      this.function,
      this.isLoading,
      this.marginTop,
      this.textColor,
      this.bgColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.only(top: marginTop ?? defaultMargin, left: 0, right: 0),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        // border: Border.all(color: mainColor),
      ),
      child: isLoading ?? false
          ? loadingIndicator
          : ElevatedButton(
              onPressed: function,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: borderRadius16Px,
                backgroundColor: MaterialStateProperty.all<Color>(
                    bgColor ?? Colors.transparent),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(icon ?? "assets/ic_email.png"),
                    color: textColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      title ?? "",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat()
                          .copyWith(color: textColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
