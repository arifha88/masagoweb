part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetDialogLoading extends StatefulWidget {
  final String? title, descriptions;
  final Function(String)? function;

  WidgetDialogLoading({this.title, this.descriptions, this.function});

  @override
  _WidgetDialogLoadingState createState() => _WidgetDialogLoadingState();
}

class _WidgetDialogLoadingState extends State<WidgetDialogLoading> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultMargin),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: defaultMargin),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultMargin),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                loadingIndicatorMain,
                const SizedBox(width: 12),
                Text(
                  "Mohon Tunggu...",
                  style: blackFontStyle16Px,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCloseBtn() {
    return WidgetButton(
      title: "Tutup",
      bgColor: mainColor,
      function: () {
        Navigator.of(context).pop();
      },
    );
  }
}
