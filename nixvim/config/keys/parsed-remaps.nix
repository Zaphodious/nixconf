{ lib, ... }:
let
  single-key-action-map = (
    { key, action, ... }@mapping:
    {
      ${key} = action; # {inherit action;} // (if mapping ? "options" then mapping.options else {});
    }
  );
  single-key-command-map = (
    { key, action, ... }@mapping:
    {
      ${key} = {
        command = action;
      };
    }
  );
  user-command-map = (
    {
      key,
      action,
      options,
      ...
    }@mapping:
    {
      ${key} = {
        command = action;
      } // options;

    }
  );
  single-simple-action-key-map = (
    { key, action, ... }:
    {
      ${action} = key;
    }
  );
  individual-transformer-set = {
    "none" = thing: thing;
    "ignored" = thing: { };
    "key-action-map" = single-key-action-map;
    "key-command-map" = single-key-command-map;
    "simple-action-key-map" = single-simple-action-key-map;
    "user-command-map" = user-command-map;
  };
  list-transformer-set = {
    "none" = thing: thing;
    "ignored" = thing: { };
    "key-action-map" = thing: (lib.attrsets.mergeAttrsList thing);
    "key-command-map" = lib.attrsets.mergeAttrsList;
    "simple-action-key-map" = lib.attrsets.mergeAttrsList;
    "user-command-map" = lib.attrsets.mergeAttrsList;
  };
  parse-mapping-category =
    {
      attrPath,
      transformer,
      mappings,
      ...
    }:
    let
      individual-transformer = individual-transformer-set.${transformer};
      list-transformer = list-transformer-set.${transformer};
      transformed-list = map individual-transformer mappings;
      transformed-mappings = list-transformer transformed-list;
    in
    lib.attrsets.setAttrByPath attrPath transformed-mappings;
  parse-mapping-bundle =
    mapping-bundle:
    let
      parsed-categories = map parse-mapping-category mapping-bundle;
    in
    lib.mkMerge parsed-categories;
  remaps-from-json =
    thepath: parse-mapping-bundle ((builtins.fromJSON (builtins.readFile thepath)).categories);
in
remaps-from-json ./remaps.json
