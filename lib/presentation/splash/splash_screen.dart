import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_cubit.dart';
import 'package:subspace_blog/logic/cubits/blog_cubit/blog_state.dart';
import 'package:subspace_blog/presentation/Blog/landing_blog_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = "Splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void gotoNextScreen() {
    BlogState userState = BlocProvider.of<BlogCubit>(context).state;
    if (userState is BlogLoadedState) {
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacementNamed(context, LandingBlogScreen.routeName);
    }
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), () => gotoNextScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BlogCubit, BlogState>(
      listener: (context, state) {
        gotoNextScreen();
      },
      child:  AnimatedSplashScreen(
        splash: Center(
          child: Lottie.asset(
              'assets/animated/Animation - 1722927455635.json', fit: BoxFit.fitHeight),
        ),
       nextScreen: const LandingBlogScreen(),
        
        ));
  } 
}
