import 'package:flutter_test/flutter_test.dart';
import 'package:bmi/main.dart';

void main() {
  testWidgets('BMR app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('BMR CALCULATOR'), findsOneWidget);
  });
}
