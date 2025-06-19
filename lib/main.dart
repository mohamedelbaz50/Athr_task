import 'package:chat_task/core/styles/themes.dart';
import 'package:chat_task/presentation/controllers/chat/chat_cubit.dart';
import 'package:chat_task/presentation/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => ChatCubit())],
        child: ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: Themes.lightTheme,
              debugShowCheckedModeBanner: false,
              home: const ChatPage(),
            );
          },
        ));
  }
}
