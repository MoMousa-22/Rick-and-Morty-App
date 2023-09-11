import '../api/characters_web_services.dart';
import '../models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<CharacterModel>> getAllCharacters() async {
    final List<dynamic> characters =
    await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}