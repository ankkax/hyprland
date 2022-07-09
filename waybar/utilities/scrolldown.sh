#!/bin/sh

active=$(hyprctl monitors | grep active | cut -c20,21)

case $active in
2*)
	hyprctl dispatch workspace 1
	;;
3*)
	hyprctl	dispatch workspace 2
	;;
4*)
	hyprctl	dispatch workspace 3
	;;
5*)
	hyprctl	dispatch workspace 4
	;;
6*)
	hyprctl	dispatch workspace 5
	;;
7*)
	hyprctl	dispatch workspace 6
	;;
8*)
	hyprctl	dispatch workspace 7
	;;
9*)
	hyprctl dispatch workspace 8
	;;

esac
