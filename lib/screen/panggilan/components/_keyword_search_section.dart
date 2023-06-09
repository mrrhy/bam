import 'package:flutter/material.dart';
import 'package:bam_ui/theme/bam.colors.dart';
import 'package:bam_ui/theme/bam.constant.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:bam_ui/screen/panggilan/widgets/list_calls.dart';

class CallsSearch_Section extends StatelessWidget {
  const CallsSearch_Section({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = ResponsiveDimension.screenHeight(context);
    return Column(children: [
      Container(
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '"Key word Search"',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: white_color,
                    ),
                  ),
                  Text(
                    'Servisan - Nama Barang',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: white_color,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 1),
                      decoration: BoxDecoration(
                        color: primary_color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          icon: Icon(
                            Icons.clear_all_rounded,
                            color: white_color,
                          ),
                          color: white_color,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () => {}),
                    ),
                    ],
                ),
              ))
        ]),
      ),
      Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: _height * 0.788,
        child: SingleChildScrollView(
          child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              
            ]),
          ),
        ),
    ]);
  }
}
