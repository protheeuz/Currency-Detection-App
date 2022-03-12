import 'package:bitdroid_clear/beranda/beranda.dart';
import 'package:flutter/material.dart';
import 'package:bitdroid_clear/auth/auth_state.dart';
import 'package:google_fonts/google_fonts.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key key}) : super(key: key);

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends AuthState<EntryPoint>
    with SingleTickerProviderStateMixin {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Color(0xFF7F4BD3),
            ),
            child: SafeArea(
              left: false,
              top: false,
              right: false,
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 300,
                        bottom: 30,
                      ),
                      child: Image.network(
                        '''https://qmljnsmunjzqnbrzpvbh.supabase.co/storage/v1/object/public/public/test/assets/Untitled_design-removebg-preview (1).png''',
                        width: double.maxFinite,
                        height: 150,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: GestureDetector(
                          onTap: () async {
                            await Navigator.push<void>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Beranda(),
                              ),
                            );
                          },
                          child: Container(
                              width: 250,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFF000000),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                '''Selamat datang di bitDroid.AI''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // BottomBar
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Align(
                child: Text('''ⓒ Developed by bitDroid Teams''',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: const Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1),
              )),
        ],
      ),
    );
  }
}
