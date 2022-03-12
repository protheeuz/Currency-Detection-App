import 'package:bitdroid_clear/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmotionDetection extends StatefulWidget {
  const EmotionDetection({Key key}) : super(key: key);

  @override
  _EmotionDetectionState createState() => _EmotionDetectionState();
}

class _EmotionDetectionState extends AuthState<EmotionDetection>
    with SingleTickerProviderStateMixin {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          width: double.maxFinite,
          height: 100,
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
                  Navigator.pop(context);
                },
                child: Icon(
                  MdiIcons.fromString('''keyboard-backspace'''),
                  size: 32,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 50,
                    ),
                    child: Text('''Pendeteksi Emosional''',
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [],
      ),
    );
  }
}
