part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    implements RequestDelegate {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  TextEditingController noHpController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  WebViewController? _controller;
  bool isLoading = false;
  bool isLoadingResendOTP = false;
  bool isVerifikasi = false;
  int isLayout = 0;
  String? notsType;
  Auth? response;

  @override
  void onDismissLoading(bool isDialog) {
    // TODO: implement onDismissLoading
  }

  @override
  void onError(String message) {
    // TODO: implement onError
  }

  @override
  void onShowLoading(bool isDialog) {
    // TODO: implement onShowLoading
  }

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  void _onBackPressed(AuthCubit bloc) async {
    await bloc.disposeRegister();
    print("on_backpress");
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthCubit>(context);
    final mq = MediaQuery.of(context);

    return WillPopScope(
      onWillPop: () async {
        print("on_backpress");
        _onBackPressed(bloc);
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              _onBackPressed(bloc);
              Navigator.of(context).pop();
            },
          ),
          bottomOpacity: 0.0,
          elevation: 0.5,
          title: Text('Daftar Baru', style: whiteFontStyle),
          backgroundColor: mainColor,
        ),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SafeArea(
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: () async {
                print("refresh_data");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 24, bottom: 0, left: 24, right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.circle,
                                      size: 20, color: mainColor),
                                  SizedBox(
                                    width: 50,
                                    child: Divider(
                                        thickness: 1.0,
                                        color: (isLayout >= 1)
                                            ? mainColor
                                            : greyColor),
                                  ),
                                  Icon(Icons.circle,
                                      size: 20,
                                      color: (isLayout >= 1)
                                          ? mainColor
                                          : greyColor),
                                  SizedBox(
                                    width: 50,
                                    child: Divider(
                                        thickness: 1.0,
                                        color: (isLayout >= 2)
                                            ? mainColor
                                            : greyColor),
                                  ),
                                  Icon(Icons.circle,
                                      size: 20,
                                      color: (isLayout >= 2)
                                          ? mainColor
                                          : greyColor),
                                ],
                              ),
                              _buildAboutBtn(),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          Expanded(
                            child: _buildChangeLayout(bloc, mq),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 24, left: 24, right: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildBatalBtn(bloc),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: _buildRegisterBtn(bloc),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChangeLayout(AuthCubit bloc, MediaQueryData mq) {
    if (isVerifikasi) {
      return _buildLayoutVerifikasiOTP(bloc);
    } else if (isLayout == 1) {
      return _buildLayout2(bloc);
    } else if (isLayout == 2) {
      return _buildLayout3(bloc, mq);
    } else {
      return _buildLayout1(bloc);
    }
  }

  Widget _buildLayout1(AuthCubit bloc) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Daftar", style: blackFontStyleBold18Px),
          ),
          const SizedBox(height: 24.0),
          _buildNoHp(bloc),
          const SizedBox(height: 8.0),
          _buildNama(bloc),
          const SizedBox(height: 8.0),
          _buildEmail(bloc),
          const SizedBox(height: 8.0),
          _buildAddress(bloc),
        ],
      ),
    );
  }

  Widget _buildLayout2(AuthCubit bloc) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Referral", style: blackFontStyleBold18Px),
          ),
          const SizedBox(height: 24.0),
          _buildNoReferral(bloc),
        ],
      ),
    );
  }

  Widget _buildLayout3(AuthCubit bloc, MediaQueryData mq) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Syarat dan Ketentuan", style: blackFontStyleBold18Px),
        ),
        const SizedBox(height: 24.0),
        // Expanded(
        //   child: WebView(
        //     onWebViewCreated: (WebViewController webViewController) async {
        //       _controller = webViewController;
        //       await bloc.loadHtmlFromAssets(
        //           'assets/masagoeula.html', _controller);
        //     },
        //   ),
        // ),
        _buildCheckBox(bloc),
      ],
    );
  }

  Widget _buildCheckBox(AuthCubit bloc) {
    return StreamBuilder(
      stream: bloc.checkSnk,
      builder: (context, snapshot) {
        return CheckboxListTile(
          contentPadding: const EdgeInsets.all(0),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Pendaftar telah membaca dan menyetujui ",
                  style: blackFontStyle14Px,
                ),
                TextSpan(
                  text: "Syarat dan ketentuan MASAGO",
                  style: mainFontStyle,
                )
              ],
            ),
          ),
          value: snapshot.data == true ? true : false,
          onChanged: (newValue) {
            print("on_change_checkbox : $newValue");
            bloc.changeCheckSnk.add(newValue ?? false);
          },
          controlAffinity:
              ListTileControlAffinity.leading, //  <-- leading Checkbox
        );
      },
    );
  }

  Widget _buildNoReferral(AuthCubit bloc) {
    return WidgetTextInputField(
      title: "No HP Referral (Optional)",
      hint: "No HP Referral (Optional)",
      keyboard: TextInputType.phone,
      function: bloc.changeNoReferral,
    );
  }

  Widget _buildNoHp(AuthCubit bloc) {
    // bloc.phoneNumber.listen((event) => print("value_phone_number : ${event}"));
    // bloc.noReferral.listen((event) => print("value_no_referral : ${event}"));
    // // print("build_hp ${bloc.phoneNumber.last.toString()}");
    // bloc.phoneNumber.last.then((result) {
    //   print("value_ph_then ${result}");
    // });
    return StreamBuilder(
      stream: bloc.phoneNumber,
      builder: (context, snapshot) {
        // print("value_ph_inside : ${snapshot.data}");
        // var datax = "value_ph_inside : ${snapshot.data}";
        return WidgetTextInputField(
          title: "No HP",
          hint: "No HP",
          keyboard: TextInputType.phone,
          snapshot: snapshot,
          function: bloc.changePhoneNumber.add,
          controller: noHpController,
        );
      },
    );
  }

  Widget _buildNama(AuthCubit bloc) {
    return StreamBuilder(
      stream: bloc.name,
      builder: (context, snapshot) {
        return WidgetTextInputField(
          title: "Nama",
          hint: "Nama",
          keyboard: TextInputType.text,
          snapshot: snapshot,
          function: bloc.changeName.add,
          controller: nameController,
        );
      },
    );
  }

  Widget _buildEmail(AuthCubit bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return WidgetTextInputField(
          title: "Email",
          hint: "Email",
          keyboard: TextInputType.emailAddress,
          snapshot: snapshot,
          function: bloc.changeEmail.add,
          controller: emailController,
        );
      },
    );
  }

  Widget _buildAddress(AuthCubit bloc) {
    return StreamBuilder(
      stream: bloc.address,
      builder: (context, snapshot) {
        return WidgetTextInputField(
          title: "Alamat",
          hint: "Alamat",
          keyboard: TextInputType.text,
          snapshot: snapshot,
          function: bloc.changeAddress.add,
          controller: addressController,
        );
      },
    );
  }

  Widget _buildRegisterBtn(AuthCubit bloc) {
    return StreamBuilder(
      stream: bloc.submitValidRegister,
      builder: (context, snapshot) {
        return StreamBuilder(
          stream: bloc.checkSnk,
          initialData: false,
          builder: (context, snapshotSnk) {
            return StreamBuilder(
              stream: bloc.otp,
              builder: (context, snapshotOtp) {
                return WidgetButton(
                  title: isVerifikasi ? "Verifikasi" : "Lanjutkan",
                  snapshot: snapshot,
                  bgColor: snapshotSnk.data == false && isLayout >= 2
                      ? greyColor
                      : mainColor,
                  function: () async {
                    print("on_click : ${snapshot.data}");
                    if (noHpController.text == "") {
                      bloc.changePhoneNumber.add("");
                    } else if (nameController.text == "") {
                      bloc.changeName.add("");
                    } else if (emailController.text == "") {
                      bloc.changeEmail.add("");
                    } else if (addressController.text == "") {
                      bloc.changeAddress.add("");
                    } else {
                      if (isLayout < 2) {
                        setState(() {
                          isLayout++;
                        });
                      }
                    }

                    if (snapshot.hasData &&
                        isLayout >= 2 &&
                        snapshotSnk.data == true) {
                      if (isVerifikasi) {
                        if (snapshotOtp.hasData && otpController.text != "") {
                          onRegister(bloc, false, "${snapshotOtp.data}");
                        } else {
                          bloc.changeOTP.add('');
                        }
                      } else {
                        showDialogOTP(bloc, false);
                      }
                    }
                  },
                  isLoading: isLoading,
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildBatalBtn(AuthCubit bloc) {
    return WidgetButtonCancel(
      title: "Batal",
      function: () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildLayoutVerifikasiOTP(AuthCubit bloc) {
    print('layout_verifikasi_otp');
    return Column(
      children: [
        Text("Verifikasi OTP", style: blackFontStyleBold18Px),
        const SizedBox(height: 24.0),
        _buildInfoOtp(),
        const SizedBox(height: 24.0),
        _buildOTP(bloc, context),
        const SizedBox(height: 16.0),
        StreamBuilder(
          stream: bloc.countTime,
          builder: (context, snapshot) {
            print("value_count_down : ${snapshot.data}");
            return IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _buildInfoResend(snapshot),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  _buildResendOTP(bloc, snapshot),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildInfoOtp() {
    String sendValue =
        (response?.noHp == "" || response?.noHp == null || notsType == "1")
            ? "email anda ${response?.email ?? "-"}"
            : "nomor anda ${response?.noHp ?? "-"}";
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
          "Kode verifikasi dikirim melalui ${GeneralMethod().checkedNotsTypes(notsType)} ke $sendValue",
          style: blackFontStyle14Px),
    );
  }

  Widget _buildInfoResend(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      if (snapshot.data == 0) {
        return Text("Anda dapat mengirim ulang kode OTP sekarang",
            style: greyFontStyle);
      } else {
        return Text(
            "Tunggu ${snapshot.hasData ? snapshot.data : 90} detik untuk kirim ulang kode OTP",
            style: greyFontStyle);
      }
    } else {
      return Text("Tunggu 90 detik untuk kirim ulang kode OTP",
          style: greyFontStyle);
    }
  }

  Widget _buildResendOTP(AuthCubit bloc, AsyncSnapshot snapshot) {
    return WidgetButtonBorder(
      title: "Kirim Ulang",
      textColor: mainColor,
      marginTop: 0,
      function: () {
        if (snapshot.hasData && snapshot.data == 0) {
          showDialogOTP(bloc, true);
        }
      },
      isLoading: isLoadingResendOTP,
    );
  }

  Widget _buildOTP(AuthCubit bloc, BuildContext context) {
    return StreamBuilder(
        stream: bloc.otp,
        builder: (context, snapshot) {
          return PinCodeTextField(
            length: 6,
            obscureText: true,
            animationType: AnimationType.fade,
            keyboardType: TextInputType.number,
            controller: otpController,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 45,
              fieldWidth: 45,
              activeFillColor: Colors.white,
            ),
            animationDuration: const Duration(milliseconds: 200),
            backgroundColor: Colors.transparent,
            enableActiveFill: false,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: bloc.changeOTP.add,
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              return true;
            },
            appContext: context,
          );
        });
  }

  void showDialogOTP(AuthCubit bloc, bool loading) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WidgetDialogVerOtp(
          function: (String value) async {
            notsType = value;
            onRegister(bloc, loading, null);
          },
        );
      },
    );
  }

  void showDialogInformasi(String? title, String? msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return WidgetDialogInformasi(
          title: title,
          descriptions: msg,
        );
      },
    );
  }

  void onRegister(AuthCubit bloc, bool resend, String? otp) async {
    setState(() {
      if (resend) {
        isLoadingResendOTP = true;
      } else {
        isLoading = true;
      }
    });
    var postData = PostData();
    postData.notsType = notsType;
    postData.otp = otp;
    if (isVerifikasi && resend != true) {
      postData.mti = "2200";
    } else {
      postData.mti = "2100";
    }

    await bloc.register(
        true, postData, postData.mti == "2200" ? response : null);
    AuthState state = bloc.state;

    if (state is AuthLoaded) {
      print("successs : ${state.auth.rc}");
      response = state.auth;
      if (isVerifikasi && !resend) {
        if (state.auth.rc == "0000") {
          var title = "Registrasi sukses";
          var msg =
              "Silakan cek SMS/Whatsapp/E-Mail untuk Password dan Username anda";
          showDialogInformasi(title, msg);
        } else {
          _showAlert("Informasi", state.auth.rcm ?? "Kode OTP salah",
              state.auth.rc ?? "0000");
        }
      } else {
        _showAlert("Informasi", state.auth.rcm == "0000" ? "Kode OTP telah dikirim" : state.auth.rcm,
            state.auth.rc ?? "0000");
      }
      setState(() {
        if (resend) {
          isLoadingResendOTP = false;
        } else {
          isLoading = false;
        }
        if (state.auth.rc == "0000" && isVerifikasi != true) {
          isVerifikasi = true;
          bloc.sendVerifyCode(10);
        } else if (resend) {
          bloc.sendVerifyCode(10);
        }
      });
    } else {
      _showAlert("Informasi", (state as AuthLoadingFailed).message, null);
      print("error : ${(state as AuthLoadingFailed).message}");
      setState(() {
        if (resend) {
          isLoadingResendOTP = false;
        } else {
          isLoading = false;
        }
      });
    }
  }
}

Widget _buildAboutBtn() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      SizedBox(
        height: 24,
        width: 24,
        child: IconButton(
          icon: Image.asset('assets/ic_about.png'),
          iconSize: 24,
          padding: const EdgeInsets.all(0),
          onPressed: () {
            // Get.to(AboutPage());
          },
        ),
      )
    ],
  );
}