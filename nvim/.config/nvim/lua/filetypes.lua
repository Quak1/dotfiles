vim.filetype.add {
  extension = {
    tmpl = function(path, _)
      local go_mod = vim.fs.find('go.mod', {
        upward = true,
        path = vim.fs.dirname(path),
      })

      if #go_mod > 0 then
        return 'gotmpl'
      end

      return nil
    end,
  },
}
