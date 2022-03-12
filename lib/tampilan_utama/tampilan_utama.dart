import 'package:bitdroid_clear/curency_detection/curency_detection.dart';
import 'package:bitdroid_clear/emotion_detection/emotion_detection.dart';
import 'package:bitdroid_clear/entry_point/entry_point.dart';
import 'package:flutter/material.dart';
import 'package:bitdroid_clear/auth/auth_state.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:auth_buttons/auth_buttons.dart';

class TampilanUtama extends StatefulWidget {
  const TampilanUtama({Key key}) : super(key: key);

  @override
  _TampilanUtamaState createState() => _TampilanUtamaState();
}

class _TampilanUtamaState extends AuthState<TampilanUtama>
    with SingleTickerProviderStateMixin {
  String search = '0';

  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: FutureBuilder(
            future: Supabase.instance.client
                .from('''user''')
                .select('''name,profile_image''')
                .order('''name''')
                .range((1 * 0) - 1, 1 * 15)
                .execute(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              final doc = snapshot.data as PostgrestResponse;
              if (doc == null) return const SizedBox();

              final datasets = this.datasets;
              datasets['Supabase Query'] = doc.data as List<dynamic>;
              const index = 0;

              return Container(
                margin: const EdgeInsets.only(),
                padding: const EdgeInsets.only(
                  left: 24,
                  top: 35,
                  right: 24,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: const Color(0xFF7F4BD3),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (!Scaffold.of(context).isDrawerOpen) {
                          Scaffold.of(context).openDrawer();
                        }
                      },
                      child: Icon(
                        MdiIcons.fromString('''drag'''),
                        size: 32,
                        color: Color(0xFFFBFBFB),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: Text('''Guest''',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                  fontStyle: FontStyle.normal,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 1),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(48),
                              topRight: Radius.circular(48),
                              bottomRight: Radius.circular(48),
                              bottomLeft: Radius.circular(48),
                            ),
                            child: Image.network(
                              '''https://image.flaticon.com/icons/png/512/1160/1160040.png''',
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      backgroundColor: const Color(0xFF000000),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SafeArea(
            left: true,
            top: false,
            right: false,
            bottom: true,
            child: Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 10.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFEFCFF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 16,
                      right: 24,
                    ),
                    child: Text('''Search''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 16,
                    ),
                    child: Text('''Apa yang ingin kamu cari?''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 70,
                      bottom: 5,
                    ),
                    child: Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      width: MediaQuery.of(context).size.width * (100 / 100),
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDEDEDE),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: FutureBuilder(
                            future: Supabase.instance.client
                                .from('''program''')
                                .select('''nama_program''')
                                .order('''name''')
                                .range((1 * 0) - 1, 1 * 15)
                                .execute(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CircularProgressIndicator();
                              }
                              final doc = snapshot.data as PostgrestResponse;
                              if (doc == null) return const SizedBox();
                              final datasets = this.datasets;
                              datasets['Supabase Query'] =
                                  doc.data as List<dynamic>;
                              const index = 0;

                              return Row(
                                children: [
                                  Icon(
                                    MdiIcons.fromString('''card-search'''),
                                    size: 15,
                                    color: Color(0xFFC9C8C8),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        left: 5,
                                        bottom: 5,
                                      ),
                                      width: 210,
                                      decoration: const BoxDecoration(),
                                      child: TextField(
                                        onChanged: (String value) async {
                                          setState(() {
                                            search = '''null''';
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Cari disini",
                                          contentPadding: EdgeInsets.only(
                                            left: 16,
                                          ),
                                        ),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            color: const Color(0xFFFFFFFF),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            fontStyle: FontStyle.normal,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        textAlign: TextAlign.left,
                                        maxLines: 1,
                                        minLines: 1,
                                        maxLength: null,
                                        obscureText: false,
                                        showCursor: true,
                                        autocorrect: false,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      bottom: 10,
                    ),
                    child: Text('''Pilihan Program''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (100 / 100),
                    height: 170,
                    child: SafeArea(
                      left: false,
                      top: false,
                      right: false,
                      bottom: false,
                      child: ListView(
                        primary: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                            ),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: 120,
                              height: MediaQuery.of(context).size.height *
                                  (100 / 100),
                              decoration: BoxDecoration(
                                color: const Color(0xFF7F4BD3),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await Navigator.push<void>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                CurencyDetection(),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        MdiIcons.fromString('''currency-usd'''),
                                        size: 32,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                  Text('''Mata Uang''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                  Text('''Detector''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                            ),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: 120,
                              height: MediaQuery.of(context).size.height *
                                  (100 / 100),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD97373),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await Navigator.push<void>(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EmotionDetection(),
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        MdiIcons.fromString(
                                            '''baby-face-outline'''),
                                        size: 32,
                                        color: Color(0xFFFEFEFE),
                                      ),
                                    ),
                                  ),
                                  Text('''Kondisi Emosi''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                  Text('''Detector''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                            ),
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              width: 120,
                              height: MediaQuery.of(context).size.height *
                                  (100 / 100),
                              decoration: BoxDecoration(
                                color: const Color(0xFFBC823D),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 16,
                                    ),
                                    child: Icon(
                                      MdiIcons.fromString(
                                          '''hand-front-left-outline'''),
                                      size: 32,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                                  Text('''Pengenalan Tangan''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1),
                                  Text('''Detector''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text('''Segera Tersedia''',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 1),
                  ),
                  SafeArea(
                    left: false,
                    top: false,
                    right: false,
                    bottom: false,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 39.47 / 100,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7F4BD3),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('''Available Soon''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('''Nama''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                  Container(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    width: 120,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF84C8ED),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('''Jenis Program''',
                                          style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                              color: const Color(0xFFFFFFFF),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              fontStyle: FontStyle.normal,
                                              decoration: TextDecoration.none,
                                            ),
                                          ),
                                          textAlign: TextAlign.center,
                                          maxLines: 1),
                                    ),
                                  ),
                                  Text('''Fungsi''',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          color: const Color(0xFFFEFEFE),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 1),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 60,
                                  top: 0,
                                  right: 60,
                                ),
                                child: Expanded(
                                  child: Lottie.network(
                                    '''https://assets2.lottiefiles.com/packages/lf20_ubd7utcf.json''',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
