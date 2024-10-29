local http = require("socket.http")
local ltn12 = require("ltn12")

--print("P or L?")
local input = string.lower(io.read())

local function send(method)
  local url = "http://127.0.0.1:5000/api/" .. method .. "/"
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

if input == "hello" then
    print(send(input))
  end
elseif input == "data" then
    print(send(input))
  end
else
  print("enter a valid endpoint")
end
