#! /usr/bin/env bash

rm -f colors.nix
rm -f plugins.nix

go run main.go
nu colors.nu

alejandra colors.nix plugins.nix
