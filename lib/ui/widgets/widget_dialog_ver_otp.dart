part of 'package:masago_web_reg/ui/pages/pages.dart';

class WidgetDialogVerOtp extends StatefulWidget {
  final String? title, descriptions, text;
  final Function(String)? function;
  bool isEmail = false;
  final Image? img;

  WidgetDialogVerOtp({this.title, this.descriptions, this.text, this.img, this.function});

  @override
  _WidgetDialogVerOtpState createState() => _WidgetDialogVerOtpState();
}

class _WidgetDialogVerOtpState extends State<WidgetDialogVerOtp> {
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
                "Verifikasi OTP",
                style: blackFontStyleBold16Px,
              ),
              const SizedBox(height: 12),
              Text(
                widget.isEmail ? Strings.verOtpEmail : Strings.verOtpSmsWA,
                style: greyFontStyle14px,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: widget.isEmail ? _buildBatalBtn() : _buildSMSBtn(),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: widget.isEmail ? _buildEmailBtn() : _buildWABtn(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              widget.isEmail
                  ? const SizedBox(height: 0)
                  : _buildChangeEmailState(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSMSBtn() {
    return WidgetButtonIcon(
      title: "SMS",
      icon: "assets/ic_email.png",
      bgColor: softBlue,
      textColor: mainColor,
      function: () {
        if (widget.function != null) {
          widget.function!("0");
        }
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildWABtn() {
    return WidgetButtonIcon(
      title: "Whatsapp",
      icon: "assets/ic_wa.png",
      bgColor: mainColor,
      textColor: Colors.white,
      function: () {
        if (widget.function != null) {
          widget.function!("3");
        }
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildEmailBtn() {
    return WidgetButtonIcon(
      title: "Email",
      icon: "assets/ic_email.png",
      bgColor: mainColor,
      textColor: Colors.white,
      function: () {
        if (widget.function != null) {
          widget.function!("1");
        }
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildBatalBtn() {
    return WidgetButtonCancel(
      title: "Batal",
      function: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildChangeEmailState() {
    return GestureDetector(
      // onTap: () => Navigator.of(context).pop(),
      onTap: () => {
        setState(() {
          widget.isEmail = widget.isEmail ? false : true;
        })
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child:
            Text("Saya tidak memegang ponsel", style: orangeFontStyleBold16Px, textAlign: TextAlign.center,),
      ),
    );
  }
}
