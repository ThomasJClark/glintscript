---@meta
Memory = {}

---@type number
Memory.Base = 0

---@type table<string, number>
Memory.Singletons = {}

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetU8(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetU16(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetU32(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetU64(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetI8(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetI16(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetI32(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetI64(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetF32(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetF64(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@return number
function Memory.GetPointer(base, pointerChain) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetU8(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetU16(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetU32(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetU64(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetI8(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetI16(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetI32(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetI64(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetF32(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetF64(base, pointerChain, value) end

---@param base number
---@param pointerChain number[] | nil
---@param value number
---@return boolean
function Memory.SetPointer(base, pointerChain, value) end
