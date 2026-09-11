import 'package:chat_messaging_ui/presentation/screens/chats_page.dart';
import 'package:chat_messaging_ui/presentation/screens/main_menu_page.dart';
import 'package:chat_messaging_ui/presentation/screens/profile_page.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  initialLocation: NamedRoutes.chats.routeName,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.chats.routeName, builder: (_, state) => const ChatsPage()),
        ]),
        StatefulShellBranch(routes: [
          GoRoute(path: NamedRoutes.profile.routeName, builder: (_, state) => const ProfilePage()),
        ]),
      ],
    ),
  ],
);

enum NamedRoutes {
  chats('/chats'),
  profile('/profile');

  final String routeName;
  const NamedRoutes(this.routeName);
}
