import 'package:flutter/material.dart';
import 'package:bam_ui/theme/bam.colors.dart';
import 'package:bam_ui/theme/bam.constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bam_ui/screen/dashboard/widgets/today_services.dart';
import 'package:shimmer/shimmer.dart';

class Today_Services_Section extends StatelessWidget {
  const Today_Services_Section({super.key});

  @override
  Widget build(BuildContext context) {
    var _height = ResponsiveDimension.screenHeight(context);
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Barang Masuk Hari Ini",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: white_color,
                )),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        height: _height * 0.42,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                ListServices()
              ]),
        ),
      ),
    ]);
  }
}

class SkeletonServices extends StatelessWidget {
  const SkeletonServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primary_color,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            ),
            Container(
              width: 100,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Container(
                  width: 100,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ListServices extends StatelessWidget {
  const ListServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TodayServices(
          noservis: 'SB - 10000',
          jebar: 'Laptop Asus ROG',
          tgl: '12 Juni 2021',
          atn: 'Gusti',
          stat: 'Pending',
        ),
        TodayServices(
          noservis: 'SB - 10001',
          jebar: 'Printer Epson L3110',
          tgl: '12 Juni 2021',
          atn: 'Reksy',
          stat: 'Pending',
        ),
        TodayServices(
          noservis: 'SB - 10002',
          jebar: 'Laptop Acer Nitro 5',
          tgl: '12 Juni 2021',
          atn: 'Oktavianus',
          stat: 'Tunggu Konfirmasi',
        ),
        TodayServices(
          noservis: 'SB - 10003',
          jebar: 'Laptop Lenovo Legion 5',
          tgl: '12 Juni 2021',
          atn: 'Indra',
          stat: 'On Progress',
        ),
        TodayServices(
          noservis: 'SB - 10004',
          jebar: 'Notebook Asus',
          tgl: '12 Juni 2021',
          atn: 'Eko',
          stat: 'On Progress',
        ),
      ],
    );
  }
}

class ListServicesSkeleton extends StatelessWidget {
  const ListServicesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkeletonServices(),
        SkeletonServices(),
        SkeletonServices(),
        SkeletonServices(),
      ],
    );
  }
}
