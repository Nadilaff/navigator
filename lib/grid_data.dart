import 'package:flutter/material.dart';

class GridData extends StatelessWidget {
  GridData({super.key});

  final List<String> data = [
    'Anggora',
    'Birman',
    'British',
    'Burmilla',
    'Munchkin',
    'Persia',
    'Ragdoll',
    'Scottish',
  ];
  final List<String> imagePaths = [
    'img/anggora.jpg',
    'img/birman.jpg',
    'img/british.jpg',
    'img/burmilla.jpg',
    'img/munchkin.jpg',
    'img/persia.jpg',
    'img/ragdoll.jpg',
    'img/scottish.jpg',
  ];
  final List<String> harga = [
    'Rp. 50.000',
    'Rp. 20.000',
    'Rp. 20.000',
    'Rp. 20.000',
    'Rp. 50.000',
    'Rp. 20.000',
    'Rp. 20.000',
    'Rp. 20.000',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Griddata'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigasi ke halaman detail dengan membawa data yang diperlukan
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: data[index],
                      harga: harga[index],
                      imagePath: imagePaths[index],
                    ),
                  ),
                );
              },
              child: Card(
                //menambahkan bayangan
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            imagePaths[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              data[index],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(harga[index])
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String harga;
  final String imagePath;

  DetailPage(
      {required this.title, required this.harga, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imagePath,
                      height: 250.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            harga,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.green),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Ini adalah deskripsi dari kucing $title. Kucing ini sehat dan lucu, yang dijual dengan harga $harga. Jangan lewatkan kesempatan untuk memiliki anabul kesayangan kalian.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    // Tambahkan aksi untuk menambahkan ke keranjang belanja
                                  },
                                  label: Text(
                                    'Beli',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
