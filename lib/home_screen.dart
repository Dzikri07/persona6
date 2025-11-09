import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'title': 'Laptop Pro',
        'image': 'https://cdn-icons-png.flaticon.com/512/2920/2920215.png',
        'description': 'Laptop performa tinggi untuk produktivitas dan gaming berat.'
      },
      {
        'title': 'Smartphone X',
        'image': 'https://cdn-icons-png.flaticon.com/512/106/106310.png',
        'description': 'Smartphone flagship dengan kamera canggih dan layar OLED tajam.'
      },
      {
        'title': 'Headphone Air',
        'image': 'https://cdn-icons-png.flaticon.com/512/681/681392.png',
        'description': 'Headphone nirkabel dengan fitur noise cancellation premium.'
      },
      {
        'title': 'Tablet Z',
        'image': 'https://cdn-icons-png.flaticon.com/512/2331/2331881.png',
        'description': 'Tablet ringan dengan layar besar dan dukungan stylus untuk menggambar.'
      },
      {
        'title': 'Smartwatch Plus',
        'image': 'https://cdn-icons-png.flaticon.com/512/326/326092.png',
        'description': 'Jam tangan pintar dengan fitur kebugaran dan notifikasi real-time.'
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
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: Image.network(
                product['image'] ?? '',
                width: 40,
                height: 40,
                errorBuilder: (c, e, s) => const Icon(Icons.image_not_supported),
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
            const SnackBar(content: Text('Tambah produk coming soon 😄')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
