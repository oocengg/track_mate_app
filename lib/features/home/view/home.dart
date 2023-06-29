import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
      backgroundColor: const Color(0xFF16462B),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Image.asset(
                    'assets/images/example_maps.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Gunung Merbabu ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '- Indonesia',
                              style: TextStyle(
                                color: Color(0xFF6C748B),
                                fontSize: 18,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Color(0xFF6C748B),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Color(0xFF6C748B),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('400 Km'),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.north,
                            color: Color(0xFF6C748B),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('1650 mdpl'),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.south,
                            color: Color(0xFF6C748B),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('100 mdpl'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Gunung Merbabu dengan ketinggian 3.142 mdpl terletak di 3 Kabupaten yaitu Semarang, Boyolali dan Magelang. Gunung Merbabu merupakan gunung api tua yang bersebelahan dengan Gunung Merapi yang merupakan salah satu gunung api aktif. Gunung Merbabu berasal dari kata “Meru” yang berarti gunung dan “Babu” yang berarti wanita. Gunung Merbabu dikenal sebagai gunung tidur meskipun sebenarnya memiliki 5 buah kawah yaitu Kawah Condrodimuko, Kombang, Kendang, Rebab dan Kawah Sambernyowo.',
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3, // Jumlah kolom
                childAspectRatio: 1.0, // Membuat ukuran kotak menjadi persegi
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(imageUrls.length, (index) {
                  return GridTile(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(10.0), // Membuat tepi bulat
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
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
