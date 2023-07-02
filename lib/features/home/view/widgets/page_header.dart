import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeader extends StatelessWidget {
  final String image, name;

  const PageHeader({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
              name != ''
                  ? Text(
                      name,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                    )
                  : Text(
                      'No Name',
                      style: GoogleFonts.poppins(
                        textStyle:
                            Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 30,
          backgroundImage: image != ''
              ? NetworkImage(image)
              : null, // Set backgroundImage ke null jika image null
          backgroundColor: image == '' ? Colors.grey : null,
        ),
      ],
    );
  }
}
