import '../models/category_model.dart';
import 'mock_items.dart';

List<Category> mockCategories = [
  Category(
    id: '1',
    name: 'Categoria 1',
    photoUrl: 'https://via.placeholder.com/150',
    description: 'Descrição da Categoria 1',
    items: mockItems,
  ),
  Category(
    id: '2',
    name: 'Categoria 2',
    photoUrl: 'https://via.placeholder.com/150',
    description: 'Descrição da Categoria 2',
    items: mockItems,
  ),
  Category(
    id: '3',
    name: 'Categoria 3',
    photoUrl: 'https://via.placeholder.com/150',
    description: 'Descrição da Categoria 3',
    items: mockItems,
  ),
];
