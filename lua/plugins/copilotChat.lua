-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      model = 'gpt-4.1',
      temperature = 0, -- Lower = focused, higher = creative
      sticky = {
        '#buffers',
      },
      -- highlight_headers = false,
      highlight = {
        extmark = true,
      },
      headers = {
        user = ' ',
        assistant = ' ',
        tool = '󰊳 ',
      },
      separator = '━━',
      window = {
        layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
        width = 0.5, -- 50% of screen width
        border = 'solid', -- 'single', 'double', 'rounded', 'solid'
      },
      auto_fold = false,
      auto_insert_mode = false,
      pgompts = {
        NiceInstructions = {
          prompt = 'Explain this code like I am a beginner.',
          mapping = '<leader>cin',
          system_prompt = 'You are a nice coding tutor, so please respond in a friendly and helpful manner.',
        },
        MyCustomPrompt = {
          prompt = 'Explain how it works.',
          system_prompt = 'You are very good at explaining stuff',
          mapping = '<leader>cim',
          description = 'My custom prompt description',
        },
      },
      -- https://github.com/CopilotC-Nvim/CopilotChat.nvim?tab=readme-ov-file#functions
      functions = {},
    },
  },
}
