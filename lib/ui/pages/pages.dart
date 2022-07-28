import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
// import 'package:masago_web_reg/cubit/deposit_cubit.dart';
// import 'package:masago_web_reg/cubit/password_cubit.dart';
import 'package:masago_web_reg/main.dart';
import 'package:masago_web_reg/models/models.dart';
import 'package:masago_web_reg/models/post_data.dart';
// import 'package:masago_web_reg/models/response/deposit/item_bank_deposit.dart';
// import 'package:masago_web_reg/models/response/deposit/item_history_deposit.dart';
// import 'package:masago_web_reg/models/response/deposit/item_info_bank.dart';
// import 'package:masago_web_reg/models/response/deposit/item_type_deposit.dart';
// import 'package:masago_web_reg/models/response/deposit/res_deposit.dart';
// import 'package:masago_web_reg/models/response/item_bm.dart';
// import 'package:masago_web_reg/models/response/menu.dart';
// import 'package:masago_web_reg/models/response/menu_parent.dart';
// import 'package:masago_web_reg/models/response/voucher/item_voucher.dart';
import 'package:masago_web_reg/util/general_method.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:masago_web_reg/cubit/auth_cubit.dart';
import 'package:masago_web_reg/shared/shared.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:supercharged/supercharged.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_html/flutter_html.dart';
// import 'package:qr_flutter/qr_flutter.dart';

import '../../services/services.dart';
// import '../../util/custom_dropdown_button.dart';
// import '../widgets/error_text.dart';

//Part for ui screen
// part 'sign_in_page.dart';
// part 'about_page.dart';
// part 'reset_password_page.dart';
part 'register_page.dart';
part 'snk_page.dart';
// part 'main_menu/main_page.dart';
// part 'main_menu/beranda_page.dart';
// part 'main_menu/favorit_page.dart';
// part 'main_menu/layanan_page.dart';
// part 'main_menu/profil_page.dart';
// part 'main_menu/profile/change_password.dart';
// part 'main_menu/profile/change_pin_page.dart';
// part 'main_menu/notification_page.dart';
// part 'main_menu/deposit/deposit_page.dart';
// part 'main_menu/deposit/list_bank_deposit_page.dart';
// part 'main_menu/deposit/create_deposit_page.dart';
// part 'main_menu/deposit/detail_deposit_page.dart';
// part 'main_menu/deposit/new_deposit_page.dart';
// part 'main_menu/deposit/riwayat_deposit_page.dart';
// part 'main_menu/deposit/detail_deposit_alfamart_page.dart';
// part 'main_menu/pln/pln_prabayar_page.dart';
// part 'main_menu/pln/pln_pascabayar_page.dart';
// part 'main_menu/pln/pln_nontag_page.dart';
// part 'main_menu/voucher/voucher_page.dart';
// part 'main_menu/voucher/pulsa_page.dart';
// part 'main_menu/voucher/paket_data_page.dart';

//Part for widgets
// part 'package:masago_web_reg/ui/widgets/auth_field.dart';
part 'package:masago_web_reg/ui/widgets/error_text.dart';
part 'package:masago_web_reg/ui/widgets/widget_button.dart';
// part 'package:masago_web_reg/ui/widgets/badge_icon_notif.dart';
// part 'package:masago_web_reg/ui/widgets/widget_carousel.dart';
// part 'package:masago_web_reg/ui/widgets/alert_dialog_logout.dart';
part 'package:masago_web_reg/ui/widgets/widget_button_border.dart';
// part 'package:masago_web_reg/ui/widgets/widget_about_header.dart';
// part 'package:masago_web_reg/ui/widgets/widget_about_chat.dart';
// part 'package:masago_web_reg/ui/widgets/widget_about_email.dart';
// part 'package:masago_web_reg/ui/widgets/widget_about_rating.dart';
part 'package:masago_web_reg/ui/widgets/widget_button_cancel.dart';
part 'package:masago_web_reg/ui/widgets/widget_button_icon.dart';
part 'package:masago_web_reg/ui/widgets/widget_text_input_field.dart';
part 'package:masago_web_reg/ui/widgets/widget_dialog_ver_otp.dart';
part 'package:masago_web_reg/ui/widgets/widget_dialog_informasi.dart';
// part 'package:masago_web_reg/ui/widgets/widget_profile.dart';
// part 'package:masago_web_reg/ui/widgets/widget_text_input_field_password.dart';
// part 'package:masago_web_reg/ui/widgets/widget_text_input_pin.dart';
part 'package:masago_web_reg/ui/widgets/widget_dialog_loading.dart';
// part 'package:masago_web_reg/ui/widgets/widget_text_input_field_search.dart';
// part 'package:masago_web_reg/ui/widgets/widget_menu.dart';
// part 'package:masago_web_reg/ui/widgets/widget_item_notification.dart';
// part 'package:masago_web_reg/ui/widgets/widget_deposit.dart';
// part 'package:masago_web_reg/ui/widgets/widget_riwayat_deposit.dart';
// part 'package:masago_web_reg/ui/widgets/widget_bank_deposit.dart';
// part 'package:masago_web_reg/ui/widgets/widget_paket_data.dart';
// part 'package:masago_web_reg/ui/widgets/widget_pulsa.dart';

SnackbarController _showAlert(String? title, String? message, String? rc) {
  return Get.snackbar(
    "",
    "",
    backgroundColor: rc == "0000" ? Colors.green : Colors.red,
    icon: const Icon(
      MdiIcons.closeCircleOutline,
      color: Colors.white,
    ),
    titleText: Text(
      title ?? "Title",
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    messageText: Text(
      message ?? "error",
      style: GoogleFonts.poppins(color: Colors.white),
    ),
  );
}
