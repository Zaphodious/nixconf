{
  plugins = {
    fugitive.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gs";
      action = ":Git";
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = ":Git push";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = ":Git add -A | :Git commit";
    }
  ];

}
