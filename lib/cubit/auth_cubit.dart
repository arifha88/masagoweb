import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:masago_web_reg/cubit/validators.dart';
import 'package:masago_web_reg/models/post_data.dart';
import 'package:masago_web_reg/util/general_method.dart';
import 'package:equatable/equatable.dart';
import 'package:masago_web_reg/services/services.dart';
import 'package:rxdart/rxdart.dart';

import '../models/models.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with Validators {
  AuthCubit() : super(AuthInitial());
  RequestDelegate? delegate;
  StreamSubscription? _counter;
  final Object EMPTY = new Object();

  attachView(RequestDelegate? delegate) {
    this.delegate = delegate;
  }

  final _username = BehaviorSubject<String>();
  final _usernameReset = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _cPassword = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _noReferral = BehaviorSubject<String>();
  final _currentPageCarousel = BehaviorSubject<int>();
  final _otp = BehaviorSubject<String>();
  final _countTime = BehaviorSubject<int>();
  final _checkSnk = BehaviorSubject<bool>();

  final _authResponse = PublishSubject<Auth>();

  //Add or Getter data to stream
  //Validator
  Stream<String> get username => _username.stream.transform(validateUsername);
  Stream<String> get usernameReset =>
      _usernameReset.stream.transform(validateUsername);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get cPassword =>
      _cPassword.stream.transform(validateConfirmPassword);
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(validatePhoneNumber);
  Stream<String> get name => _name.stream.transform(validateUsername);
  Stream<String> get email => _email.stream.transform(validateUsername);
  Stream<String> get address => _address.stream.transform(validateUsername);
  Stream<String> get noReferral => _noReferral.stream;
  Stream<int> get currentPageCarouselStream => _currentPageCarousel.stream;
  Stream<String> get otp => _otp.stream.transform(validateOtp);
  Stream<int> get countTime => _countTime.stream;
  Stream<bool> get checkSnk => _checkSnk.stream;

  Stream<bool> get submitValidLogin =>
      Rx.combineLatest2(username, password, (n, p) => true);
  Stream<bool> get submitValid => Rx.combineLatest4(
      username, phoneNumber, password, cPassword, (n, ph, p, c) => true);
  Stream<bool> get submitValidRegister =>
      Rx.combineLatest4(phoneNumber, name, email, address, (p, n, e, a) {
        return true;
      });

  //Request API
  Stream<Auth> get auth => _authResponse.stream;

  //Getter to sinks
  //Validator
  Function(String) get changeusername => _username.sink.add;
  StreamSink<String> get changeUsernameReset => _usernameReset.sink;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _cPassword.sink.add;
  StreamSink<String> get changePhoneNumber => _phoneNumber.sink;
  Function(int) get fetchCurrentPage => _currentPageCarousel.sink.add;
  StreamSink<String> get changeOTP => _otp.sink;
  StreamSink<int> get changeCountTime => _countTime.sink;
  StreamSink<String> get changeName => _name.sink;
  StreamSink<String> get changeEmail => _email.sink;
  StreamSink<String> get changeAddress => _address.sink;
  Function(String) get changeNoReferral => _noReferral.sink.add;
  StreamSink<bool> get changeCheckSnk => _checkSnk.sink;

  int _countDown = 0;
  int get countDown => _countDown;

  dispose() {
    _username.close();
    _usernameReset.close();
    _password.close();
    _cPassword.close();
    _phoneNumber.close();
    _currentPageCarousel.close();
    _otp.close();
    _countTime.close();
    _name.close();
    _email.close();
    _address.close();
    _noReferral.close();
    _checkSnk.close();
  }

  disposeRegister() {
    _phoneNumber.sink.add('');
    _name.sink.add('');
    _email.sink.add('');
    _address.sink.add('');
    _noReferral.sink.add('');
    _checkSnk.sink.add(false);
  }

  Future<void> getToken() async {
    String token = await AuthServices.getToken();
    var result = Auth(accessToken: token);

    if (result.accessToken != "") {
      _authResponse.sink.add(result);
      emit(AuthLoaded(result));
    } else {
      emit(AuthLoadingFailed(result.message));
    }
  }

  Future<void> register(
      bool isDialog, PostData postValue, Auth? response) async {
    var postData = PostData();
    postData.uid = _phoneNumber.value;
    postData.name = _name.value;
    postData.noHp = _phoneNumber.value;
    postData.email = _email.value;
    postData.address = _address.value;
    postData.noHp = _phoneNumber.value;
    postData.referral = _noReferral.value;
    postData.notsType = postValue.notsType;
    if (postValue.mti != null) {
      postData.mti = postValue.mti;
    }
    postData.otp = postValue.otp;
    postData.kota = response?.kota;
    postData.countryId = response?.countryId;
    postData.sendEmail = response?.sendEmail;
    postData.tempatLahir = response?.tempatLahir;
    postData.jenisKelamin = response?.jenisKelamin;
    postData.pekerjaan = response?.pekerjaan;
    postData.kewarganegaraan = response?.kewarganegaraan;
    postData.noId = response?.noId;
    postData.jenisId = response?.jenisId;
    postData.tglBerlakuId = response?.tglBerlakuId;
    postData.cidRef = response?.cidRef;
    postData.dasType = response?.dasType;

    Auth result = await AuthServices.signUp(postData);

    if (result.rc != null) {
      emit(AuthLoaded(result));
    } else {
      emit(AuthLoadingFailed(result.message));
    }
  }

  Future<void> resetPassword(bool isDialog, PostData postValue) async {
    var postData = PostData();
    postData.uid = _usernameReset.value;
    postData.notsType = postValue.notsType;
    if (postValue.mti != null) {
      postData.mti = postValue.mti;
    }
    postData.otp = postValue.otp;

    Auth result = await AuthServices.resetPassword(postData);

    if (result.rc != null) {
      emit(AuthLoaded(result));
    } else {
      emit(AuthLoadingFailed(result.message));
    }
  }

  _setCountDown(int countDown) {
    if (_countDown == countDown) {
      return;
    }
    _countDown = countDown;
    changeCountTime.add(_countDown);
  }

  Future<void> sendVerifyCode(int count) async {
    print('start_timer');
    _countDown = count;
    _counter?.cancel();
    _counter = Stream.periodic(const Duration(seconds: 1))
        .startWith(_countDown)
        .take(_countDown)
        .doOnCancel(() => print("cancel_timer"))
        .listen((onData) {
      _setCountDown(countDown - 1);
    });
  }

  Future<void> loadHtmlFromAssets(String filename, controller) async {
    String fileText = await rootBundle.loadString(filename);
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  Future<void> loadHtmlFromString(String fileText, controller) async {
    controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
