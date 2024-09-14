{ pkgs, inputs, ... }: {
  extraPlugins = [
    inputs.cornelis.packages.cornelis-vim
  ];
  extraPackages = [
    inputs.cornelis.packages.cornelis
  ];
  globals.cornelis_use_global_binary = 1;
  #globals.cornelis_split_location = "bottom";
  globals.cornelis_agda_prefix = "<C-a>";
}
