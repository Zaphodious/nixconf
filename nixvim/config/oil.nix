{ lib, config, ... }:
{
    plugins.oil = {
        enable = true;
        settings = {
            delete-to-trash = true;

            view-options.show-hidden = true;
            };
    };

}
