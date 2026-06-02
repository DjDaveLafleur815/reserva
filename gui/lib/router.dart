import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/auth/login_view.dart';
import 'views/home_view.dart';
import 'views/client/client_home_view.dart';
import 'views/client/pro_detail_view.dart';
import 'views/client/booking_view.dart';
import 'views/pro/pro_dashboard_view.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginView()),

    GoRoute(path: '/home', builder: (context, state) => const HomeView()),

    GoRoute(
      path: '/client',
      builder: (context, state) => const ClientHomeView(),
    ),

    GoRoute(
      path: '/pro-detail',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        return ProDetailView(
          name: extra['name'] ?? 'Professionnel',
          job: extra['job'] ?? '',
          rating: extra['rating'] ?? '4.8',
        );
      },
    ),

    GoRoute(
      path: '/booking',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>? ?? {};
        return BookingView(
          proName: extra['proName'] ?? '',
          service: extra['service'] ?? 'Service',
        );
      },
    ),

    GoRoute(
      path: '/professional',
      builder: (context, state) => const ProDashboardView(),
    ),
  ],
);
