import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/theme_mode_provider.dart';

import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../widgets/custom_separator.dart';

class CourseCertificatePage extends StatefulWidget {
  final String courseTitle;
  final String instructorName;
  const CourseCertificatePage({
    super.key,
    required this.courseTitle,
    required this.instructorName,
  });

  @override
  State<CourseCertificatePage> createState() => _CourseCertificatePageState();
}

class _CourseCertificatePageState extends State<CourseCertificatePage> {
  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String certificateName = "";
  String certificateDate = "";
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate =
        "${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}";
    certificateDate = formattedDate;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    certificateName = authProvider.userModel.name;
    final themeModeProvider =
        Provider.of<ThemeModeProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: "Course Certificate",
        onBackButtonPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 40,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themeModeProvider.themeMode == ThemeMode.light
                        ? AppColor.greyColor
                        : AppColor.darkGreyLight2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomSeparator(
                          height: 30,
                          width: 0,
                        ),
                        Text(
                          "CERTIFICATE OF COMPLETION",
                          style: AppFontStyle.subtitleOffBlack(context),
                        ),
                        const CustomSeparator(
                          height: 12,
                          width: 0,
                        ),
                        Text(
                          widget.courseTitle,
                          style: AppFontStyle.headerOffBlack(context),
                        ),
                        const CustomSeparator(
                          height: 4,
                          width: 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Instructor:',
                              style: AppFontStyle.bodyOffBlack(context),
                            ),
                            const CustomSeparator(
                              width: 4,
                              height: 0,
                            ),
                            Text(
                              widget.instructorName,
                              style:
                                  AppFontStyle.captionMediumOffBlack(context),
                            ),
                          ],
                        ),
                        Center(
                          child: Image.asset(
                            "assets/images/certificate_illustration.png",
                            width: 160,
                            height: 160,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  authProvider.userModel.name,
                                  style: AppFontStyle.subtitleOffBlack(context),
                                ),
                                const CustomSeparator(
                                  height: 4,
                                  width: 0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Date:',
                                      style: AppFontStyle.bodyOffBlack(context),
                                    ),
                                    const CustomSeparator(
                                      width: 4,
                                      height: 0,
                                    ),
                                    Text(
                                      formattedDate,
                                      style: AppFontStyle.captionMediumOffBlack(
                                          context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SvgPicture.asset(
                              "assets/images/app_logo.svg",
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        const CustomSeparator(
                          height: 20,
                          width: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const CustomSeparator(
                height: 20,
                width: 0,
              ),
              CustomFilledButton(
                onPressed: () {
                  printDoc();
                },
                text: "Save as PDF",
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> printDoc() async {
    final certificateIllustration = await imageFromAssetBundle(
      "assets/images/certificate_illustration.png",
    );
    final appLogo = await imageFromAssetBundle(
      "assets/images/app_logo.png",
    );
    final doc = pw.Document();
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildCertificate(certificateIllustration, appLogo);
        }));
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
  }

  buildCertificate(certificateIllustration, appLogo) => pw.Padding(
        padding: const pw.EdgeInsets.only(left: 12, right: 12),
        child: pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.SizedBox(
              height: 30,
              width: 0,
            ),
            pw.Text(
              "CERTIFICATE OF COMPLETION",
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
            pw.SizedBox(
              height: 12,
              width: 0,
            ),
            pw.Text(
              widget.courseTitle,
              style: pw.TextStyle(
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
                height: 1.45,
              ),
            ),
            pw.SizedBox(
              height: 8,
              width: 0,
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(
                  'Instructor:',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.normal,
                    height: 1.8,
                  ),
                ),
                pw.SizedBox(
                  height: 0,
                  width: 4,
                ),
                pw.Text(
                  widget.instructorName,
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              ],
            ),
            pw.Center(
              child: pw.Image(
                certificateIllustration,
                width: 160,
                height: 160,
                fit: pw.BoxFit.cover,
              ),
            ),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.Text(
                      certificateName,
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(
                      height: 8,
                      width: 0,
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Date:',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.normal,
                            height: 1.8,
                          ),
                        ),
                        pw.SizedBox(
                          height: 0,
                          width: 4,
                        ),
                        pw.Text(
                          certificateDate,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                pw.Image(
                  appLogo,
                  height: 90,
                  width: 90,
                  fit: pw.BoxFit.cover,
                ),
              ],
            ),
            pw.SizedBox(
              height: 30,
              width: 0,
            ),
          ],
        ),
      );
}
