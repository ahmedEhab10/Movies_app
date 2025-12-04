import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import 'package:movies_app/core/theme/theme_manager.dart';
import 'package:movies_app/features/Auth/Login/presentation/cubit/cubit/login_cubit.dart';
import 'package:movies_app/features/Auth/Register/presentation/cubit/cubit/register_cubit.dart';
import 'package:movies_app/features/Auth/data/data_source/Local/auth_local_impl_data_source.dart';
import 'package:movies_app/features/Auth/data/data_source/Remote/auth_remote_impl_data_source.dart';
import 'package:movies_app/features/Auth/data/repositories_impl/auth_repository_impl.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(
            authRepository: AuthRepositoryImpl(
              authRemoteDataSource: AuthRemoteImplDataSource(),
              authLocalDataSource: AuthLocalImplDataSource(),
            ),
          ),
        ),

        BlocProvider(
          create: (context) => LoginCubit(
            authRepository: AuthRepositoryImpl(
              authRemoteDataSource: AuthRemoteImplDataSource(),
              authLocalDataSource: AuthLocalImplDataSource(),
            ),
          ),
        ),
      ],
      child: const Movie_App(),
    ),
  );
}

class Movie_App extends StatelessWidget {
  const Movie_App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeManager.dark,
          onGenerateRoute: RoutesManager.router,
          initialRoute: AppRoutes.splash,
        );
      },
    );
  }
}
