#!/usr/bin/env bash
set -e

if [ ! -d "$HOME/flutter" ]; then
  echo "Cloning Flutter SDK (stable channel)..."
  git clone https://github.com/flutter/flutter.git -b stable "$HOME/flutter" --depth 1
fi

# Add Flutter to PATH for future shells
if ! grep -q 'flutter/bin' "$HOME/.bashrc" 2>/dev/null; then
  echo 'export PATH="$PATH:$HOME/flutter/bin"' >> "$HOME/.bashrc"
fi
export PATH="$PATH:$HOME/flutter/bin"

flutter config --enable-web --no-analytics
flutter precache --web
flutter doctor -v

cd /workspaces/*/  2>/dev/null || cd "$(dirname "$0")/.."
flutter pub get

echo ""
echo "Setup complete! Open a new terminal (so PATH updates apply), then run:"
echo "  flutter run -d web-server --web-port 8080 --web-hostname 0.0.0.0"
echo "Codespaces will pop up a 'forwarded port' link — open that to see the app."
