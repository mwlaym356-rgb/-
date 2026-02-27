import 'package:flutter_test/flutter_test.dart';
import 'package:houma_store/main.dart';

void main() {
  testWidgets('renders store title and product list', (tester) async {
    await tester.pumpWidget(const HoumaStoreApp());

    expect(find.text('متجر الحومة'), findsOneWidget);
    expect(find.text('عطر محلي'), findsOneWidget);
    expect(find.text('بقلاوة تقليدية'), findsOneWidget);
    expect(find.text('أحذية تقليدية'), findsOneWidget);
  });
}
