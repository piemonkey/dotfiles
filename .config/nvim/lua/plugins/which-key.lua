local wk = require('which-key')

wk.setup {
  -- new default with longer delay, gets { keys: string, mode: string, plugin?: string }
  delay = function(ctx)
    return ctx.plugin and 0 or 800
  end
  -- copied from defaults and tweaked. I can't remember why now...
  -- triggers_nowait = {
  --   -- marks
  --   -- "`",
  --   -- "'",
  --   "g`",
  --   "g'",
  --   -- registers
  --   -- '"',
  --   "<c-r>",
  --   -- spelling
  --   "z=",
  -- },
}
