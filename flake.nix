{
  description = "A collection of opinionated flake templates";

  outputs =
    { self }:
    {
      templates = {
        rust = {
          path = ./templates/rust;
          description = "Rust development environment with fenix";
        };

        defaultTemplate = self.templates.rust;
      };
    };
}
