import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/features/trip/provider/detail_trip_provider.dart';
import 'package:track_mate_app/features/trip/view/widgets/icon_information.dart';

class DetailTrip extends StatefulWidget {
  final int index;
  const DetailTrip({super.key, required this.index});

  @override
  State<DetailTrip> createState() => _DetailTripState();
}

class _DetailTripState extends State<DetailTrip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: FloatingActionButton.small(
          heroTag: "backDetailScreen",
          elevation: 0,
          backgroundColor: Colors.black12,
          highlightElevation: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const CircleBorder(),
          disabledElevation: 0,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.chevron_left,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Consumer<DetailTripProvider>(
              builder: (context, provider, _) {
                print(provider.dataList[widget.index].image.toString());
                return Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.7,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(45.5231, -122.6765),
                          zoom: 10,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          ),
                          PolylineLayer(
                            polylines:
                                provider.dataList[widget.index].polylines,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * 0.7,
                    //   decoration: ShapeDecoration(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   child: FlutterMap(
                    //     options: MapOptions(
                    //       center: provider.routpoints[0],
                    //       zoom: 13,
                    //       maxZoom: 18,
                    //       minZoom: 1,
                    //     ),
                    //     children: [
                    //       TileLayer(
                    //         urlTemplate:
                    //             'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //         userAgentPackageName: 'com.example.app',
                    //       ),
                    //       PolylineLayer(
                    //         polylineCulling: false,
                    //         polylines: [
                    //           Polyline(
                    //             points: provider.routpoints,
                    //             color: Colors.blue,
                    //             strokeWidth: 5,
                    //           )
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    //   // FlutterMap(
                    //   //   options: MapOptions(
                    //   //       center: const LatLng(-7.983908, 112.621391),
                    //   //       zoom: 10,
                    //   //       maxZoom: 18),
                    //   //   nonRotatedChildren: [
                    //   //     RichAttributionWidget(
                    //   //       attributions: [
                    //   //         TextSourceAttribution(
                    //   //           'OpenStreetMap contributors',
                    //   //           onTap: () {},
                    //   //         ),
                    //   //       ],
                    //   //     ),
                    //   //   ],
                    //   //   children: [
                    //   //     TileLayer(
                    //   //       urlTemplate:
                    //   //           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //   //       userAgentPackageName: 'com.example.app',
                    //   //     ),
                    //   //   ],
                    //   // )
                    //   // Image.asset(
                    //   //   'assets/images/example_maps.png',
                    //   //   fit: BoxFit.cover,
                    //   // ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                provider.dataList[widget.index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                minFontSize: 14,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconInformation(
                            icon: Icons.location_on,
                            text: provider.dataList[widget.index].panjangTrack,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconInformation(
                              icon: Icons.north,
                              text: provider
                                  .dataList[widget.index].ketinggianAkhir),
                          const SizedBox(
                            width: 10,
                          ),
                          IconInformation(
                              icon: Icons.south,
                              text: provider
                                  .dataList[widget.index].ketinggianAwal),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                );
              },
            ),
          ),
          Consumer<DetailTripProvider>(builder: (context, provider, _) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    provider.dataList[widget.index].deskripsi,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // provider.dataList[widget.index].image == []
                  //     ? const SizedBox.shrink()
                  //     :
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: provider.dataList[widget.index].image.length,
                    itemBuilder: (context, index) {
                      final xFile =
                          provider.dataList[widget.index].image[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(xFile.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
