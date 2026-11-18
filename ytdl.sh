#!/usr/bin/env bash
# ~/.local/bin/ytdl  (chmod +x)  usage: ytdl music|course PLAYLIST_URL
# mkdir -p ~/.local/bin
# curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
# chmod u+rx ~/.local/bin/yt-dlp
# install ffmpeg && python3-mutagen

set -euo pipefail

mode="${1:-}"; url="${2:-}"
[ -n "$mode" ] && [ -n "$url" ] || { echo "usage: ytdl {music|course} URL" >&2; exit 1; }

base="$HOME/Downloads/ytdl"
state="$HOME/.local/share/ytdl"
mkdir -p "$base" "$state"

common=(--yes-playlist --ignore-errors --embed-metadata --sleep-interval 2)

case "$mode" in
  music)
    yt-dlp "${common[@]}" \
      -f "ba/b" -x --audio-format best --audio-quality 0 \
      --embed-thumbnail \
      --download-archive "$state/music.txt" \
      -o "$base/Music/%(playlist_title)s/%(playlist_index)02d - %(title)s.%(ext)s" \
      "$url" ;;
  course)
    yt-dlp "${common[@]}" \
      -S "res:1080" --merge-output-format mkv \
      --write-subs --sub-langs "en.*" --embed-subs \
      --download-archive "$state/courses.txt" \
      -o "$base/Courses/%(playlist_title)s/%(playlist_index)03d - %(title)s.%(ext)s" \
      "$url" ;;
  *) echo "mode must be music or course" >&2; exit 1 ;;
esac
