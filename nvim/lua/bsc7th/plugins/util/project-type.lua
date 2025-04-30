local M = {}

function M.is_astro_project()
  return vim.fn.filereadable("astro.config.mjs") == 1 or vim.fn.filereadable("astro.config.ts") == 1
end

function M.is_svelte_project()
  return vim.fn.filereadable("svelte.config.js") == 1
    or vim.fn.filereadable("svelte.config.ts") == 1
end

function M.is_next_project()
  return vim.fn.filereadable("next.config.js") == 1 or vim.fn.filereadable("next.config.ts") == 1
end

function M.is_node_project()
  return vim.fn.filereadable("package.json") == 1
end

function M.is_bun_project()
  return vim.fn.filereadable("bun.lockb") == 1
end

return M
