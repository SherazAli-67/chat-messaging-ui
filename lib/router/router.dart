import 'package:chat_messaging_ui/presentation/screens/chats_page.dart';
import 'package:chat_messaging_ui/presentation/screens/main_menu_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
    initialLocation: NamedRoutes.chats.routeName,
    routes: [
      GoRoute(path: NamedRoutes.chats.routeName, builder: (ctx, state) => ChatsPage()),
      StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(path: NamedRoutes.chats.routeName, builder: (_, state)=> ChatsPage())
            ]),

            StatefulShellBranch(routes: [
              GoRoute(path: NamedRoutes.chats.routeName, builder: (_, state)=> Center(child: Text("Profile page"),))
            ]),
          ],
        builder: (ctx, state, navigationShell) => MainMenuPage(navigationShell: navigationShell)
      )
    ]);

enum NamedRoutes {
  chats('/chats');
  
  final String routeName;
  const NamedRoutes(this.routeName);
}