---@meta

---Register a coroutine that can pause while waiting for certain game states, much like an event in
---DarkScript.
---@param callback fun()
function InitializeEvent(callback) end

---@param callback fun(): boolean
function WaitFor(callback) end

function EndEvent() end

function RestartEvent() end

---Register a callback that runs once per frame.
---@param callback fun()
function RegisterTask(callback) end
