import 'package:chat_messaging_ui/core/app_data.dart';
import 'package:chat_messaging_ui/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Chats home shows greeting and chat list', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text(AppData.greeting), findsOneWidget);
    expect(find.text(AppData.unreadMessagesLabel), findsOneWidget);
    expect(find.text(AppData.chats.first.name), findsOneWidget);
  });
}
