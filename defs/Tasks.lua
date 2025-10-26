---@meta

---@class Event
---@field WaitFor fun(self: Event,condition: fun(): boolean)
---@field RestartEvent fun(self: Event)
---@field EndEvent fun(self: Event)

---Register a function that runs once per frame. This is a good place to do low-level memory reads
---and writes.
---@param callback fun(deltaTime: number)
function InitializeTask(callback) end

---Register a coroutine that can pause while waiting for certain game states, much like an event in
---DarkScript.
---@param callback fun(self: Event)
function InitializeEvent(callback) end
