local sender = require("./src/sender")
io.write("p or l")

if io.read("P") or io.read("p") then
  -- do sht
  io.write("
  ")
  sender:send(profile)
end
