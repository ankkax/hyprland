#!/bin/sh

active=$(hyprctl monitors | grep active | cut -c20,21)

case $active in
1*)
	hyprctl dispatch workspace 2
	;;
2*)
	hyprctl	dispatch workspace 3
	;;
3*)
	hyprctl	dispatch workspace 4
	;;
4*)
	hyprctl	dispatch workspace 5
	;;
5*)
	hyprctl	dispatch workspace 6
	;;
6*)
	hyprctl	dispatch workspace 7
	;;
7*)
	hyprctl	dispatch workspace 8
	;;
8*)
	hyprctl dispatch workspace 9
	;;

esac
