import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/features/detail_trip/provider/trip_provider.dart';
import 'package:track_mate_app/features/detail_trip/view/widgets/icon_information.dart';

class DetailTrip extends StatefulWidget {
  const DetailTrip({super.key});

  @override
  State<DetailTrip> createState() => _DetailTripState();
}

class _DetailTripState extends State<DetailTrip> {
  @override
  void initState() {
    Provider.of<TripProvider>(context, listen: false).setMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/MtmerbabuA45d.jpg/1280px-MtmerbabuA45d.jpg',
      'https://disk.mediaindonesia.com/thumbs/700x-/news/2022/01/6be305277670df58c6ba529d335916a9.JPG',
      'https://imgcdn.solopos.com/@space/2022/07/ilustrasi-gunung-merbabu.jpg',
      'https://ik.imagekit.io/tvlk/blog/2020/04/Gunung-Merbabu-Wikipedia-1.jpg?tr=dpr-2,w-675',
      'https://images.tokopedia.net/blog-tokopedia-com/uploads/2018/10/merbabu-.jpg',
    ];

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
            child: Consumer<TripProvider>(builder: (context, provider, _) {
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
                        center: provider.routpoints[0],
                        zoom: 13,
                        maxZoom: 18,
                        minZoom: 1,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        PolylineLayer(
                          polylineCulling: false,
                          polylines: [
                            Polyline(
                              points: provider.routpoints,
                              color: Colors.blue,
                              strokeWidth: 5,
                            )
                          ],
                        )
                      ],
                    ),
                    // FlutterMap(
                    //   options: MapOptions(
                    //       center: const LatLng(-7.983908, 112.621391),
                    //       zoom: 10,
                    //       maxZoom: 18),
                    //   nonRotatedChildren: [
                    //     RichAttributionWidget(
                    //       attributions: [
                    //         TextSourceAttribution(
                    //           'OpenStreetMap contributors',
                    //           onTap: () {},
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    //   children: [
                    //     TileLayer(
                    //       urlTemplate:
                    //           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    //       userAgentPackageName: 'com.example.app',
                    //     ),
                    //   ],
                    // )
                    // Image.asset(
                    //   'assets/images/example_maps.png',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              'Gunung Merbabu',
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconInformation(
                            icon: Icons.location_on, text: '400 Km'),
                        SizedBox(
                          width: 10,
                        ),
                        IconInformation(icon: Icons.north, text: '1650 mdpl'),
                        SizedBox(
                          width: 10,
                        ),
                        IconInformation(icon: Icons.south, text: '100 mdpl'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Text(
                  'Gunung Merbabu dengan ketinggian 3.142 mdpl terletak di 3 Kabupaten yaitu Semarang, Boyolali dan Magelang. Gunung Merbabu merupakan gunung api tua yang bersebelahan dengan Gunung Merapi yang merupakan salah satu gunung api aktif. Gunung Merbabu berasal dari kata “Meru” yang berarti gunung dan “Babu” yang berarti wanita. Gunung Merbabu dikenal sebagai gunung tidur meskipun sebenarnya memiliki 5 buah kawah yaitu Kawah Condrodimuko, Kombang, Kendang, Rebab dan Kawah Sambernyowo.',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 24,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 300,
                                child: PageView.builder(
                                  itemCount: imageUrls.length,
                                  controller:
                                      PageController(initialPage: index),
                                  itemBuilder:
                                      (BuildContext context, int pageIndex) {
                                    return Image.network(
                                      imageUrls[pageIndex],
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(Icons.error);
                                      },
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          imageUrls[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
