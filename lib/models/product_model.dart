class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final double weight;
  final Map<String, double> dimensions;
  final String? warrantyInformation; // Nullable String
  final String? shippingInformation; // Nullable String
  final String? availabilityStatus; // Nullable String
  final List<dynamic> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Map<String, String> meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
      tags: List<String>.from(json['tags'] ?? []),
      brand: json['brand'] ?? 'Unknown Brand', // Example of default value
      sku: json['sku'] ?? 'Unknown SKU', // Example of default value
      weight: (json['weight'] as num).toDouble(),
      dimensions: _parseDimensions(json['dimensions'] ?? {}),
      warrantyInformation: json['warrantyInformation'] ??
          'No warranty', // Example of default value
      shippingInformation: json['shippingInformation'] ??
          'No shipping info', // Example of default value
      availabilityStatus: json['availabilityStatus'] ??
          'Out of stock', // Example of default value
      reviews: List<dynamic>.from(json['reviews'] ?? []),
      returnPolicy: json['returnPolicy'] ??
          'No return policy', // Example of default value
      minimumOrderQuantity:
          json['minimumOrderQuantity'] ?? 1, // Example of default value
      meta: _parseMeta(json['meta'] ?? {}),
      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ??
          'https://example.com/default-thumbnail.png', // Example of default value
    );
  }

  static Map<String, double> _parseDimensions(
      Map<String, dynamic> dimensionsJson) {
    if (dimensionsJson.isEmpty) return {};
    return dimensionsJson.map((key, value) => MapEntry(key, value.toDouble()));
  }

  static Map<String, String> _parseMeta(Map<String, dynamic> metaJson) {
    if (metaJson.isEmpty) return {};
    return metaJson.map((key, value) => MapEntry(key, value.toString()));
  }
}
