import 'package:chat_messaging_ui/presentation/screens/chats_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.chats.routeName,
    routes: [
      GoRoute(path: NamedRoutes.chats.routeName, builder: (ctx, state) => ChatsPage())
    ]);

enum NamedRoutes {
  chats('/chats');
  
  final String routeName;
  const NamedRoutes(this.routeName);
}