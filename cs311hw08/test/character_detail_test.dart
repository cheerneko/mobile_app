import 'package:cs311hw08/character_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_detail_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  testWidgets('Test Column',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters/raiden')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response('{"name":"Raiden Shogun", "vision":"Electro", "weapon":"Polearm", "nation":"Inazuma", "description":"Her Excellency, the Almighty, Narukami Ogosho, who promised the people of Inazuma an unchanging Eternity."}', 200)));
    await tester.pumpWidget(MaterialApp(home: CharacterDetail(client: client, name: 'raiden',)));
    await tester.pumpAndSettle();
    final findDetail = find.byType(Column);
    expect(findDetail, findsOneWidget);
});

  testWidgets('Test Error',
  (tester) async {
    final client = MockClient();
      when(client.get(Uri.parse('https://api.genshin.dev/characters/raiden')))
    .thenAnswer((_) async => Future.delayed(
    const Duration(seconds: 1),() => http.Response('Not Found', 404)));
    await tester.pumpWidget(MaterialApp(home: CharacterDetail(client: client, name: 'raiden',)));
    await tester.pumpAndSettle();
    final findError = find.byType(Text);
    expect(findError, findsWidgets);
});
}