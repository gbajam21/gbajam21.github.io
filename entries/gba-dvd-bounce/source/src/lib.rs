#![no_std]
#![feature(isa_attribute)]

pub mod prelude {
    pub use crate::assets::*;

    pub use crate::{address::*, collision::*, irq::*, misc::*, sprite::*, tiles::*};
}

const GBA_WIDTH: i16 = 240;
const GBA_HEIGHT: i16 = 160;

mod assets;

pub mod address;
pub mod collision;
pub mod irq;
pub mod misc;
pub mod sprite;
pub mod tiles;
