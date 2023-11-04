import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;
  const PdfViewerPage({
    super.key,
    required this.pdfUrl,
  });

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _pdfViewerController = PdfViewerController();
    _pdfViewerController.addListener(_pdfControllerListener);
  }

  @override
  void dispose() {
    super.dispose();
    _pdfViewerController.dispose();
  }

  void _pdfControllerListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 24,
            ),
          ),
        ),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: AppFontStyle.captionMediumOffBlack(context),
            children: <TextSpan>[
              TextSpan(
                text: _pdfViewerController.pageNumber.toString(),
                style: AppFontStyle.captionMediumPrimary,
              ),
              TextSpan(
                text: ' of ${_pdfViewerController.pageCount.toString()} pages',
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _pdfViewerStateKey.currentState!.openBookmarkView();
                  },
                  icon: const Icon(
                    Icons.bookmark_rounded,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download_rounded,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfPdfViewer.network(
              widget.pdfUrl,
              pageLayoutMode: PdfPageLayoutMode.single,
              controller: _pdfViewerController,
              key: _pdfViewerStateKey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _pdfViewerController.previousPage();
                  },
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    side: const BorderSide(
                      color: AppColor.primaryColor,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: AppFontStyle.bodyNavTextOffBlack(context),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    _pdfViewerController.nextPage();
                  },
                  elevation: 0,
                  color: AppColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  highlightElevation: 0,
                  child: const Text(
                    'Next',
                    style: AppFontStyle.bodyNavTextPureWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
