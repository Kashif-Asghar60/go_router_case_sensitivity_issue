import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'authcontroller.dart';
import 'custom_route_parser.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            authController.login(); // Log in the user
            context.go('/'); // Navigate to the home page
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}


class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Center(
        child: Text('Registration Page'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Log out the user
              final authController = Get.find<AuthController>();
              authController.logout();

              // Navigate to the login screen
            
                       //   routerDelegate.setNewRoutePath('/login');
 context.go('/');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            _navigationButtons( context),
          ],
        ),
      ),
    );
  }

  Widget _navigationButtons(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
           
                     //                 routerDelegate.setNewRoutePath('/store?name=John');
   context.go('/store?name=John');
          },
          child: const Text('Go to Store (with Name)'),
        ),
        ElevatedButton(
          onPressed: () {
              context.go('/contact');

            
//routerDelegate.setNewRoutePath('/contact');

          },
          child: const Text('Go to Contact'),
        ),
        ElevatedButton(
          onPressed: () {
            
           // routerDelegate.setNewRoutePath('/about');
           
                         context.go('/about');


          },
          child: const Text('Go to About'),
        ),
        ElevatedButton(
          onPressed: () {
           
          // routerDelegate.setNewRoutePath('/profile/123');
            
                          context.go('/profile/123');

          },
          child: const Text('Go to Profile (with ID)'),
        ),
      ],
    );
  }
}


class StorePage extends StatelessWidget {
  final String name;

  const StorePage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Store Page, $name!', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            
                ElevatedButton(
                  onPressed: () => context.go('/store/products'),
                  child: Text('View Products'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/store/cart'),
                  child: Text('View Cart'),
                ),
                ElevatedButton(
                  onPressed: () => context.go('/store/checkout'),
                  child: Text('Go to Checkout'),
                ),
           
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.back(),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userId;

  const ProfilePage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile Page for User ID: $userId', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}



class StoreProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Store - Products')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Products Page!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back to Store'),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Store - Cart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Cart Page!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back to Store'),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreCheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Store - Checkout')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Checkout Page!', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back to Store'),
            ),
          ],
        ),
      ),
    );
  }
}
