import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  VinedFirebaseUser? initialUser;
  VinedFirebaseUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(VinedFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : OnboardingWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'Onboarding',
              path: 'onboarding',
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'SeeAllCellars',
              path: 'seeAllCellars',
              requireAuth: true,
              builder: (context, params) => SeeAllCellarsWidget(
                regionName: params.getParam('regionName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'BaseHomePage',
              path: 'baseHomePage',
              requireAuth: true,
              builder: (context, params) => BaseHomePageWidget(),
            ),
            FFRoute(
              name: 'activity',
              path: 'activity',
              requireAuth: true,
              builder: (context, params) => ActivityWidget(),
            ),
            FFRoute(
              name: 'FIlterWineries',
              path: 'fIlterWineries',
              requireAuth: true,
              builder: (context, params) => FIlterWineriesWidget(),
            ),
            FFRoute(
              name: 'CreateTour',
              path: 'createTour',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'CreateTour')
                  : CreateTourWidget(
                      state: params.getParam('state', ParamType.JSON),
                    ),
            ),
            FFRoute(
              name: 'CreateNewTour1',
              path: 'createNewTour1',
              requireAuth: true,
              builder: (context, params) => CreateNewTour1Widget(
                state: params.getParam('state', ParamType.JSON),
                tourName: params.getParam('tourName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'SignupEmail',
              path: 'signupEmail',
              builder: (context, params) => SignupEmailWidget(),
            ),
            FFRoute(
              name: 'LoginEmail',
              path: 'loginEmail',
              builder: (context, params) => LoginEmailWidget(),
            ),
            FFRoute(
              name: 'CreateNewTour2',
              path: 'createNewTour2',
              requireAuth: true,
              builder: (context, params) => CreateNewTour2Widget(
                state: params.getParam('state', ParamType.JSON),
                regionIDRef: params.getParam(
                    'regionIDRef', ParamType.DocumentReference, 'regions'),
              ),
            ),
            FFRoute(
              name: 'CreateNewTour3',
              path: 'createNewTour3',
              requireAuth: true,
              builder: (context, params) => CreateNewTour3Widget(
                regionIDRef: params.getParam(
                    'regionIDRef', ParamType.DocumentReference, 'regions'),
              ),
            ),
            FFRoute(
              name: 'NewTourWizard',
              path: 'newTourWizard',
              requireAuth: true,
              builder: (context, params) => NewTourWizardWidget(
                state: params.getParam('state', ParamType.JSON),
                tourName: params.getParam('tourName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'EditTourPassengers',
              path: 'editTourPassengers',
              requireAuth: true,
              builder: (context, params) => EditTourPassengersWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
                tourName: params.getParam('tourName', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'AddVenueToTour',
              path: 'addVenueToTour',
              requireAuth: true,
              asyncParams: {
                'tourRecord': getDoc('tours', ToursRecord.serializer),
              },
              builder: (context, params) => AddVenueToTourWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
                tourName: params.getParam('tourName', ParamType.String),
                regionID: params.getParam('regionID', ParamType.String),
                makeLunchStopBool:
                    params.getParam('makeLunchStopBool', ParamType.bool),
                venueCount: params.getParam('venueCount', ParamType.int),
                tourDate: params.getParam('tourDate', ParamType.DateTime),
                tourRecord: params.getParam('tourRecord', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'ViewTourDetails',
              path: 'viewTourDetails',
              requireAuth: true,
              builder: (context, params) => ViewTourDetailsWidget(
                tourRef: params.getParam(
                    'tourRef', ParamType.DocumentReference, 'tours'),
              ),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Profile')
                  : ProfileWidget(
                      state: params.getParam('state', ParamType.JSON),
                    ),
            ),
            FFRoute(
              name: 'Tours',
              path: 'tours',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Tours')
                  : ToursWidget(),
            ),
            FFRoute(
              name: 'TourDetails',
              path: 'tourDetails',
              requireAuth: true,
              asyncParams: {
                'tourDocument': getDoc('tours', ToursRecord.serializer),
              },
              builder: (context, params) => TourDetailsWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
                tourDocument:
                    params.getParam('tourDocument', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'addVenue',
              path: 'addVenue',
              requireAuth: true,
              builder: (context, params) => AddVenueWidget(
                tourReff: params.getParam(
                    'tourReff', ParamType.DocumentReference, 'tours'),
              ),
            ),
            FFRoute(
              name: 'tourChat',
              path: 'tourChat',
              requireAuth: true,
              builder: (context, params) => TourChatWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
              ),
            ),
            FFRoute(
              name: 'chatScreen_sample',
              path: 'chatScreenSample',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc('users', UsersRecord.serializer),
              },
              builder: (context, params) => ChatScreenSampleWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
              ),
            ),
            FFRoute(
              name: 'users',
              path: 'users',
              requireAuth: true,
              asyncParams: {
                'tourReff': getDoc('tours', ToursRecord.serializer),
              },
              builder: (context, params) => UsersWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
                tourReff: params.getParam('tourReff', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'selectDriver',
              path: 'selectDriver',
              requireAuth: true,
              builder: (context, params) => SelectDriverWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
              ),
            ),
            FFRoute(
              name: 'submitTour',
              path: 'submitTour',
              requireAuth: true,
              asyncParams: {
                'tourRecord': getDoc('tours', ToursRecord.serializer),
              },
              builder: (context, params) => SubmitTourWidget(
                tourID: params.getParam(
                    'tourID', ParamType.DocumentReference, 'tours'),
                tourRecord: params.getParam('tourRecord', ParamType.Document),
              ),
            ),
            FFRoute(
              name: 'HomePageCopy',
              path: 'homePageCopy',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePageCopy')
                  : HomePageCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String? collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.of(context).purplePastel,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.bottomToTop,
        duration: Duration(milliseconds: 200),
      );
}
