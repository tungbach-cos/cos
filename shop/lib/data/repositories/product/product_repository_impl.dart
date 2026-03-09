import 'package:injectable/injectable.dart';
import 'package:tungbach/data/models/product_model.dart';
import 'package:tungbach/data/repositories/product/product_repository_interface.dart';

/// Implementation of product repository
///
/// Provides product data. Currently returns static data,
/// but can be easily extended to fetch from API or database.
/// This follows the repository pattern from the data layer architecture.
@Injectable(as: ProductRepository) // ← Registers interface with implementation
final class ProductRepositoryImpl implements ProductRepository {
  /// Creates a product repository implementation
  ProductRepositoryImpl();

  /// All available products.
  static const List<ProductModel> products = [
    ProductModel(
      id: 'phan-bon-npk',
      name: 'Phân Bón NPK',
      category: 'Phân Bón',
      shortDescription: ' ',
      fullDescription:
          'Phân bón NPK chất lượng cao, phù hợp cho nhiều loại cây trồng. Tỷ lệ'
          ' NPK cân bằng giúp cây trồng phát triển tốt.',
      features: [
        'Tỷ lệ NPK cân bằng 15-15-15',
        'Tăng năng suất cây trồng',
        'Cải thiện chất lượng đất',
        'An toàn cho môi trường',
      ],
      specifications: {
        'Thành phần': 'N 15%, P2O5 15%, K2O 15%',
        'Trọng lượng': '50kg/bao',
        'Xuất xứ': 'Việt Nam',
        'Hạn sử dụng': '36 tháng',
      },
      imageUrl: 'https://example.com/phan-bon-npk.jpg',
      price: '150000',
      unit: 'bao',
    ),
    ProductModel(
      id: 'cam-gao',
      name: 'Cám Gạo',
      category: 'Thức Ăn',
      shortDescription: 'Cám gạo chất lượng cao',
      fullDescription:
          'Cám gạo chất lượng cao, giàu dinh dưỡng cho gia súc. Giúp tăng trọng'
          ' nhanh và cải thiện chất lượng thịt.',
      features: [
        'Giàu protein và vitamin',
        'Tăng trọng nhanh',
        'Cải thiện chất lượng thịt',
        'Dễ tiêu hóa',
      ],
      specifications: {
        'Thành phần': 'Cám gạo 100%',
        'Trọng lượng': '25kg/bao',
        'Xuất xứ': 'Việt Nam',
        'Hạn sử dụng': '12 tháng',
      },
      imageUrl: 'https://example.com/cam-gao.jpg',
      price: '25000',
      unit: 'bao',
    ),
    ProductModel(
      id: 'phan-huu-co',
      name: 'Phân Hữu Cơ',
      category: 'Phân Bón',
      shortDescription: 'Phân hữu cơ tự nhiên',
      fullDescription:
          'Phân hữu cơ tự nhiên, an toàn cho cây trồng và môi trường. Cải thiện'
          ' cấu trúc đất và tăng độ phì nhiêu.',
      features: [
        '100% hữu cơ tự nhiên',
        'Cải thiện cấu trúc đất',
        'Tăng độ phì nhiêu',
        'An toàn tuyệt đối',
      ],
      specifications: {
        'Thành phần': 'Phân chuồng, phân xanh',
        'Trọng lượng': '20kg/bao',
        'Xuất xứ': 'Việt Nam',
        'Hạn sử dụng': '24 tháng',
      },
      imageUrl: 'https://example.com/phan-huu-co.jpg',
      price: '80000',
      unit: 'bao',
    ),
    ProductModel(
      id: 'thuc-an-ga',
      name: 'Thức Ăn Gà',
      category: 'Thức Ăn',
      shortDescription: 'Thức ăn chăn nuôi gà chuyên nghiệp',
      fullDescription:
          'Thức ăn chăn nuôi gà chuyên nghiệp, đầy đủ dinh dưỡng. Công thức '
          'cân bằng giúp tăng trọng hiệu quả.',
      features: [
        'Công thức dinh dưỡng cân bằng',
        'Tăng trọng hiệu quả',
        'Giảm chi phí chăn nuôi',
        'Tăng sức đề kháng',
      ],
      specifications: {
        'Thành phần': 'Ngô, đậu tương, vitamin',
        'Trọng lượng': '30kg/bao',
        'Xuất xứ': 'Việt Nam',
        'Hạn sử dụng': '6 tháng',
      },
      imageUrl: 'https://example.com/thuc-an-ga.jpg',
      price: '35000',
      unit: 'bao',
    ),
    ProductModel(
      id: 'phan-kali',
      name: 'Phân Kali',
      category: 'Phân Bón',
      shortDescription: 'Phân kali chất lượng cao',
      fullDescription:
          'Phân kali chất lượng cao, giúp cây trồng phát triển mạnh. Hàm '
          'lượng K2O cao giúp tăng khả năng chống chịu.',
      features: [
        'Hàm lượng K2O cao',
        'Tăng khả năng chống chịu',
        'Cải thiện chất lượng quả',
        'Tăng năng suất',
      ],
      specifications: {
        'Thành phần': 'K2O 60%',
        'Trọng lượng': '50kg/bao',
        'Xuất xứ': 'Việt Nam',
        'Hạn sử dụng': '36 tháng',
      },
      imageUrl: 'https://example.com/phan-kali.jpg',
      price: '120000',
      unit: 'bao',
    ),
  ];

  /// Get all available products
  ///
  /// In a real app, this might fetch from:
  /// - Remote API
  /// - Local database
  /// - CMS (Content Management System)
  /// - Static files
  @override
  Future<List<ProductModel>> getAllProducts() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 200));

    return products;
  }

  /// Get a specific product by ID
  ///
  /// In a real app, this might query:
  /// - Database by primary key
  /// - API endpoint with product ID
  /// - Cache with product ID
  @override
  Future<ProductModel> getProductById(String id) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 150));

    try {
      return products.firstWhere((product) => product.id == id);
    } on Exception {
      throw Exception('Product with ID "$id" not found');
    }
  }

  /// Get products filtered by category
  ///
  /// In a real app, this might query:
  /// - Database with WHERE clause
  /// - API with category filter
  /// - Search index with category filter
  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 100));

    return products.where((product) => product.category == category).toList();
  }

  /// Get related products for a given product
  ///
  /// In a real app, this might query:
  /// - Database with category filter excluding current product
  /// - API with related products endpoint
  /// - Recommendation engine
  @override
  Future<List<ProductModel>> getRelatedProducts(ProductModel product) async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 150));

    return products
        .where((p) => p.category == product.category && p.id != product.id)
        .take(4) // Limit to 4 related products
        .toList();
  }
}
