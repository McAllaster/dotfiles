#!/bin/sh

echo '\x1B'
echo -e "\x1B[1mbold\x1B[0m"
echo -e "\x1B[3mitalic\x1B[0m"
echo -e "\x1B[4munderline\x1B[0m"
echo -e "\x1B[9mstrikethrough\x1B[0m"
echo -e "\x1B[31mred text\x1B[0m"

echo '\033'
echo -e "\033[1mbold\033[0m"
echo -e "\033[3mitalic\033[0m"
echo -e "\033[4munderline\033[0m"
echo -e "\033[9mstrikethrough\033[0m"
echo -e "\033[31mred text\033[0m"

echo '\e'
echo -e "\e[1mbold\e[0m"
echo -e "\e[3mitalic\e[0m"
echo -e "\e[4munderline\e[0m"
echo -e "\e[9mstrikethrough\e[0m"
echo -e "\e[31mred text\e[0m"
