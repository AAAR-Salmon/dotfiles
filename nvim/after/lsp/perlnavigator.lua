return {
  root_markers = { 'cpanfile', 'cpanfile.snapshot', '.git' },
  settings = {
    perlnavigator = {
      perlPath = 'perl',
      enableWarnings = true,
      perlcriticEnabled = true,
      -- carton install / carmel rollout で作られる
      -- local/lib/perl5 を @INC に追加する
      -- $workspaceFolder はプロジェクトルートに展開される
      includePaths = {
        '$workspaceFolder/local/lib/perl5',
        '$workspaceFolder/lib',
      },
    },
  },
}
