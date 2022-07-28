part of 'pages.dart';

class SnkPage extends StatefulWidget {
  @override
  _SnkPageState createState() => _SnkPageState();
}

class _SnkPageState extends State<SnkPage> implements RequestDelegate {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  WebViewController? _controller;

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
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthCubit>(context);
    final mq = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottomOpacity: 0.0,
        elevation: 0.5,
        title: Text('Syarat dan Ketentuan', style: whiteFontStyle),
        backgroundColor: mainColor,
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: WebView(
            onWebViewCreated: (WebViewController webViewController) async {
              _controller = webViewController;
              await bloc.loadHtmlFromAssets(
                  'assets/masagoeula.html', _controller);
            },
          ),
        ),
      ),
    );
  }
}
