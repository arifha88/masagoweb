part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetButtonCancel extends StatelessWidget {
  final String? title;
  final AsyncSnapshot? snapshot;
  final Function()? function;
  final bool? isLoading;
  final double? marginTop;
  final bool? isBack;

  WidgetButtonCancel(
      {this.title,
      this.snapshot,
      this.function,
      this.isLoading,
      this.marginTop,
      this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:
          EdgeInsets.only(top: marginTop ?? defaultMargin, left: 0, right: 0),
      height: 45,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(16),
      //   border: Border.all(color: mainColor),
      // ),
      child: isLoading ?? false
          ? loadingIndicator
          : ElevatedButton(
              onPressed: function,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                shape: borderRadius16Px,
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isBack == true ? Icons.chevron_left : Icons.close,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    title ?? "",
                    style: blackFontStyle16Px,
                  ),
                ],
              ),
            ),
    );
  }
}
