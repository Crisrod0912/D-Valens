import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
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

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: ContraseniaOlvidadaWidget.routeName,
          path: ContraseniaOlvidadaWidget.routePath,
          builder: (context, params) => ContraseniaOlvidadaWidget(),
        ),
        FFRoute(
          name: CategoriasWidget.routeName,
          path: CategoriasWidget.routePath,
          builder: (context, params) => CategoriasWidget(
            catProdEleccion: params.getParam(
              'catProdEleccion',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Categorias'],
            ),
          ),
        ),
        FFRoute(
          name: EditarCategoriaWidget.routeName,
          path: EditarCategoriaWidget.routePath,
          builder: (context, params) => EditarCategoriaWidget(
            paramImage: params.getParam(
              'paramImage',
              ParamType.String,
            ),
            paramName: params.getParam(
              'paramName',
              ParamType.String,
            ),
            paramSelectCategoria: params.getParam(
              'paramSelectCategoria',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Categorias'],
            ),
          ),
        ),
        FFRoute(
          name: ListarPerfilesWidget.routeName,
          path: ListarPerfilesWidget.routePath,
          builder: (context, params) => ListarPerfilesWidget(),
        ),
        FFRoute(
          name: CateringServiceWidget.routeName,
          path: CateringServiceWidget.routePath,
          builder: (context, params) => CateringServiceWidget(),
        ),
        FFRoute(
          name: EditarPerfilWidget.routeName,
          path: EditarPerfilWidget.routePath,
          builder: (context, params) => EditarPerfilWidget(
            imagenParametro: params.getParam(
              'imagenParametro',
              ParamType.String,
            ),
            emailParametro: params.getParam(
              'emailParametro',
              ParamType.String,
            ),
            nombreUsuarioParametro: params.getParam(
              'nombreUsuarioParametro',
              ParamType.String,
            ),
            phoneNumberParametro: params.getParam(
              'phoneNumberParametro',
              ParamType.String,
            ),
            rolParametro: params.getParam(
              'rolParametro',
              ParamType.String,
            ),
            rolSwitchParametro: params.getParam(
              'rolSwitchParametro',
              ParamType.bool,
            ),
            eleccionUsuarioParametro: params.getParam(
              'eleccionUsuarioParametro',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
          ),
        ),
        FFRoute(
          name: CreateCategoriasWidget.routeName,
          path: CreateCategoriasWidget.routePath,
          builder: (context, params) => CreateCategoriasWidget(
            creadoCategoria: params.getParam(
              'creadoCategoria',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Categorias'],
            ),
          ),
        ),
        FFRoute(
          name: IndexWidget.routeName,
          path: IndexWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Index')
              : IndexWidget(
                  productosGO: params.getParam(
                    'productosGO',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['productos'],
                  ),
                  categoriasGO: params.getParam(
                    'categoriasGO',
                    ParamType.DocumentReference,
                    isList: false,
                    collectionNamePath: ['Categorias'],
                  ),
                ),
        ),
        FFRoute(
          name: BusquedaDeProductosWidget.routeName,
          path: BusquedaDeProductosWidget.routePath,
          builder: (context, params) => BusquedaDeProductosWidget(),
        ),
        FFRoute(
          name: RegisterWidget.routeName,
          path: RegisterWidget.routePath,
          builder: (context, params) => RegisterWidget(),
        ),
        FFRoute(
          name: HistorialCateringServiceWidget.routeName,
          path: HistorialCateringServiceWidget.routePath,
          builder: (context, params) => HistorialCateringServiceWidget(),
        ),
        FFRoute(
          name: CrearPerfilWidget.routeName,
          path: CrearPerfilWidget.routePath,
          builder: (context, params) => CrearPerfilWidget(),
        ),
        FFRoute(
          name: ChatIAWidget.routeName,
          path: ChatIAWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'ChatIA')
              : ChatIAWidget(),
        ),
        FFRoute(
          name: ProductosWidget.routeName,
          path: ProductosWidget.routePath,
          builder: (context, params) => ProductosWidget(
            catProdEleccion: params.getParam(
              'catProdEleccion',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Categorias'],
            ),
            productosIndex: params.getParam(
              'productosIndex',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['productos'],
            ),
            paramProdElec: params.getParam(
              'paramProdElec',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['productos'],
            ),
            paramSearch: params.getParam(
              'paramSearch',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['productos'],
            ),
          ),
        ),
        FFRoute(
          name: CarritoWidget.routeName,
          path: CarritoWidget.routePath,
          builder: (context, params) => CarritoWidget(
            valorInicial: params.getParam(
              'valorInicial',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VistaDeProductosWidget.routeName,
          path: VistaDeProductosWidget.routePath,
          builder: (context, params) => VistaDeProductosWidget(
            paramName: params.getParam(
              'paramName',
              ParamType.String,
            ),
            paramDesc: params.getParam(
              'paramDesc',
              ParamType.String,
            ),
            paramTiempoEntrega: params.getParam(
              'paramTiempoEntrega',
              ParamType.String,
            ),
            paramPrecio: params.getParam(
              'paramPrecio',
              ParamType.double,
            ),
            paramImage: params.getParam(
              'paramImage',
              ParamType.String,
            ),
            paramAddcart: params.getParam(
              'paramAddcart',
              ParamType.bool,
            ),
            paramViewProduct: params.getParam(
              'paramViewProduct',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['productos'],
            ),
            paramCantidad: params.getParam(
              'paramCantidad',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MetodoPagoWidget.routeName,
          path: MetodoPagoWidget.routePath,
          builder: (context, params) => MetodoPagoWidget(),
        ),
        FFRoute(
          name: PerfilPersonalWidget.routeName,
          path: PerfilPersonalWidget.routePath,
          builder: (context, params) => PerfilPersonalWidget(),
        ),
        FFRoute(
          name: DdsWidget.routeName,
          path: DdsWidget.routePath,
          builder: (context, params) => DdsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
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

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
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
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
