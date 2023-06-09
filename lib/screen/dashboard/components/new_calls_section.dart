import 'package:flutter/material.dart';
import 'package:bam_ui/theme/bam.colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bam_ui/screen/dashboard/widgets/new_calls.dart';
import 'package:shimmer/shimmer.dart';

class New_Calls_Section extends StatelessWidget {
  const New_Calls_Section({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Panggilan Terbaru",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: white_color,
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 17),
            ),
            Container(
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ListCalls(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

class SkeletonCalls extends StatelessWidget {
  const SkeletonCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      height: 200,
      child: Shimmer.fromColors(
        baseColor: grey_color,
        highlightColor: white_color,
        child: Container(
          width: 194,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 150,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 13)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListCalls extends StatelessWidget {
  const ListCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NewCalls(
            lokasi: 'Cucian Mobil Sepinggan Pratama',
            teknisi: 'Ivan',
            status: 'Pending'),
        NewCalls(
          lokasi: 'Grace Technic',
          teknisi: 'Hadi',
          status: 'On The Way',
        ),
        NewCalls(
          lokasi: 'Toko Amin',
          teknisi: 'Dayat',
          status: 'Pending',
        ),
        NewCalls(
          lokasi: 'BSI Klandasan',
          teknisi: 'Hadi',
          status: 'Selesai',
        ),
      ],
    );
  }
}

class ListCallsSkeleton extends StatelessWidget {
  const ListCallsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkeletonCalls(),
        SkeletonCalls(),
        SkeletonCalls(),
        SkeletonCalls(),
      ],
    );
  }
}
