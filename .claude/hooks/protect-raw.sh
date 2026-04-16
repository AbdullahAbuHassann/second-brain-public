#!/usr/bin/env bash
# PreToolUse hook: blocks Edit/Write/MultiEdit on knowledge-base/raw/*.
#
# Claude Code passes the tool call as JSON on stdin, e.g.:
#   {"tool_name": "Edit", "tool_input": {"file_path": "/abs/path/to/file", ...}}
#
# Exiting non-zero on stderr blocks the tool call and surfaces the message
# to Claude, which will then explain the block to the user.

set -euo pipefail

# Read JSON payload from stdin.
PAYLOAD="$(cat)"

# Extract file_path from the tool_input. Use python because macOS ships with
# python3 but not jq by default, and we don't want to add a dependency.
FILE_PATH="$(
  printf '%s' "$PAYLOAD" | python3 -c '
import json, sys
try:
    data = json.load(sys.stdin)
    ti = data.get("tool_input", {}) or {}
    # Edit/Write use file_path; MultiEdit uses file_path too.
    path = ti.get("file_path", "")
    print(path)
except Exception:
    print("")
'
)"

# If no file_path, allow (not our concern).
if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Normalize: match any path containing /knowledge-base/raw/ (absolute or
# relative), plus the bare knowledge-base/raw/ prefix.
case "$FILE_PATH" in
  */knowledge-base/raw/*|knowledge-base/raw/*)
    echo "Blocked: knowledge-base/raw/ is the source of truth and cannot be modified by Claude." >&2
    echo "If the raw file needs correction, the user should edit it manually." >&2
    echo "Blocked path: $FILE_PATH" >&2
    exit 2
    ;;
esac

exit 0
