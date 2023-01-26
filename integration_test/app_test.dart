import 'package:integration_test_app/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (widgetTester) async {
      app.main();
      await widgetTester.pumpAndSettle();
      
      expect(find.text('0'), findsOneWidget);

      final Finder fab = find.byTooltip('Increment');
      await widgetTester.tap(fab);
      await widgetTester.pumpAndSettle();
      
      expect(find.text('1'), findsOneWidget);
    });
  });

}