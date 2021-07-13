use gba::debug;

use crate::{GBA_HEIGHT, GBA_WIDTH};
/// 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
/// t   b   l   r
#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
pub struct CollisionBitField(u8);

impl CollisionBitField {
    pub fn new() -> Self {
        Self(0)
    }
    pub fn num_collisions(&self) -> u32 {
        self.0.count_ones()
    }
    pub fn set_top(&mut self, b: bool) {
        if b {
            self.0 |= 1 << 0;
        } else {
            self.0 &= !(1 << 0);
        }
    }
    pub fn set_bottom(&mut self, b: bool) {
        if b {
            self.0 |= 1 << 1;
        } else {
            self.0 &= !(1 << 2);
        }
    }
    pub fn set_left(&mut self, b: bool) {
        if b {
            self.0 |= 1 << 2;
        } else {
            self.0 &= !(1 << 2);
        }
    }
    pub fn set_right(&mut self, b: bool) {
        if b {
            self.0 |= 1 << 3;
        } else {
            self.0 &= !(1 << 3);
        }
    }

    pub fn top(&self) -> bool {
        (self.0 & (1 << 0)) != 0
    }
    pub fn bottom(&self) -> bool {
        (self.0 & (1 << 1)) != 0
    }
    pub fn left(&self) -> bool {
        (self.0 & (1 << 2)) != 0
    }
    pub fn right(&self) -> bool {
        (self.0 & (1 << 3)) != 0
    }
}

#[derive(Debug, Clone, Copy, Default, PartialEq, Eq)]
pub struct BoundingBox {
    pub x: i16,
    pub y: i16,
    w: i16,
    h: i16,
}

impl BoundingBox {
    pub const fn new() -> Self {
        BoundingBox { x: 0, y: 0, w: 0, h: 0 }
    }
    #[inline]
    pub fn left(self) -> i16 {
        self.x
    }
    #[inline]
    pub fn right(self) -> i16 {
        self.x + self.w
    }
    #[inline]
    pub fn top(self) -> i16 {
        self.y
    }
    #[inline]
    pub fn bottom(self) -> i16 {
        self.y + self.h
    }
    pub const fn with_size(self, w: i16, h: i16) -> Self {
        Self { x: self.x, y: self.y, w, h }
    }
    pub const fn with_pos(self, x: i16, y: i16) -> Self {
        Self { x, y, w: self.w, h: self.h }
    }
    pub fn is_outside(&mut self, other: BoundingBox) -> CollisionBitField {
        let mut col = CollisionBitField::new();
        if self.x >= GBA_WIDTH * 5 {
            // want to still be above the full width
            self.x -= GBA_WIDTH * 3;
        }
        if self.y >= GBA_HEIGHT * 5 {
            // want to still be above the full height
            self.y -= GBA_HEIGHT * 3;
        }
        if self.left() < other.left() {
            debug!("Left hit");
            col.set_left(true);
        }
        if self.right() > other.right() {
            debug!("Right hit");
            col.set_right(true);
        }
        if self.top() < other.top() {
            debug!("Top hit");
            col.set_top(true);
        }
        if self.bottom() > other.bottom() {
            debug!("Bottom hit");
            col.set_bottom(true);
        }
        col
    }
}
