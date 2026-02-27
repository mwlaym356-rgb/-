import 'package:flutter/material.dart';

void main() {
  runApp(const HoumaStoreApp());
}

class Product {
  const Product({
    required this.name,
    required this.price,
    required this.icon,
    required this.description,
  });

  final String name;
  final String price;
  final IconData icon;
  final String description;
}

class HoumaStoreApp extends StatelessWidget {
  const HoumaStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر الحومة',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<Product> _products = [
    Product(
      name: 'عطر محلي',
      price: '2500 دج',
      icon: Icons.local_florist,
      description: 'عطر يدوي بلمسة محلية ورائحة ثابتة مناسبة للاستخدام اليومي.',
    ),
    Product(
      name: 'بقلاوة تقليدية',
      price: '1800 دج',
      icon: Icons.cake,
      description: 'بقلاوة محضّرة بعسل طبيعي ومكسرات مختارة بطابع تقليدي.',
    ),
    Product(
      name: 'أحذية تقليدية',
      price: '6000 دج',
      icon: Icons.shopping_bag,
      description: 'أحذية مريحة بتصميم تراثي وخامات متينة عالية الجودة.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('متجر الحومة'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Icon(product.icon, color: Colors.orange.shade800),
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('السعر: ${product.price}'),
              trailing: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: DetailsPage(product: product),
                      ),
                    ),
                  );
                },
                child: const Text('تفاصيل'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(product.icon, size: 110, color: Colors.orange.shade700),
            ),
            const SizedBox(height: 24),
            Text(
              product.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'السعر: ${product.price}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                icon: const Icon(Icons.phone),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('سيتم إضافة نظام الاتصال لاحقاً'),
                    ),
                  );
                },
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text('اتصل بالبائع'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
