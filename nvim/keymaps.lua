-- キーマップ設定

-- Esc2回でハイライトを消す
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", { noremap = true, silent = true })

-- 検索する際にハイライトON
vim.keymap.set("n", "/", ":<C-u>set hlsearch<Return>/", { noremap = true })
vim.keymap.set("n", "?", ":<C-u>set hlsearch<Return>?", { noremap = true })
vim.keymap.set("n", "*", ":<C-u>set hlsearch<Return>*", { noremap = true })
vim.keymap.set("n", "#", ":<C-u>set hlsearch<Return>#", { noremap = true })

-- 0で行末に移動
vim.keymap.set("", "0", "$", { noremap = true })

-- 1で行頭に移動
vim.keymap.set("", "1", "0", { noremap = true })

-- Ctrl押しながらでスピードアップ
vim.keymap.set("", "<C-j>", "jjj", { noremap = true })
vim.keymap.set("", "<C-k>", "kkk", { noremap = true })
vim.keymap.set("", "<C-h>", "hhh", { noremap = true })
vim.keymap.set("", "<C-l>", "lll", { noremap = true })
vim.keymap.set("", "<C-w>", "ww", { noremap = true })
-- vim.keymap.set('', '<C-b>', 'bb', { noremap = true })  -- コメントアウト

-- jjでエスケープ
vim.keymap.set("i", "jj", "<esc>", {})

-- Enterで空行追加
vim.keymap.set("", "<Enter>", "o<esc>", { noremap = true })

-- インサートモードでカーソル移動
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true })

-- 画面分割
-- s hjklで画面分割間を移動
vim.keymap.set("n", "sj", "<C-w>j", { noremap = true })
vim.keymap.set("n", "sk", "<C-w>k", { noremap = true })
vim.keymap.set("n", "sl", "<C-w>l", { noremap = true })
vim.keymap.set("n", "sh", "<C-w>h", { noremap = true })

-- s HJKLで分割した画面を移動させる
vim.keymap.set("n", "sJ", "<C-w>J", { noremap = true })
vim.keymap.set("n", "sK", "<C-w>K", { noremap = true })
vim.keymap.set("n", "sL", "<C-w>L", { noremap = true })
vim.keymap.set("n", "sH", "<C-w>H", { noremap = true })

-- タブ関連
-- st 新規タブ sn,spでタブ移動
vim.keymap.set("n", "sn", "gt", { noremap = true })
vim.keymap.set("n", "sp", "gT", { noremap = true })

-- 画面移動
-- 注意: 元のコードに typo があります (norempa -> noremap)
vim.keymap.set("", "<C-g>", "<C-b>", { noremap = true })
