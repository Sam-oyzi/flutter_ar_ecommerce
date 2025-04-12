import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/featured_product_card.dart';

class ARViewScreen extends StatelessWidget {
  const ARViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter products that have AR models
    final arProducts = demoProducts.where((p) => p.model3dUrl.isNotEmpty).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AR View',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AR MODELS',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'View these items in your space using AR',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: arProducts.length,
                itemBuilder: (context, index) {
                  return FeaturedProductCard(
                    product: arProducts[index],
                    onTap: () {
                      Navigator.pushNamed(
                        context, 
                        '/product-detail',
                        arguments: arProducts[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/ar-viewer');
        },
        icon: const Icon(Icons.view_in_ar),
        label: const Text('Open AR Viewer'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
} 