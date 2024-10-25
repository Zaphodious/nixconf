#!/usr/bin/env bash
nix run github:jbboehr/handlebars.c -- -t ./nixvim-mappings.template.hbs -D ./remaps.json > ../../Remaps.md