use voladdress::{Safe, VolSeries};

use crate::prelude::*;

pub const CHAR_DATA_4: VolSeries<Tile4bpp, Safe, Safe, 512, 32> =
    unsafe { VolSeries::new(0x0601_0000) };

pub const CHAR_DATA_8: VolSeries<Tile8bpp, Safe, Safe, 256, 64> =
    unsafe { VolSeries::new(0x0601_0000) };
