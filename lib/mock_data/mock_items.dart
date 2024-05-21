import '../models/item_model.dart';
import 'mock_activities.dart';

List<Item> mockItems = [
  Item(
    id: '1',
    name: 'Item 1',
    description: 'Descrição do Item 1',
    activities: mockActivities, // Adicionando atividades mocadas ao item
  ),
  Item(
    id: '2',
    name: 'Item 2',
    description: 'Descrição do Item 2',
    activities: mockActivities,
  ),
  Item(
    id: '3',
    name: 'Item 3',
    description: 'Descrição do Item 3',
    activities: mockActivities,
  ),
  Item(
    id: '4',
    name: 'Item 4',
    description: 'Descrição do Item 4',
    activities: mockActivities,
  ),
  Item(
    id: '5',
    name: 'Item 5',
    description: 'Descrição do Item 5',
    activities: mockActivities,
  ),
];
