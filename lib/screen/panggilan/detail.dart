import 'package:bam_ui/theme/bam.colors.dart';
import 'package:bam_ui/theme/bam.constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:bam_ui/model/env.dart';
import 'package:bam_ui/model/detail.panggilan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailPanggilanScreen extends StatefulWidget {
  const DetailPanggilanScreen({super.key});

  @override
  State<DetailPanggilanScreen> createState() => _DetailPanggilanScreenState();
}

class _DetailPanggilanScreenState extends State<DetailPanggilanScreen> {
  @override
  Widget build(BuildContext context) {
    final arg_id_pgl = ModalRoute.of(context)!.settings.arguments;

    Future<List<Panggilan>> fetchData() async {
      final response = await http.get(
        Uri.parse(Env.API_URL +
            'panggilan/single?id_pgl=' +
            arg_id_pgl.toString()),
      );

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((job) => Panggilan.fromJson(job)).toList();
      } else {
        throw Exception('Failed to load jobs from API');
      }
    }

    var _width = ResponsiveDimension.screenWidth(context);
    var _height = ResponsiveDimension.screenHeight(context);
    return Scaffold(
        backgroundColor: black_color,
        body: Container(
            width: _width,
            height: _height,
            padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 60),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                          Icons.arrow_back,
                                          color: white_color,
                                        ),
                                        color: white_color,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () => {
                                              Navigator.pop(context),
                                            }),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Detail Panggilan',
                                  style: GoogleFonts.lato(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: white_color,
                                  ),
                                ),
                                Text(
                                  'Data Detail Panggilan',
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
                            flex: 1,
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
                                          Icons.edit,
                                          color: white_color,
                                        ),
                                        color: white_color,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onPressed: () => {
                                              Navigator.pushNamed(
                                                  context, '/panggilan/update'),
                                            }),
                                  ),
                                ],
                              ),
                            )),
                      ]),
                ),
                Container(
                    height: _height - 200,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(children: [
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Lokasi",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Lokasi",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Keluhan",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Keluhan",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Teknisi",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Teknisi",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Keterangan",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Keterangan",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Panggilan Dibuat",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Panggilan Dibuat",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(children: [
                            TextFormField(
                              enabled: false,
                              initialValue: "Selesai",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: white_color),
                              autofocus: false,
                              decoration: InputDecoration(
                                hoverColor: Colors.transparent,
                                label: Text(
                                  "Selesai",
                                  style: GoogleFonts.lato(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: white_color),
                                ),
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ]),
                    )),
              ],
            )));
  }
}
