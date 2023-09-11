import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/screens/characters_details_screen.dart';
import 'package:rick_and_morty/presentation/screens/characters_screen.dart';
import 'package:rick_and_morty/presentation/screens/splash_screen.dart';

import 'business_logic/cubit/characters_cubit.dart';
import 'constants/strings.dart';
import 'data/api/characters_web_services.dart';
import 'data/models/characters.dart';
import 'data/repository/characters_repository.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case webViewScreen:
      //   return MaterialPageRoute(builder: (_) => WebViewScreen("https://www.youtube.com/"));
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case charactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case charactersDetailsScreen:
        final character = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
                  character: character,
                ));
    }
    return null;
  }
}
