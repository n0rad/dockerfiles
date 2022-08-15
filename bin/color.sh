
echo_red() {
  echo -e "\033[0;31m$*\033[0m"
}

echo_green() {
  echo -e "\033[0;32m$*\033[0m"
}

echo_bright_red() {
  echo -e "\e[101m$*\e[0;m"
}