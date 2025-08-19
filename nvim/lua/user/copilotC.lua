require("CopilotChat").setup({
  model = 'gpt-4.1',           -- AI model to use
  temperature = 0.5,           -- Lower = focused, higher = creative
  window = {
    layout = 'float',
    width = 80, -- Fixed width in columns
    height = 20, -- Fixed height in rows
    border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
    title = '🤖 AI Assistant',
    zindex = 100, -- Ensure window stays on top
  },

  headers = {
    user = '👤 You: ',
    assistant = '🤖 Copilot: ',
    tool = '🔧 Tool: ',
  },
  separator = '━━',
  show_folds = false, -- Disable folding for cleaner look
  auto_insert_mode = true,     -- Enter insert mode when opening
})
