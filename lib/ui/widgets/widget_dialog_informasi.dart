part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetDialogInformasi extends StatefulWidget {
  final String? title, descriptions;
  final Function(String)? function;

  WidgetDialogInformasi(
      {this.title, this.descriptions, this.function});

  @override
  _WidgetDialogInformasiState createState() => _WidgetDialogInformasiState();
}

class _WidgetDialogInformasiState extends State<WidgetDialogInformasi> {
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Informasi",
                style: blackFontStyleBold16Px,
              ),
              const SizedBox(height: 12),
              Text(
                widget.descriptions ?? "",
                style: greyFontStyle14px,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              _buildCloseBtn(),
            ],
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
