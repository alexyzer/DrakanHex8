#!/usr/bin/env sh
# Forge requires a configured set of both JVM and program arguments.
# Add custom JVM arguments to the user_jvm_args.txt
# Add custom program arguments {such as nogui} to this file in the next line before the "$@" or
#  pass them to this script directly
java -jar packwiz-installer-bootstrap.jar -g -s server "https://raw.githubusercontent.com/alexyzer/DrakanHex8/main/pack/pack.toml" -bootstrap-no-update
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.20.1-47.4.20/unix_args.txt "$@"
