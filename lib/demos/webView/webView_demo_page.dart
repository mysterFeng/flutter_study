import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewDemoPage extends StatefulWidget {
  const WebViewDemoPage();

  // final String url;
  // final String title;

  @override
  _WebViewDemoPageState createState() => _WebViewDemoPageState();
}

class _WebViewDemoPageState extends State<WebViewDemoPage> {
  final GlobalKey webViewKey = GlobalKey();
String htmlContent = "";

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    /// android 支持HybridComposition
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );




  Future fetchHtmlContent() async {
    // 模拟从后台获取 HTML 内容的异步操作
   await  Future.delayed(Duration(seconds: 2),(){
      htmlContent = '''
           <h1 style="text-align: start;"><strong>脱发，是挂“头发科”吗？</strong></h1>
       <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
         <h1 style="text-align: start;"><strong>脱发，是挂“头发科”吗？</strong></h1>
       <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
         <h1 style="text-align: start;"><strong>脱发，是挂“头发科”吗？</strong></h1>
       <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
            <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
            <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
            <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
            <h1 style="text-align: start;"></h1>
       <p style="text-align: justify;">简单来说，就是因为——</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><strong>头发，是从头皮上长出来的。头皮也是“皮”，是皮肤的一部分。</strong></p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">皮肤由表皮、真皮和皮下组织构成，并含有附属器官<span style="color: rgba(83, 100, 100, 0.79);">（汗腺、皮脂腺、指趾甲、毛发）</span>。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;"><span style="color: rgb(38, 67, 215);"><em><strong>毛发，就属于皮肤的附属器官。</strong></em></span></p>
       <p style="text-align: justify;">因此，头皮像是头发的土壤，头发就是土壤上长出的“庄稼”。</p>
       <p style="text-align: justify;"><br></p>
       <p style="text-align: justify;">这块�
       ''';

  
     }); // 模拟网络请求延迟
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHtmlContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sssss"),
      ),
      body: FutureBuilder<void>(
        future: fetchHtmlContent(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return InAppWebView(
              key: webViewKey,
              initialData: InAppWebViewInitialData(data: htmlContent),
              initialOptions: options,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
    );
  }
}