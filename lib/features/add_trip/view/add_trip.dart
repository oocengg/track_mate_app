import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/core/constants/list_daerah.dart';
import 'package:track_mate_app/core/constants/list_level.dart';
import 'package:track_mate_app/features/add_trip/provider/add_trip_provider.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({super.key});

  @override
  State<AddTrip> createState() => _AddTripState();
}

class _AddTripState extends State<AddTrip> {
  List<XFile> imagesFromPhone = [];

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Add Your Trip',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {
            context.read<AddTripProvider>().refresh();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: keyboardIsOpened
          ? const SizedBox.shrink()
          : Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: 20,
                right: 20,
              ),
              child: Consumer<AddTripProvider>(
                builder: (context, provider, _) {
                  return ElevatedButton(
                    onPressed: () {
                      if (provider.formKey.currentState!.validate()) {
                        provider.refresh();
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: ListTile(
                              title: Text(
                                'Sukses menambahkan trip.',
                                style: TextStyle(color: Colors.white),
                              ),
                              leading: Icon(
                                Icons.done,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors
                                .green, // Ubah warna latar belakang sesuai kebutuhan
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      backgroundColor: Colors.green,
                      minimumSize: const Size(double.infinity, 0),
                      elevation: 0,
                    ),
                    child: Text(
                      'Simpan Trip',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  );
                },
              ),
            ),
      body: Consumer<AddTripProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Form(
              key: provider.formKey,
              child: ListView(
                children: [
                  Text(
                    'Isi form berikut untuk melengkapi informasi trip terbaru kamu!',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Colors.grey.shade800,
                          fontSize: 15,
                        ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Input Titik Awal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Buat Rute',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await provider.openLocationPickerDialog(context);
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5.0),
                            Text('Pilih Lokasi'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 300.0,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: FlutterMap(
                      options: MapOptions(
                        center: const LatLng(45.5231, -122.6765),
                        zoom: 10,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                        PolylineLayer(polylines: provider.polyLines),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Divider(),

                  const SizedBox(
                    height: 20,
                  ),

                  // Input Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Track',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: provider.titleController,
                        decoration: const InputDecoration(
                          labelText: 'Judul',
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (value) =>
                            provider.validateInputValue(value!),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  // Input Track Informastion
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Panjang \nTrack',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: provider.panjangTrackController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  provider.validateInputValueAngka(value!),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ketinggan \nAwal',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: provider.ketinggianAwalController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  provider.validateInputValueAngka(value!),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ketinggan \nAkhir',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: provider.ketinggianAkhirController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              validator: (value) =>
                                  provider.validateInputValueAngka(value!),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            labelText: 'Daerah',
                          ),
                          value: provider.selectedDaerah,
                          items: ListDaerah.daftarDaerah
                              .map(
                                (String daerah) => DropdownMenuItem<String>(
                                  value: daerah,
                                  child: Text(daerah),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            provider.daerahController.text = value!;
                            // setState(() {
                            //   selectedDaerah = value;
                            // });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih Daerah';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 10), // Jarak antara dua dropdown
                      Expanded(
                        flex: 1,
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            labelText: 'Level',
                          ),
                          value: provider.selectedLevel,
                          items: ListLevel.daftarLevel
                              .map(
                                (String level) => DropdownMenuItem<String>(
                                  value: level,
                                  child: Text(level),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            provider.levelController.text = value!;
                            // setState(() {
                            //   selectedLevel = value;
                            // });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Pilih level';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),

                  const SizedBox(
                    height: 20,
                  ),

                  // Input Deskripsi
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi Track',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: provider.deskripsiController,
                        decoration: const InputDecoration(
                            hintText: 'Input Deskripsi',
                            hintStyle: TextStyle(fontSize: 14)),
                        maxLines: 4,
                        maxLength: 1000,
                        textInputAction: TextInputAction.done,
                        validator: (value) =>
                            provider.validateInputValue(value!),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () async {
                            imagesFromPhone =
                                await ImagePicker().pickMultiImage();

                            if (imagesFromPhone.isNotEmpty) {
                              // provider.addListImage(imagesFromPhone);
                            }
                          },
                          child: Text(
                            'Tambahkan Galeri Trip',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '|',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.white),
                            ),
                            TextButton(
                              onPressed: () async {
                                final pickedFileCamera = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (pickedFileCamera != null) {
                                  // provider.addImage(pickedFileCamera);
                                }
                              },
                              child: const Icon(
                                Icons.camera,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  // Consumer<AddProgressProvider>(
                  //   builder: (context, provider, _) {
                  //     return GridView.builder(
                  //       shrinkWrap: true,
                  //       physics: const NeverScrollableScrollPhysics(),
                  //       gridDelegate:
                  //           const SliverGridDelegateWithFixedCrossAxisCount(
                  //         crossAxisCount: 3,
                  //         crossAxisSpacing: 10,
                  //         mainAxisSpacing: 10,
                  //       ),
                  //       itemCount: provider.image.length,
                  //       itemBuilder: (context, index) {
                  //         final image = provider.image[index];
                  //         return Stack(
                  //           children: [
                  //             ClipRRect(
                  //               borderRadius: BorderRadius.circular(10),
                  //               child: Image.file(
                  //                 width: 100,
                  //                 height: 100,
                  //                 File(image.path),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //             ),
                  //             Positioned(
                  //               top: 8,
                  //               right: 20,
                  //               child: GestureDetector(
                  //                 onTap: () {
                  //                   provider.removeImage(index);
                  //                 },
                  //                 child: Container(
                  //                   decoration: const BoxDecoration(
                  //                     color: Colors
                  //                         .black12, // Ganti dengan warna latar belakang yang diinginkan
                  //                     shape: BoxShape.circle,
                  //                   ),
                  //                   child: const Padding(
                  //                     padding: EdgeInsets.all(2.0),
                  //                     child: Icon(
                  //                       Icons.close,
                  //                       color: Colors.white,
                  //                       size: 20,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

                 // Input Titik Awal
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Pilih Titik Awal',
                  //       style:
                  //           Theme.of(context).textTheme.headlineSmall!.copyWith(
                  //                 color: Colors.black,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () async {
                  //         await provider.openLocationPickerDialog(context);
                  //       },
                  //       child: const Row(
                  //         children: [
                  //           Icon(Icons.location_on_outlined),
                  //           SizedBox(width: 5.0),
                  //           Text('Pilih Lokasi'),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Latitude',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelLarge!
                  //                 .copyWith(
                  //                   color: Colors.black,
                  //                 ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           TextFormField(
                  //             controller: provider.latitudeAwalController,
                  //             enabled: false,
                  //             textInputAction: TextInputAction.next,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Longitude',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelLarge!
                  //                 .copyWith(
                  //                   color: Colors.black,
                  //                 ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           TextFormField(
                  //             textInputAction: TextInputAction.next,
                  //             controller: provider.longitudeAwalController,
                  //             enabled: false,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // const Divider(),

                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // // Input Titik Akhir
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Pilih Titik Akhir',
                  //       style:
                  //           Theme.of(context).textTheme.headlineSmall!.copyWith(
                  //                 color: Colors.black,
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //     ),
                  //     ElevatedButton(
                  //       onPressed: () async {
                  //         await provider.openEndLocationPickerDialog(context);
                  //       },
                  //       child: const Row(
                  //         children: [
                  //           Icon(Icons.map),
                  //           SizedBox(width: 5.0),
                  //           Text('Pilih Lokasi'),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Latitude',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelLarge!
                  //                 .copyWith(
                  //                   color: Colors.black,
                  //                 ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           TextFormField(
                  //             controller: provider.latitudeAkhirController,
                  //             enabled: false,
                  //             textInputAction: TextInputAction.next,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             'Longitude',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelLarge!
                  //                 .copyWith(
                  //                   color: Colors.black,
                  //                 ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           TextFormField(
                  //             textInputAction: TextInputAction.next,
                  //             controller: provider.longitudeAkhirController,
                  //             enabled: false,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // const Divider(),

                  // const SizedBox(
                  //   height: 20,
                  // ),

