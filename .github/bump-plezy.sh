#!/bin/sh
# Point Casks/plezy.rb at the latest edde746/plezy GitHub release. Leaves the file untouched when current.
set -eu
cd "$(dirname "$0")/.."

cask=Casks/plezy.rb
current=$(sed -n 's/^  version "\(.*\)"$/\1/p' "$cask")
[ -n "$current" ] || { echo "no version line in $cask" >&2; exit 1; }

latest=$(curl -fsSL ${GITHUB_TOKEN:+-H "Authorization: Bearer $GITHUB_TOKEN"} \
  https://api.github.com/repos/edde746/plezy/releases/latest | jq -r '.tag_name')
newest=$(printf '%s\n%s\n' "$current" "$latest" | sort -V | tail -n1)
if [ "$latest" = "$current" ] || [ "$newest" = "$current" ]; then
  echo "plezy $current is current (latest release $latest)"
  exit 0
fi

sha=$(curl -fsSL "https://github.com/edde746/plezy/releases/download/$latest/plezy-macos.dmg" \
  | { sha256sum 2>/dev/null || shasum -a 256; } | cut -d' ' -f1)
[ ${#sha} -eq 64 ] || { echo "bad checksum for $latest: $sha" >&2; exit 1; }

sed -e "s/^  version \".*\"$/  version \"$latest\"/" \
    -e "s/^  sha256 \".*\"$/  sha256 \"$sha\"/" "$cask" > "$cask.tmp"
mv "$cask.tmp" "$cask"
echo "plezy $current -> $latest"
