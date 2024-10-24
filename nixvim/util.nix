{ lib, ... }:
let
  docmap = mapping: lib.attrsets.filterAttrs (n: v: n != "doc") mapping;
  single-key-action-map = (
    { key, action, ... }@mapping:
    {
      ${key} = {inherit action;} // (if mapping ? "options" then mapping.options else {});
    }
  );
  single-key-command-map = (
    { key, action, ... }@mapping:
    {
      ${key} = action;
    }
  );
  individual-transformer-set = {
    "none" = thing: thing;
    "key-action-map" = single-key-action-map;
    "key-command-map" = single-key-command-map;
  };
  list-transformer-set = {
    "none" = thing: thing;
    "key-action-map" = lib.attrsets.mergeAttrsList;
    "key-command-map" = lib.attrsets.mergeAttrsList;
  };
  parse-mapping-category = {attrPath, transformer, mappings, ...}:
    let
      individual-transformer = individual-transformer-set.${transformer};
      list-transformer = list-transformer-set.${transformer};
      transformed-list = map individual-transformer mappings;
      transformed-mappings = list-transformer transformed-list;
    in
    lib.attrsets.setAttrByPath attrPath transformed-mappings;
  parse-mapping-bundle = mapping-bundle: 
    let
      parsed-categories = map parse-mapping-category mapping-bundle;
    in
      lib.mkMerge parsed-categories;
in
{
  # Maps an attribute set of keymap to action, given a mode ("n", "v", "t", etc)
  # Allows a series of remaps to be declared in a much more concise way
  short-remaps =
    mode:
    lib.attrsets.mapAttrsToList (
      name: value: {
        inherit mode;
        key = name;
        action = value;
      }
    );

  concise-remaps = builtins.map (
    arr:
    let
      fixed-arr = (arr ++ [ { } ]); # "options" is optional
    in
    {
      mode = builtins.elemAt fixed-arr 0;
      key = builtins.elemAt fixed-arr 1;
      action = builtins.elemAt fixed-arr 2;
      options = builtins.elemAt fixed-arr 3;
    }
  );

  inherit docmap;

  docmap-list = builtins.map docmap;

  remaps-from-json = thepath: parse-mapping-bundle ((builtins.fromJSON (builtins.readFile thepath)).categories);
  
}
