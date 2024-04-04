import 'dart:io';

String fixtureTranslationReader(String name) => File("assets/translations/$name").readAsStringSync();
