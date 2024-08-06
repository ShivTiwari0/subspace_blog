import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:subspace_blog/core/routes.dart';
import 'package:subspace_blog/core/ui.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:subspace_blog/logic/cubits/favorite_cubit/favorite_cubit.dart';

import 'package:subspace_blog/logic/services/hive/hive_blog_model.dart';

import 'package:subspace_blog/presentation/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveBlogModelAdapter());
   await Hive.openBox<HiveBlogModel>('blogBox');
  Bloc.observer = MyBlocObserver();
  runApp(const SubSpaceApp());
}

class SubSpaceApp extends StatelessWidget {
  const SubSpaceApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (context) => BlogCubit(),
        ), BlocProvider(
          create: (context) => FavoriteBlogsCubit( BlocProvider.of<BlogCubit>(context)),
        ),
       
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenrateRoute,
        theme: Themes.defaultTheme,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}





class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("Created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed: $bloc");
    super.onClose(bloc);
  }
}
