import 'package:flutter_test/flutter_test.dart';
import 'package:fcm_test_app/main.dart';

void main() {
  testWidgets('FCM test app displays the token button', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FcmTestApp());

    expect(find.text('FCM Token Test'), findsOneWidget);
    expect(find.text('Get FCM Token'), findsOneWidget);
  });
}
