# StudyMate

A small but complete Flutter app for students: track study tasks, star the
important ones, jump between screens, and see a live "tip of the day" pulled
from a public API. Built to use every concept from your 3-day workshop in one
real, useful app.

## What's inside → what you learned

| Workshop concept              | Where it lives in this project |
|--------------------------------|---------------------------------|
| TextField                     | `lib/screens/tasks_tab.dart`, `profile_tab.dart` |
| Buttons (Elevated)             | Add Task, Save Name, Mark Done buttons |
| GestureDetector                | `lib/widgets/task_card.dart`, `task_detail_screen.dart` |
| Passing data between screens   | `TaskDetailScreen(task: task)` in `tasks_tab.dart` |
| Drawer                         | `lib/screens/home_screen.dart` |
| Menu (PopupMenuButton)         | AppBar in `home_screen.dart` |
| Tabs                           | `DefaultTabController` in `home_screen.dart` |
| Named routing                  | `routes: {...}` in `lib/main.dart` |
| State management (Provider)    | `lib/providers/app_provider.dart` |
| API calls (http)               | `lib/services/quote_service.dart` |
| Custom fonts (Kalam, Pacifico)  | `pubspec.yaml` + `lib/theme/app_theme.dart` |
| Custom theme                   | `lib/theme/app_theme.dart` (light + dark) |
| Image assets                   | `assets/images/logo.png` |

## Run it in GitHub Codespaces

1. Push this folder to a new GitHub repo (or unzip it into one you already have).
2. On the repo page, click **Code → Codespaces → Create codespace on main**.
3. Wait for the codespace to build — `.devcontainer/setup.sh` runs
   automatically and installs the Flutter SDK for you (takes a few minutes
   the first time).
4. Once it's ready, open a **new terminal** (so the updated PATH loads) and run:
   ```bash
   flutter pub get
   flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0
   ```
5. Codespaces will show a **"Open in Browser"** popup for port 8080 — click it.
   That's your live app, editable in real time (hot reload: press `r` in the
   terminal after saving a file).

> Flutter can't open a phone emulator or a desktop window inside Codespaces
> (there's no display), so **web** is the right target here — that's exactly
> what `-d web-server` gives you.

## Run it locally instead

If you have Flutter installed on your own machine:
```bash
flutter pub get
flutter run -d chrome
```

## Ideas to make it even more yours

- Add a due-date field to `Task` and sort the list by it.
- Swap the "tip of the day" API for something else you like (weather,
  jokes, a quote API) — everything only touches `quote_service.dart`.
- Add a second `ChangeNotifier` for a course timetable.
- Try `flutter build web` and deploy the `build/web` folder to GitHub Pages.
