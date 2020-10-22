# Package

version       = "1.1.3"
author        = "Andreas Rumpf"
description   = "Karax is a framework for developing single page applications in Nim."
license       = "MIT"

# Dependencies

requires "nim >= 1.4.0"
requires "ws"
requires "dotenv"
skipDirs = @["examples", "experiments", "tests"]

bin = @["src/karax/tools/karun"]
installExt = @["nim"]


task tests, "Test all":
  exec "nim c -r tests/tester.nim"
