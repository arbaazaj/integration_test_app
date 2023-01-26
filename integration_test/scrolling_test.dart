import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_app/main.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Counter increment smoke test', (tester) async {
    await tester.pumpWidget(
        MyApp(items: List<String>.generate(10000, (index) => 'Item $index')));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await binding.traceAction(
      () async {
        await tester.scrollUntilVisible(itemFinder, 500.0,
            scrollable: listFinder);
      },
      reportKey: 'scrolling_timeline'
    );
  });
}
