import { defineConfig } from "https://deno.land/x/gh_rd/mod.ts";

export default defineConfig({
  tools: [
    { name: "bootandy/dust" },
    { name: "BurntSushi/ripgrep" },
    { name: "chmln/sd" },
    { name: "ismaelgv/rnr" },
    {
      name: "jqlang/jq",
      executables: [
        { glob: "jq-*", as: "jq" }
      ]
    },
    { name: "junegunn/fzf" },
    { name: "rossmacarthur/sheldon" },
    { name: "sharkdp/bat" },
    { name: "sharkdp/fd" },
    { name: "upx/upx" },
  ],
});
