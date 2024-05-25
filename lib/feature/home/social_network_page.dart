import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:hasta_takip/router/show.dart';
import 'package:hasta_takip/ui_kit/style/app_padding.dart';
import 'package:hasta_takip/ui_kit/style/gap.dart';
import 'package:hasta_takip/ui_kit/widget/button/button.dart';
import 'package:path_provider/path_provider.dart';

class SocialNetworkPage extends StatefulWidget {
  const SocialNetworkPage({super.key});

  @override
  SocialNetworkPageState createState() => SocialNetworkPageState();
}

class SocialNetworkPageState extends State<SocialNetworkPage> {
  String pathPDF = "";
  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  final pdfs = [
    AppPdf('b12', 'Vitamin B12 eksikliği'),
    AppPdf('cerrahi', 'Epilepsi Cerrahisi'),
    AppPdf('epilepsi', 'Epilepsi'),
    AppPdf('gebelik', 'Gebelik ve Epilepsi'),
    AppPdf('sendrom', 'Epilepsi ve Pediatrik Epilepsi Sendromları'),
    AppPdf('yasli', 'Yaşlılarda Epilepsi')
  ];

  @override
  void initState() {
    super.initState();
    // fromAsset('assets/pdf/b12.pdf', 'b12.pdf').then((f) {
    //   setState(() {
    //     corruptedPathPDF = f.path;
    //   });
    // });
    // fromAsset('assets/pdf/cerrahi.pdf', 'cerrahi.pdf').then((f) {
    //   setState(() {
    //     pathPDF = f.path;
    //   });
    // });

    createFileOfPdfUrl().then((f) {
      setState(() {
        remotePDFpath = f.path;
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    Completer<File> completer = Completer();
    print("Start download file from internet!");
    try {
      // "https://berlin2017.droidcon.cod.newthinking.net/sites/global.droidcon.cod.newthinking.net/files/media/documents/Flutter%20-%2060FPS%20UI%20of%20the%20future%20%20-%20DroidconDE%2017.pdf";
      // final url = "https://pdfkit.org/docs/guide.pdf";
      const url = "http://www.pdf995.com/samples/pdf.pdf";
      final filename = url.substring(url.lastIndexOf("/") + 1);
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      print("Download files");
      print("${dir.path}/$filename");
      File file = File("${dir.path}/$filename");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter PDF View',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Epilepsi Blog'),
        ),
        body: Center(child: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: AppPadding.defaultColumnPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const AddArticle(title: 'Yazı Ekle'),
                  const AddArticle(title: 'Makale Yükle'),

                  ...List.generate(
                    pdfs.length,
                    (index) => Card(
                      child: TextButton(
                        child: Text(pdfs[index].title),
                        onPressed: () async {
                          await fromAsset('assets/pdf/${pdfs[index].file}.pdf',
                                  '${pdfs[index].file}.pdf')
                              .then((f) {
                            setState(() {
                              pathPDF = f.path;
                            });
                          });
                          if (!context.mounted) return;
                          if (pathPDF.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PDFScreen(
                                    path: pathPDF, title: pdfs[index].title),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  )

                  // TextButton(
                  //   child: const Text("Open Landscape PDF"),
                  //   onPressed: () {
                  //     if (landscapePathPdf.isNotEmpty) {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               PDFScreen(path: landscapePathPdf),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  // TextButton(
                  //   child: const Text("Remote PDF"),
                  //   onPressed: () {
                  //     if (remotePDFpath.isNotEmpty) {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => PDFScreen(path: remotePDFpath),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  // TextButton(
                  //   child: const Text("Open Corrupted PDF"),
                  //   onPressed: () {
                  //     if (pathPDF.isNotEmpty) {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) =>
                  //               PDFScreen(path: corruptedPathPDF),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // )
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;
  final String? title;

  const PDFScreen({Key? key, this.path, this.title}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Document'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: Text("Go to ${pages! ~/ 2}"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}

class AppPdf {
  final String file;
  final String title;

  AppPdf(this.file, this.title);
}

class AddArticle extends StatelessWidget {
  const AddArticle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button.filledIcon(
            onPressed: () {
              Show.modal(
                  context,
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: const Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 40),
                              Text('Makale Yükleme Alanı'),
                            ],
                          )),
                        ),
                        const SizedBox(height: 150)
                      ],
                    ),
                  ));
            },
            title: title,
            icon: const Icon(Icons.add)),
        Gap.verSM,
      ],
    );
  }
}
