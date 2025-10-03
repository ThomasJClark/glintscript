use eldenring::{
    Tree,
    cs::{BlockId, CSEzRabbitNoUpdateTask},
    dlkr::DLAllocatorRef,
};
use fromsoftware_shared::{OwnedPtr, Program, singleton};
use pelite::pe64::PeObject;
use std::{
    mem,
    ptr::{NonNull, null},
};

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
            compound_key: if slot < 0 { id } else { id + slot as i32 },
        }
    }
}

#[repr(C)]
pub struct CSEventIns {
    vftable: usize,
    unk8: [u8; 0x98],
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
    pub fn new(bank: u32, id: u32) -> Self {
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
    pub instruction: *const EmkInstruction,
    pub args: *const i32,
    unke0: [u8; 0x150],
}

impl CSEmkEventIns {
    pub fn new(id: &EmkEventId, args_data: Option<&[u8]>, block_id: BlockId) -> Box<Self> {
        let ctor: extern "C" fn(&Self, &EmkEventId, &[usize; 2], *const u8, u32, BlockId, BlockId) =
            unsafe { mem::transmute(Program::current().image_base() + 0x582700) };

        let new = Box::new(unsafe { mem::zeroed() });

        let unk: [usize; 2] = [0; 2];

        ctor(
            &new,
            id,
            &unk,
            args_data.map_or(null(), |data| data.as_ptr()),
            args_data.map_or(0, |data| data.len() as u32),
            block_id,
            block_id,
        );

        new
    }
}

impl Drop for CSEmkEventIns {
    fn drop(&mut self) {
        let dtor: extern "C" fn(&Self) =
            unsafe { mem::transmute(Program::current().image_base() + 0x5828d0) };

        dtor(self);
    }
}

#[repr(C)]
pub struct EmkClasses {
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

#[repr(C)]
#[singleton("CSEmkSystem")]
pub struct CSEmkSystem {
    pub event: Option<NonNull<CSEmkEventIns>>,
    unk8: usize,
    unk10: usize,
    unk18: usize,
    unk20: usize,
    pub instruction_classes: OwnedPtr<EmkClasses>,
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
