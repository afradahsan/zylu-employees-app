import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;
    return Container(
        color: Colors.white,
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(5),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              offset += 5;
              time = 800 + offset;
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Shimmer.fromColors(
                    highlightColor: Colors.white,
                    baseColor: Colors.grey[500]!,
                    period: Duration(milliseconds: time),
                    child: Container(
                      margin: const EdgeInsets.only(right: 0),
                      height: 80,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ));
            },
          ),
        ));
  }
}
