use eldenring::{
    Tree,
    cs::{BlockId, CSEzRabbitNoUpdateTask},
    dlkr::DLAllocatorRef,
};
use fromsoftware_shared::{OwnedPtr, Program, singleton};
use pelite::pe64::Pe;
use std::{
    mem::{MaybeUninit, transmute},
    ptr::{NonNull, null},
};

type CSEmkEventInsCtor =
    extern "C" fn(*mut CSEmkEventIns, &EmkEventId, &[usize; 2], *const u8, u32, BlockId, BlockId);
type CSEmkEventInsDtor = extern "C" fn(*mut CSEmkEventIns);
type EmkInstructionBanksExecute = extern "C" fn(*mut EmkInstructionBanks, f32, &CSEmkEventIns);

#[repr(C)]
pub struct EmkEventId {
    pub id: i32,
    pub slot: i32,
    pub compound_key: i32,
}

impl EmkEventId {
    pub fn new(id: i32, slot: i32) -> Self {
        Self {
            id,
            slot,
            compound_key: if slot < 0 { id } else { id + slot },
        }
    }
}

#[repr(C)]
pub struct CSEmkCondition {
    vftable: usize,
    unk8: usize,
    pub next: Option<OwnedPtr<CSEmkCondition>>,
    pub result: bool,
    _pad19: [u8; 0x7],
    unk20: usize,
}

#[repr(C)]
pub struct EventConditionSet {
    unk0: usize,
    unk8: usize,
    unk10: usize,
    pub head: Option<OwnedPtr<CSEmkCondition>>,
    pub tail: Option<OwnedPtr<CSEmkCondition>>,
}

#[repr(C)]
pub struct CSEventIns {
    vftable: usize,
    unk8: [u8; 0x38],
    pub conditions: EventConditionSet,
    unk68: [u8; 0x38],
}

#[repr(C)]
pub struct EmkInstruction {
    pub bank: u32,
    pub id: u32,
    unk8: usize,
    unk10: usize,
    unk18: usize,
    unk20: usize,
}

impl EmkInstruction {
    pub const fn new(bank: u32, id: u32) -> Self {
        Self {
            bank,
            id,
            unk8: 0,
            unk10: 0,
            unk18: 0,
            unk20: 0,
        }
    }
}

#[repr(C)]
pub struct CSEmkEventIns {
    pub base: CSEventIns,
    unka0: [u8; 0x30],
    pub next_instruction: *const EmkInstruction,
    pub next_instruction_args: *const u8,
    unke0: [u8; 0x150],
}

impl CSEmkEventIns {
    /**
     * Allocate a new event with the given ID, arguments, and map
     */
    pub fn new(id: EmkEventId, args_data: Option<&[u8]>, map_id: Option<BlockId>) -> Self {
        let ctor: CSEmkEventInsCtor =
            unsafe { transmute(Program::current().rva_to_va(0x582700).unwrap()) };

        let mut new: MaybeUninit<Self> = MaybeUninit::uninit();

        let unk = [0usize; 2];

        ctor(
            new.as_mut_ptr(),
            &id,
            &unk,
            args_data.map_or(null(), |data| data.as_ptr()),
            args_data.map_or(0, |data| data.len() as u32),
            map_id.unwrap_or(BlockId::none()),
            map_id.unwrap_or(BlockId::none()),
        );

        unsafe { new.assume_init() }
    }
}

impl Drop for CSEmkEventIns {
    /**
     * Call the destructor when an event is dropped. This frees up memory allocated by the game,
     * and unregisters a task that would cause the event to continue running otherwise
     */
    fn drop(&mut self) {
        let dtor: CSEmkEventInsDtor =
            unsafe { transmute(Program::current().rva_to_va(0x5828d0).unwrap()) };

        dtor(self);
    }
}

#[repr(C)]
pub struct EmkInstructionBanks {
    pub control_flow_system: usize,
    pub control_flow_timer: usize,
    unk10: usize,
    unk18: usize,
    pub control_flow_character: usize,
    pub control_flow_asset: usize,
    pub sfx: usize,
    pub message: usize,
    pub camera: usize,
    pub script: usize,
    pub sound: usize,
    pub hit: usize,
    pub map: usize,
    unk68: usize,
    unk70: usize,
    unk78: usize,
    unk80: usize,
}

impl EmkInstructionBanks {
    pub fn execute(&mut self, time: f32, event: &CSEmkEventIns) {
        let execute: EmkInstructionBanksExecute =
            unsafe { transmute(Program::current().rva_to_va(0x567e00).unwrap()) };

        execute(self, time, event);
    }
}

#[repr(C)]
#[singleton("CSEmkSystem")]
pub struct CSEmkSystem {
    pub event: Option<NonNull<CSEmkEventIns>>,
    unk8: usize,
    unk10: usize,
    unk18: usize,
    unk20: usize,
    pub instruction_banks: OwnedPtr<EmkInstructionBanks>,
    unk30: usize,
    unk38: usize,
    unk40: usize,
    unk48: i32,
    _pad4c: [u8; 4],
    pub unk50: CSEzRabbitNoUpdateTask,
    unk70: usize,
    unk78: usize,
    pub unk80: CSEzRabbitNoUpdateTask,
    unka0: usize,
    unka8: usize,
    pub unkb0: Tree<usize>,
    pub allocator2: DLAllocatorRef,
    unkd0: usize,
    unkd8: usize,
    unke0: usize,
    _pade8: [u8; 8],
    unkf0: usize,
    unkf8: i32,
    unkfc: i32,
    pub unk108: Tree<usize>,
    _pad118: [u8; 8],
    pub event2: Option<NonNull<CSEmkEventIns>>,
}
