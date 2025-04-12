import 'package:flutter/material.dart';
import '../widgets/featured_product_card.dart';
import '../models/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'All';
  int _currentIndex = 0;
  
  List<Product> getFilteredProducts() {
    if (_selectedCategory == 'All') {
      return demoProducts;
    } else {
      return demoProducts.where((product) => product.category == _selectedCategory).toList();
    }
  }

  void _onNavItemTapped(int index) {
    if (index == 2) {
      // AR View tab
      Navigator.pushNamed(context, '/ar-view');
      return;
    }
    
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = getFilteredProducts();
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text(
          'AR FURNITURE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: _getBodyForIndex(_currentIndex, filteredProducts),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_in_ar),
            label: 'AR View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _getBodyForIndex(int index, List<Product> filteredProducts) {
    switch (index) {
      case 0:
        return _buildHomeTab(filteredProducts);
      case 1:
        return _buildCategoriesTab();
      case 2:
        return _buildARViewTab();
      case 3:
        return _buildWishlistTab();
      case 4:
        return _buildProfileTab();
      default:
        return _buildHomeTab(filteredProducts);
    }
  }

  Widget _buildHomeTab(List<Product> filteredProducts) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?q=80&w=1470&auto=format&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'NEW COLLECTION',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Discover Furniture in AR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: const Text('SHOP NOW'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Categories
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CATEGORIES',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryCircle(
                        icon: Icons.category,
                        label: 'All',
                        isSelected: _selectedCategory == 'All',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'All';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.chair,
                        label: 'Chairs',
                        isSelected: _selectedCategory == 'Chairs',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Chairs';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.table_bar,
                        label: 'Tables',
                        isSelected: _selectedCategory == 'Tables',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Tables';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.bed,
                        label: 'Beds',
                        isSelected: _selectedCategory == 'Beds',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Beds';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.weekend,
                        label: 'Sofas',
                        isSelected: _selectedCategory == 'Sofas',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Sofas';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.light,
                        label: 'Lamps',
                        isSelected: _selectedCategory == 'Lamps',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Lamps';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.kitchen,
                        label: 'Kitchen',
                        isSelected: _selectedCategory == 'Kitchen',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Kitchen';
                          });
                        },
                      ),
                      CategoryCircle(
                        icon: Icons.all_inclusive,
                        label: 'Others',
                        isSelected: _selectedCategory == 'Others',
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'Others';
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Featured Products
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedCategory == 'All' ? 'FEATURED PRODUCTS' : _selectedCategory.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 16),
                filteredProducts.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No products found in this category',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        return FeaturedProductCard(
                          product: filteredProducts[index],
                          onTap: () {
                            Navigator.pushNamed(
                              context, 
                              '/product-detail',
                              arguments: filteredProducts[index],
                            );
                          },
                        );
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Browse all furniture categories',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildARViewTab() {
    // Show all products with AR models in a grid
    final arProducts = demoProducts.where((p) => p.model3dUrl.isNotEmpty).toList();
    
    return Padding(
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
    );
  }

  Widget _buildWishlistTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 80,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Your favorite items will appear here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sign in to manage your account',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('SIGN IN'),
          ),
        ],
      ),
    );
  }
}

class CategoryCircle extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryCircle({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isSelected 
                  ? Theme.of(context).colorScheme.primary 
                  : Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: isSelected 
                  ? Colors.white 
                  : Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected 
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 