import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MotivationSection extends StatelessWidget {
  final String salutation, motivation, author;

  const MotivationSection({
    Key? key,
    required this.salutation,
    required this.motivation,
    required this.author,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0.9,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            salutation,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            '"$motivation"',
            style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            author,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    );
  }
}
