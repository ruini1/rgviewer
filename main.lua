local sender = require("./src/sender")
print("P or L?")
local input = string.lower(io.read())
local method
local id = nil

if input == "p" then
  method = "profile"
  print("insert id")
  input = io.read(*number)
  if input ~- nil and input >= 246 then -- still very barebones (lmao)
    sender:send(method, input)
  end
end
