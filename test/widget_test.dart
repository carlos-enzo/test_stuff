import 'package:flutter_test/flutter_test.dart';
import 'package:test_stuff/main.dart';
import 'package:test_stuff/test_rive.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    int pumps = await tester.pumpAndSettle();
    print('pumps: $pumps');

    expect(find.byType(PlayOneShotAnimation), findsOneWidget);

    await tester.tap(find.byType(PlayOneShotAnimation));
    pumps = await tester.pumpAndSettle();
    print('pumps: $pumps');
  });
}
