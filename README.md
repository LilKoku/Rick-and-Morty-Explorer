# Rick & Morty Explorer

## Opis projektu

Rick & Morty Explorer to aplikacja mobilna stworzona we Flutterze, wykorzystująca publiczne REST API Rick and Morty.

Aplikacja umożliwia przeglądanie postaci z serialu Rick and Morty, wyświetlanie szczegółowych informacji o wybranej postaci oraz korzystanie z zapisanych danych w trybie offline dzięki lokalnej bazie danych Hive.

## Funkcjonalności

* Pobieranie listy postaci z Rick and Morty API
* Wyświetlanie podstawowych informacji o postaciach
* Ekran szczegółów postaci
* Obsługa dwóch zapytań REST API:

  * pobieranie listy postaci
  * pobieranie szczegółów wybranej postaci
* Obsługa stanu ładowania danych
* Obsługa błędów połączenia z API
* Lokalna baza danych Hive
* Dostęp do zapisanych danych w trybie offline
* Możliwość odświeżenia danych poprzez przeciągnięcie ekranu w dół (Pull To Refresh)

## Technologie

* Flutter
* Dart
* REST API
* HTTP
* Hive
* Material Design 3

## Wykorzystane API

Rick and Morty API

https://rickandmortyapi.com/

Przykładowe endpointy:

* https://rickandmortyapi.com/api/character
* https://rickandmortyapi.com/api/character/{id}

## Struktura projektu

lib/

* models/

  * character.dart

* services/

  * api_service.dart
  * hive_service.dart

* screens/

  * character_list_screen.dart
  * character_details_screen.dart

* widgets/

  * character_card.dart

* main.dart

## Tryb offline

Po pobraniu danych z API aplikacja zapisuje je lokalnie w bazie Hive.

W przypadku braku połączenia z Internetem użytkownik nadal może:

* przeglądać wcześniej pobraną listę postaci,
* wyświetlać zapisane szczegóły postaci.

## Autor

Maciej Kak

