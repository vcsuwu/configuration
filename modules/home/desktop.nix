{config, ...}: {
  xdg = {
    mimeApps = let
      mpv = ["mpv.desktop"];
      zathura = ["org.pwmt.zathura-pdf-mupdf.desktop"];

      associations = {
        "application/pdf" = zathura;
        "video/*" = mpv;
        "audio/*" = mpv;
      };
    in {
      enable = true;
      associations.added = associations;
      defaultApplications = associations;
    };
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
  };
}
