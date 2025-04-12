class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final String model3dUrl;
  final List<String> galleryImages;
  final double rating;
  final int reviews;
  final bool isFavorite;
  final bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.model3dUrl,
    this.galleryImages = const [],
    this.rating = 0,
    this.reviews = 0,
    this.isFavorite = false,
    this.isAvailable = true,
  });
}

// Demo Products
final List<Product> demoProducts = [
  Product(
    id: '1',
    name: 'Wooden Table',
    description: 
        'This elegant wooden table features a smooth surface and sturdy construction. '
        'Perfect for dining rooms or as a statement piece in your living area. '
        'The natural wood grain patterns make each piece unique.',
    price: 299.99,
    category: 'Tables',
    imageUrl: 'https://images.unsplash.com/photo-1577140917170-285929fb55b7?q=80&w=1470&auto=format&fit=crop',
    model3dUrl: 'assets/table_wood.glb',
    galleryImages: [
      'https://images.unsplash.com/photo-1577140917170-285929fb55b7?q=80&w=1470&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1533090161767-e6ffed986c88?q=80&w=1969&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1581428982868-e410dd047a90?q=80&w=1974&auto=format&fit=crop',
    ],
    rating: 4.8,
    reviews: 124,
  ),
  Product(
    id: '2',
    name: 'Modern Cabinet',
    description: 
        'A sleek, contemporary cabinet with ample storage space. '
        'The minimalist design complements any modern interior, while the quality materials ensure durability. '
        'Features adjustable shelves and soft-close doors.',
    price: 549.99,
    category: 'Cabinets',
    imageUrl: 'https://images.unsplash.com/photo-1595428774223-ef52624120d2?q=80&w=1974&auto=format&fit=crop',
    model3dUrl: 'assets/Meuble_ID_1.glb',
    galleryImages: [
      'https://images.unsplash.com/photo-1595428774223-ef52624120d2?q=80&w=1974&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1594026112284-02bb6f3352fe?q=80&w=1970&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?q=80&w=1974&auto=format&fit=crop',
    ],
    rating: 4.5,
    reviews: 86,
  ),
  Product(
    id: '3',
    name: 'Ergonomic Chair',
    description: 
        'Experience ultimate comfort with this ergonomic office chair. '
        'Designed to provide proper support for long working hours, it features adjustable height, '
        'lumbar support, and breathable mesh material.',
    price: 189.99,
    category: 'Chairs',
    imageUrl: 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?q=80&w=1965&auto=format&fit=crop',
    model3dUrl: 'assets/chair.glb',
    galleryImages: [
      'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?q=80&w=1965&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1580480055273-228ff5388ef8?q=80&w=2000&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1505843490578-27dfc7b6a5a8?q=80&w=1887&auto=format&fit=crop',
    ],
    rating: 4.7,
    reviews: 215,
  ),
  Product(
    id: '4',
    name: 'Minimalist Sofa',
    description: 
        'This minimalist sofa combines style with comfort. '
        'The clean lines and neutral fabric make it versatile for any living space. '
        'High-density foam cushions provide excellent support and longevity.',
    price: 799.99,
    category: 'Sofas',
    imageUrl: 'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=2070&auto=format&fit=crop',
    model3dUrl: 'assets/sofa.glb',
    galleryImages: [
      'https://images.unsplash.com/photo-1555041469-a586c61ea9bc?q=80&w=2070&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?q=80&w=1470&auto=format&fit=crop',
      'https://images.unsplash.com/photo-1540574163026-643ea20ade25?q=80&w=2070&auto=format&fit=crop',
    ],
    rating: 4.9,
    reviews: 178,
  ),
  // Adding the Models in "Others" category
  Product(
    id: '5',
    name: 'Rustic Wooden Table',
    description: 
        'A beautiful rustic wooden table with a natural finish. Perfect for dining rooms, '
        'this piece showcases the unique wood grain patterns and provides a warm, inviting atmosphere. '
        'The sturdy construction ensures it will last for generations.',
    price: 399.99,
    category: 'Others',
    imageUrl: 'assets/table_wood.webp',
    model3dUrl: 'assets/table_wood.glb',
    galleryImages: [
      'assets/table_wood.webp',
    ],
    rating: 4.7,
    reviews: 42,
    isAvailable: true,
  ),
  Product(
    id: '6',
    name: 'Designer Cabinet',
    description: 
        'An elegant designer cabinet with a contemporary look. This versatile piece '
        'provides ample storage while adding a touch of sophistication to any room. '
        'The high-quality materials and craftsmanship ensure durability and timeless style.',
    price: 649.99,
    category: 'Others',
    imageUrl: 'assets/Meuble_ID_1.webp',
    model3dUrl: 'assets/Meuble_ID_1.glb',
    galleryImages: [
      'assets/Meuble_ID_1.webp',
    ],
    rating: 4.6,
    reviews: 38,
    isAvailable: true,
  ),
]; 