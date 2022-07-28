part of 'shared.dart';

Color mainColor = "008ECC".toColor();
Color greyColor = "8D92A3".toColor();
Color softBlue = "E5F7FF".toColor();
Color softGrey = "EFEFEF".toColor();
Color orange = "FF6C00".toColor();

Widget loadingIndicator = const SpinKitFadingCircle(
  size: 45,
  color: Colors.white,
);

Widget loadingIndicatorMain = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.montserrat().copyWith(color: greyColor);
TextStyle greyFontStyle14px =
    GoogleFonts.montserrat().copyWith(color: greyColor, fontSize: 14);
TextStyle greyFontStyle12px =
    GoogleFonts.montserrat().copyWith(color: greyColor, fontSize: 12);
TextStyle greyFontStyleBold12px = GoogleFonts.montserrat()
    .copyWith(color: greyColor, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle greyFontStyleBold14px = GoogleFonts.montserrat()
    .copyWith(color: greyColor, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle blackFontStyle1 = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle1Bold = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold);
TextStyle blackFontStyleBold32Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold);
TextStyle blackFontStyleBold16Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle blackFontStyleBold18Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
TextStyle mainFontStyleBold16Px = GoogleFonts.montserrat()
    .copyWith(color: mainColor, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle mainFontStyleBold22Px = GoogleFonts.montserrat()
    .copyWith(color: mainColor, fontSize: 22, fontWeight: FontWeight.bold);
TextStyle blackFontStyleBold14Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
TextStyle blackFontStyleBold12Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);
TextStyle blackFontStyle2 = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle12Px =
    GoogleFonts.montserrat().copyWith(color: Colors.black, fontSize: 12);
TextStyle blackFontStyle14Px =
    GoogleFonts.montserrat().copyWith(color: Colors.black, fontSize: 14);
TextStyle blackFontStyle16Px =
    GoogleFonts.montserrat().copyWith(color: Colors.black, fontSize: 16);
TextStyle blackFontStyle3 =
    GoogleFonts.montserrat().copyWith(color: Colors.black);
TextStyle labelStyleError =
    GoogleFonts.montserrat().copyWith(color: Colors.red);
TextStyle whiteFontStyle =
    GoogleFonts.montserrat().copyWith(color: Colors.white);
TextStyle whiteFontStyle16Px =
    GoogleFonts.montserrat().copyWith(color: Colors.white, fontSize: 16);
TextStyle whiteFontStyle14Px =
    GoogleFonts.montserrat().copyWith(color: Colors.white, fontSize: 14);
TextStyle whiteFontStyle12Px =
    GoogleFonts.montserrat().copyWith(color: Colors.white, fontSize: 12);
TextStyle mainFontStyle = GoogleFonts.montserrat().copyWith(color: mainColor);
TextStyle whiteFontStyleBold16Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle whiteFontStyleBold22Px = GoogleFonts.montserrat()
    .copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);

TextStyle orangeFontStyleBold16Px = GoogleFonts.montserrat()
    .copyWith(color: orange, fontSize: 16, fontWeight: FontWeight.bold);
TextStyle orangeFontStyle14Px = GoogleFonts.montserrat()
    .copyWith(color: orange, fontSize: 14);

MaterialStateProperty<RoundedRectangleBorder> borderRadius8Px =
    MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(8),
));

MaterialStateProperty<RoundedRectangleBorder> borderRadius16Px =
    MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(16),
));

const double defaultMargin = 24;
