import 'package:cuentas_app/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/splashscreen',
  routes: [
    GoRoute(
      path: '/intro',
      name: IntroAppView.name,
      builder: (context, state) => const IntroAppView(),
    ),
    GoRoute(
      path: '/auth',
      name: 'auth',
      builder: (context, state) => const SignInView(),
      routes: [
        GoRoute(
          path: 'login',
          name: SignInView.name,
          builder: (context, state) => const SignInView(),
        ),
        GoRoute(
          path: 'register',
          name: SignUpView.name,
          builder: (context, state) => const SignUpView(),
        ),
      ],
    ),
    GoRoute(
      path: '/dashboard',
      name: DashboardView.name,
      builder: (context, state) => const DashboardView(),
    ),
    GoRoute(
      path: '/splashscreen',
      name: SplashscreenView.name,
      builder: (context, state) => const SplashscreenView(),
    ),
    GoRoute(path: '/', redirect: (_, state) => '/splashscreen'),
  ],
);
