package main


deny[msg] {
  not to_number(input.version) == 0.1
  msg = "we only support flavour version 0.1"
}

deny[msg] {
  not input.install.command
  msg = "install:command not found"
}

deny[msg] {
  input.install.command == null
  msg = "install:command is empty"
}
