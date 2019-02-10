# kakoune-system-loader
A simple way to load system-provided .kak scripts

# Installation
Make sure that the `$kak_runtime/autoload` directory exists, otherwise Kakoune will autoload all system files.

# Commands
After sourcing `system-loader.kak`, the following commands will be available:

## `ignore-system`
Add system files to the ignore list. Example: `ignore-system "base/doc"`.

## `load-system`
Load remaining system files. Should be executed after all `ignore-system` invocations.

# Todo
- Make logging to `*debug*` optional.
- Properly implement & document pattern ignores.
