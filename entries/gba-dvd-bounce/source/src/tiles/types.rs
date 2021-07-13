use crate::prelude::*;

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
pub struct Tile4bpp([u32; 8]);

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
pub struct Tile8bpp([u32; 16]);

pub trait Tile {
    fn new_tile() -> Self;
    fn write(&mut self, ind: usize, t: u32);
    fn copy_to_block(self, ind: usize);
}

impl Tile for Tile4bpp {
    fn new_tile() -> Self {
        Tile4bpp::default()
    }
    fn write(&mut self, ind: usize, t: u32) {
        self.0[ind] = t;
    }
    fn copy_to_block(self, ind: usize) {
        CHAR_DATA_4.index(ind).write(self);
    }
}

impl Tile for Tile8bpp {
    fn new_tile() -> Self {
        Tile8bpp::default()
    }
    fn write(&mut self, ind: usize, t: u32) {
        self.0[ind] = t;
    }
    fn copy_to_block(self, ind: usize) {
        CHAR_DATA_8.index(ind).write(self);
    }
}
