{lib, ...}: 
{
  # Maps an attribute set of keymap to action, given a mode ("n", "v", "t", etc)
  # Allows a series of remaps to be declared in a much more concise way
  short-remaps = mode: lib.attrsets.mapAttrsToList (name: value: 
    {
      inherit mode;
      key = name;
      action = value;
    });

  concise-remaps = builtins.map (arr:
  let
    fixed-arr = (arr ++ [{}]); # "options" is optional
  in
  {
    mode = builtins.elemAt fixed-arr 0;
    key = builtins.elemAt fixed-arr 1;
    action = builtins.elemAt fixed-arr 2;
    options = builtins.elemAt fixed-arr 3;
  });
}
