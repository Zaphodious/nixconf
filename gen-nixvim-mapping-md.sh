#!/usr/bin/env bash
nix run github:jbboehr/handlebars.c -- -t ./template/nixvim-mappings.template.hbs -D ./nixvim/config/remaps.json > ./NixvimRemaps.md