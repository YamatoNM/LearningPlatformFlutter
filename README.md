# Learnly - Laborator 3

Aplicatie Flutter pentru invatare, construita modular cu `flutter_bloc` si
incarcare asincrona a datelor din `assets/data.json`.

## Functionalitati

- stari BLoC: initial, loading, success, empty si error;
- lista de cursuri cu cautare dupa titlu, autor sau descriere;
- filtrare dupa categorie si sortare dupa titlu, rating, pret sau durata;
- adaugare/eliminare din favorite;
- pagina de detalii cu lista de lectii si marcarea lectiilor finalizate;
- ecran Home cu progresul de invatare si cursuri populare;
- componente reutilizabile pentru carduri, loading, empty si error states.

## Organizare

- `lib/repositories/` - citirea asincrona a fisierului JSON;
- `lib/models/` - modelele de date si conversia `fromJson`;
- `lib/cubits/` - starea si operatiile asupra catalogului;
- `lib/screens/` - Home, Courses si Course Details;
- `lib/widgets/` - componente UI reutilizabile;
- `assets/data.json` - datele aplicatiei.

## Rulare

```bash
flutter pub get
flutter run
flutter test
```
