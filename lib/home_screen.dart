import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'Laptop Pro',
        'image': 'assets/laptop.png',
        'description': 'Laptop Pro adalah perangkat performa tinggi untuk pekerjaan berat, multitasking, hingga gaming kelas atas.'
      },
      {
        'title': 'Smartphone X',
        'image': 'assets/smartphone.png',
        'description': 'Smartphone X menghadirkan kamera canggih, layar OLED tajam, dan performa cepat untuk aktivitas harianmu.'
      },
      {
        'title': 'Headphone Air',
        'image': 'assets/haedphone.png',
        'description': 'Headphone Air dilengkapi noise cancellation premium dan kualitas suara jernih untuk pengalaman audio maksimal.'
      },
      {
        'title': 'Tablet Z',
        'image': 'https://cdn-icons-png.flaticon.com/512/9121/9121698.png',
        'description': 'Tablet Z memiliki layar besar dan ringan, cocok untuk menggambar, membaca, atau menonton film favoritmu.'
      },
      {
        'title': 'Burger Deluxe',
        'image': 'assets/burger.png',
        'description': 'Burger Deluxe dibuat dari daging sapi premium, sayuran segar, dan saus rahasia yang menggugah selera.'
      },
      {
        'title': 'Infinix Note 40',
        'image': 'https://fdn2.gsmarena.com/vv/pics/infinix/infinix-note-40-pro-plus-5g-1.jpg',
        'description': 'Infinix Note 40 hadir dengan pengisian super cepat, layar AMOLED 120Hz, dan desain elegan modern.'
      },
      {
        'title': 'The Log Speaker',
        'image': 'assets/speaker.png',
        'description': 'The Log Speaker memberikan suara bass dalam dan jernih — desainnya terinspirasi dari elemen kayu alami.'
      },
      {
        'title': 'Air Jordan 1 Retro',
        'image': 'https://cdn-icons-png.flaticon.com/512/992/992703.png',
        'description': 'Air Jordan 1 Retro adalah sneaker legendaris dengan desain klasik dan kenyamanan luar biasa untuk gaya sehari-hari.'
      },
      {
        'title': 'Jet Model X',
        'image': 'assets/jet.png',
        'description': 'Jet Model X adalah miniatur pesawat jet dengan detail realistis dan bahan premium untuk kolektor sejati.'
      },
      {
        'title': 'Tank Defender',
        'image': 'https://cdn-icons-png.flaticon.com/512/4440/4440864.png',
        'description': 'Tank Defender adalah mainan kendaraan tempur dengan desain kokoh dan sistem gerak yang realistis.'
      },
      {
        'title': 'Nuclear Fusion Core',
        'image': 'assets/nuclear.png',
        'description': 'Nuclear Fusion Core adalah model edukatif reaktor fusi yang menunjukkan cara energi masa depan bekerja.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          final image = product['image'] ?? '';

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: image.startsWith('assets/')
                  ? Image.asset(
                      image,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      image,
                      width: 40,
                      height: 40,
                      errorBuilder: (c, e, s) =>
                          const Icon(Icons.image_not_supported),
                    ),
              title: Text(product['title'] ?? ''),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      itemTitle: product['title'] ?? '',
                      itemImage: product['image'] ?? '',
                      itemDescription: product['description'] ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('belum bisa anjir')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
