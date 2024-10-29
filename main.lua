local http = require("socket.http")
local ltn12 = require("ltn12")

print("P or L?")
local input = string.lower(io.read())
local method = nil
local id = nil

local function send(method, id)
  local url = "https://gdbrowser.com/api/".. method .. "/".. id
  local response = {}

  local res, code, response_head = http.request{
    url = url,
    sink = ltn12.sink.table(response)
  }

  if res and code == 200 then
    return "API responded with: " .. table.concat(response)
  else
    return "Oops, error: " .. (code or "unknown")
  end
end

if input == "p" then
  method = "profile"
  print("Insert ID:")
  local profile_id = io.read('*n')
  if profile_id and profile_id > 0 then
    print(send(method, profile_id))
  else
    print("Invalid ID entered.")
  end
elseif input == "l" then
  method = "level"
  print("Insert ID:")
  local level_id = io.read('*n')
  if level_id and level_id >= 256 then
    print(send(method, level_id))
  else
    print("Invalid ID entered.")
  end
else
  print("Invalid option. Please enter 'P' or 'L'.")
end
