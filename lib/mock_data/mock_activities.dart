import '../models/activity_model.dart';

List<Activity> mockActivities = [
  Activity(
    dateTime: DateTime.now().subtract(Duration(days: 1)),
    user: 'Usuário 1',
    name: 'Atividade 1',
    description:
        'Descrição da Atividade 1. Esta é uma descrição longa que deve ser truncada...',
    attachments: [],
    comments: [],
  ),
  Activity(
    dateTime: DateTime.now().subtract(Duration(days: 2)),
    user: 'Usuário 2',
    name: 'Atividade 2',
    description:
        'Descrição da Atividade 2. Esta é uma descrição longa que deve ser truncada...',
    attachments: [],
    comments: [],
  ),
  Activity(
    dateTime: DateTime.now().subtract(Duration(days: 3)),
    user: 'Usuário 3',
    name: 'Atividade 3',
    description:
        'Descrição da Atividade 3. Esta é uma descrição longa que deve ser truncada...',
    attachments: [],
    comments: [],
  ),
];
