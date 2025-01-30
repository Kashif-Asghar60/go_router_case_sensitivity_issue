 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'screens.dart'; // Import all your screens here

final GoRouter router = GoRouter(
  navigatorKey: Get.key, // Use GetX's navigator key for navigation
  initialLocation: '/', // Default route
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
      routes: [
        GoRoute(
          path: 'store',
          builder: (context, state) {
            final args = state.uri.queryParameters['name'] ?? 'Guest';
            return StorePage(name: args);
          },
           routes: [
            GoRoute(
              path: 'products',
              builder: (BuildContext context, GoRouterState state) {
                return StoreProductsPage();
              },
            ),
            GoRoute(
              path: 'cart',
              builder: (BuildContext context, GoRouterState state) {
                return StoreCartPage();
              },
            ),
            GoRoute(
              path: 'checkout',
              builder: (BuildContext context, GoRouterState state) {
                return StoreCheckoutPage();
              },
            ),
          ],
        
        ),
        GoRoute(
          path: 'contact',
          builder: (context, state) => ContactPage(),
        ),
        GoRoute(
          path: 'about',
          builder: (context, state) => AboutPage(),
        ),
        GoRoute(
          path: 'profile/:id',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ProfilePage(userId: id);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Error')),
    body: const Center(child: Text('Page not found')),
  ),
redirect: (context, state) {
  print("=== Redirect Callback Triggered ===");
  print("Original URI: ${state.uri}");
  print("Original Path: ${state.uri.path}");

  // Normalize the path to lowercase
  final path = state.uri.path.toLowerCase();
  print("Lowercased Path: $path");

  if (path != state.uri.path) {
    print("Path has changed. Redirecting to: ${state.uri.replace(path: path)}");
    return state.uri.replace(path: path).toString();
  } else {
    print("No change in path. No redirection needed.");
  }

  return null;
},

);
