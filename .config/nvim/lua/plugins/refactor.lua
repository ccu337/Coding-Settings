return {
  'ThePrimeagen/refactoring.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  keys = {
    { '<leader>r', '', desc = '[R]efactor' },
    {
      '<leader>rs',
      function()
        require('telescope').extensions.refactoring.refactors()
      end,
      mode = 'v',
      desc = '[R]efactor: [S]elect refactoring',
    },
    {
      '<leader>ri',
      function()
        require('refactoring').refactor('Inline Variable')
      end,
      mode = { 'n', 'v' },
      desc = '[R]efactor: [I]nline Variable',
    },
    {
      '<leader>rI',
      function()
        require('refactoring').refactor('Inline Function')
      end,
      mode = { 'n', 'v' },
      desc = '[R]efactor: [I]nline Function',
      {
        '<leader>rb',
        function()
          require('refactoring').refactor('Extract Block')
        end,
        desc = '[R]efactor: Extract [B]lock',
      },
      {
        '<leader>rB',
        function()
          require('refactoring').refactor('Extract Block To File')
        end,
        desc = '[R]efactor: Extract [B]lock To File',
      },
      {
        '<leader>rf',
        function()
          require('refactoring').refactor('Extract Function')
        end,
        mode = 'v',
        desc = '[R]efactor: Extract [f]unction',
      },
      {
        '<leader>rF',
        function()
          require('refactoring').refactor('Extract Function To File')
        end,
        mode = 'v',
        desc = '[R]efactor: Extract [F]unction To File',
      },
      {
        '<leader>rv',
        function()
          require('refactoring').refactor('Extract Variable')
        end,
        mode = 'v',
        desc = '[R]efactor: Extract [V]ariable',
      },
      {
        '<leader>rP',
        function()
          require('refactoring').debug.printf({ below = false })
        end,
        desc = '[R]efactor: Debug [P]rint',
      },
      {
        '<leader>rp',
        function()
          require('refactoring').debug.print_var()
        end,
        mode = 'v',
        desc = '[R]efactor: Debug [P]rint Variable',
      },
      {
        '<leader>rp',
        function()
          require('refactoring').debug.print_var({ normal = true })
        end,
        desc = '[R]efactor: Debug [P]rint Variable',
      },
      {
        '<leader>rc',
        function()
          require('refactoring').debug.cleanup({})
        end,
        desc = '[R]efactor: Debug [C]leanup',
      },
    },
    opts = {
      prompt_func_return_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      prompt_func_param_type = {
        go = false,
        java = false,
        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
      },
      printf_statements = {},
      print_var_statements = {},
      show_success_message = true, -- shows a message with information about the refactor on success
      -- i.e. [Refactor] Inlined 3 variable occurrences
    },
    config = function(_, opts)
      require('refactoring').setup(opts)
      if LazyVim.has('telescope.nvim') then
        LazyVim.on_load('telescope.nvim', function()
          require('telescope').load_extension('refactoring')
        end)
      end
    end,
  },
}
