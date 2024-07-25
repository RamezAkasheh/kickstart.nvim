-- Function to create a directory in Downloads with the name of the open file without the extension
function D()
  -- Get the full path of the current file
  local filepath = vim.fn.expand '%:p'

  -- Get the filename without the extension
  local filename = vim.fn.fnamemodify(filepath, ':t:r')

  -- Path to the Downloads directory
  local downloads_dir = '~/Downloads/' .. filename

  -- Create the directory
  vim.fn.mkdir(vim.fn.expand(downloads_dir), 'p')

  -- Print a message to confirm
  print('Created directory: ' .. downloads_dir)
end

function RmDir(path_to_delete)
  -- Define the path relative to the current working directory (CWD)
  -- local path_to_delete = vim.fn.getcwd() .. '\\packNgOra\\kafka\\data\\zk\\version-2'

  -- Execute the command to delete the directory
  local delete_command = 'rm -rf "' .. path_to_delete .. '"'

  -- For Windows use rd command
  if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
    delete_command = 'rmdir /S /Q "' .. path_to_delete .. '"'
  end

  -- Execute the delete command
  os.execute(delete_command)

  -- Print a message to confirm
  print('Deleted directory: ' .. path_to_delete)
end
function ResetZoo()
  RmDir(vim.fn.getcwd() .. '\\kafka\\data\\zk\\version-2')
  RmDir(vim.fn.getcwd() .. '\\kafka\\runtime\\kafka')
  RmDir(vim.fn.getcwd() .. '\\kafka\\runtime\\zookeeper')
end

return {}
