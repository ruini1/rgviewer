local socket = require("http.socket") -- assuming that it works
local a
local method
local profile
local id


function send(type)
  local url = "https://gdbrowser.com/api/"..method"/"..id
  local response = {}

  local res,code,response_head = http.request{
    url = url,
    sink = ltn12.sink.table(response)
  }

  -- get the actual thing
  if response = "200" then
    print("api responded with: " .. table.concat(response))
  else
    error("oops" .. code)
  end
end
