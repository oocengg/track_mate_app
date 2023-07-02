import 'package:flutter/material.dart';
import 'package:track_mate_app/features/home/view/widgets/motivation_section.dart';
import 'package:track_mate_app/features/trip/view/widgets/journey_bar.dart';
import 'package:track_mate_app/features/trip/view/widgets/page_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageHeader(
                image: '',
                name: 'Ocengg',
              ),
              const SizedBox(height: 24),
              const MotivationSection(
                  salutation: 'Hello! Good Morning.',
                  motivation:
                      'The only thing that will make you happy is being happy with who you are',
                  author: 'Goldie Hawn'),
              const SizedBox(height: 24),
              Text(
                'Latest Trip',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              Text(
                'Trip Information',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.9,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        '1 \n Trip',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0.9,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Let\'s Go For Another Trip!',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
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
