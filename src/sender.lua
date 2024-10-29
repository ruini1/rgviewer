-- old and borken wtf

local socket = require("http.socket") -- assuming that it works

function send(method, id)
  local url = "https://gdbrowser.com/api/"..method"/"..id
  local response = {}

  local res,code,response_head = http.request{
    url = url,
    sink = ltn12.sink.table(response)
  }

  -- get the actual thing
  if response = "200" then
    local out = print("api responded with: " .. table.concat(response))
    return out -- hopefully this actually works lmao
  else
    local out = ("oops" .. code)
    return out
  end
end
