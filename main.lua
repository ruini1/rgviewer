local http = require("http")
local socket = require("socket.http") -- assuming that it works
local ltn12 = require("ltn12")

print("P or L?")
local input = string.lower(io.read())
local method = nil
local id = nil

local function send(method, id)
  local url = "https://gdbrowser.com/api/".. method .. "/".. id
  local response = {}

  local res,code,response_head = http.request{
    url = url,
    sink = ltn12.sink.table(response)
  }

  -- get the actual thing
  if code == 200 then
    local out = print("api responded with: " .. table.concat(response))
    return out -- hopefully this actually works lmao
  else
    local out = ("oops" .. code)
    return out
  end
end


if input == "p" then
  method = "profile"
  print("insert id")
  input = io.read('*n')
  if input ~= nil and input > 0 then -- still very barebones (lmao)
    send(method, input)
  end
elseif input == "l" then
  method = "level
  print("insert id")
  input = io.read('*n')
  if input ~= nil and input >= 256 then
    send(method, input)
  end
end
