#!/usr/bin/env python3
"""
usage: yt {music|course} URL
"""
import subprocess
import sys
import pathlib import Path

BASE = Path.home() / "Downloads" / "ytdl"
STATE = Path.home() / ".local" / "share" / "ytdl"

COMMON = ["--yes-playlist", "--ignore-errors", "--embed-metadata",
          "--sleep-interval", "2"]
PROFILES = {
        "music": [
            "-f", "ba/b", "-x", "--audio-format", "best", "--audio-quality",
            "0", "--embed-thumbnail",
            "--download-archive", str(STATE / "music.txt"),
            "-o", str(BASE/ "Music" / "%(playlist_title)s" /
                      "%(playlist_index)02d - %(title)s.%(ext)s"),
            ],
        "course":[
            "-S", "res:1080", "--merge-output-format", "mkv",
            "--write-subs", "--sub-langs", "en.*", "--embed-subs",
            "--download-archive", str(STATE / "courses.txt"),
            "-o", str(BASE / "Courses" / "%(playlist_index)s" /
                      "%(playlist_index)03d - %(title)s.%(ext)s"),
            ],
        }

def main():
    if len(sys.argv) != 3 or sys.argv[1] not in PROFILES:
        sys.exit(__doc__)
    mode, url = sys.argv[1], sys.argv[2]
    STATE.mkdir(parents=True, exist_ok=True)
    BASE.mkdir(parents=True, exist_ok=True)
    cmd = ["yt-dlp", *COMMON, *PROFILES[mode], url]
    sys.exit(subprocess.run(cmd).returncode)

if __name__ == "__main__":
    main()
