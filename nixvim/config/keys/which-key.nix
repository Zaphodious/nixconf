{ config, lib, ... }:
let
  base-config = {
    plugins.which-key = {
      enable = true;
      settings = {
        expand = 3;
        win = {
          padding = [1 2];
          border = "rounded";
        };
        sort = [
          "group"
          "local"
          "order"
          "alphanum"
          "mod"
        ];
      };
    };
  };
  parseCategory =
    {
      category,
      mappings,
      ...
    }:
    {
      plugins.which-key.settings.spec = [
        {
          group = category;
          __unkeyed-1 = map (
            {
              key,
              options,
              ...
            }@mapping:
            {
              __unkeyed-1 = key;
              mode = mapping.mode or "n";
            }
            // options
          ) mappings;
        }
      ];
    };
  parse-mapping-bundle =
    mapping-bundle:
    let
      filtered-bundle = builtins.filter (cat: cat.which-key-include or true) mapping-bundle;
      parsed-categories = map parseCategory filtered-bundle;
      total-list = [ base-config ] ++ parsed-categories;
    in
    lib.mkMerge total-list;
  decs-from-json =
    thepath: parse-mapping-bundle ((builtins.fromJSON (builtins.readFile thepath)).categories);
in
decs-from-json ./remaps.json
