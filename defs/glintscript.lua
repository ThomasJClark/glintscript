---@meta

glint = {}

---@type number
glint.memory.base = 0

---@type table<string, number>
glint.memory.singletons = {}

---@alias memory_getter fun(base: number, pointer_chain: number[] | nil): number | nil
---@alias memory_setter fun(base: number, pointer_chain: number[] | nil, value: number): boolean

---@type memory_getter
function glint.memory.get_u8() end

---@type memory_getter
function glint.memory.get_u16() end

---@type memory_getter
function glint.memory.get_u32() end

---@type memory_getter
function glint.memory.get_u64() end

---@type memory_getter
function glint.memory.get_i8() end

---@type memory_getter
function glint.memory.get_i16() end

---@type memory_getter
function glint.memory.get_i32() end

---@type memory_getter
function glint.memory.get_i64() end

---@type memory_getter
function glint.memory.get_f32() end

---@type memory_getter
function glint.memory.get_f64() end

---@type memory_getter
function glint.memory.get_pointer() end

---@type memory_setter
function glint.memory.set_u8() end

---@type memory_setter
function glint.memory.set_u16() end

---@type memory_setter
function glint.memory.set_u32() end

---@type memory_setter
function glint.memory.set_u64() end

---@type memory_setter
function glint.memory.set_i8() end

---@type memory_setter
function glint.memory.set_i16() end

---@type memory_setter
function glint.memory.set_i32() end

---@type memory_setter
function glint.memory.set_i64() end

---@type memory_setter
function glint.memory.set_f32() end

---@type memory_setter
function glint.memory.set_f64() end

---@type memory_setter
function glint.memory.set_pointer() end

---@param bank number
---@param id number
---@param args number[]
function glint.emevd(bank, id, args) end
