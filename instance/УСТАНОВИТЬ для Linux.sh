#!/bin/bash
cd "$(dirname "$0")"
JAVA=""
[ -n "$JAVA_HOME" ] && [ -x "$JAVA_HOME/bin/java" ] && JAVA="$JAVA_HOME/bin/java"
if [ -z "$JAVA" ]; then
    IFS=$'\n'
    for d in "$HOME/.local/share/ModrinthApp/meta/java_versions/"* "$HOME/.tlauncher/jvms/"* /usr/lib/jvm/* /opt/java/*; do
        [ -x "$d/bin/java" ] && JAVA="$d/bin/java" && break
    done
    unset IFS
fi
[ -z "$JAVA" ] && command -v java >/dev/null && JAVA="$(command -v java)"
if [ -n "$JAVA" ]; then
    exec "$JAVA" -jar packwiz-installer-bootstrap.jar "https://raw.githubusercontent.com/alexyzer/DrakanHex8/main/pack/pack.toml" -bootstrap-no-update
fi
echo "Java not found" >&2
xdg-open "https://www.java.com/download/" 2>/dev/null
exit 1