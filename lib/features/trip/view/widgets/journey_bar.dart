import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_mate_app/features/detail_trip/view/detail_route.dart';

class JourneyBar extends StatelessWidget {
  final String title, desc;

  const JourneyBar({
    Key? key,
    required this.title,
    required this.desc,
    // required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.9,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          InkWell(
            onTap: () {
              if (context.mounted) {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const DetailTrip(),
                  ),
                );
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20.0), // Membuat tepi bulat
                  child: Image.asset(
                    'assets/images/example_maps.png',
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 25,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          desc,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            child: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
