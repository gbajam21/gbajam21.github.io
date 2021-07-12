use gba::prelude::*;

use crate::collision::BoundingBox;

use super::dimensions::SpriteDimensions;

pub struct Obj {
    /// GBA obj attributes
    pub attr0: ObjAttr0,
    pub attr1: ObjAttr1,
    pub attr2: ObjAttr2,
    /// Bounding box used for collision
    pub bounding_box: BoundingBox,
}

impl Obj {
    pub fn new(x: i16, y: i16, w: i16, h: i16) -> Self {
        Obj {
            attr0: ObjAttr0::new().with_y_pos(y as u16),
            attr1: ObjAttr1::new().with_x_pos(x as u16),
            attr2: ObjAttr2::new(),
            bounding_box: BoundingBox::new().with_pos(x, y).with_size(w, h),
        }
    }
    /// Set sprite dimensions
    #[inline(always)]
    pub fn set_dim(&mut self, dim: &SpriteDimensions) {
        self.set_size(dim);
        self.set_shape(dim);
    }
    /// Set sprite size
    #[inline(always)]
    pub fn set_size(&mut self, dim: &SpriteDimensions) {
        self.attr1.set_obj_size(dim.size());
    }
    /// Set sprite shape
    #[inline(always)]
    pub fn set_shape(&mut self, dim: &SpriteDimensions) {
        self.attr0.set_obj_shape(dim.shape());
    }

    /// Move relative sprite position
    #[inline]
    pub fn move_pos(&mut self, dx: i16, dy: i16) {
        self.move_x(dx);
        self.move_y(dy)
    }

    /// Move relative x position
    #[inline(always)]
    fn move_x(&mut self, dx: i16) {
        self.bounding_box.x = self.bounding_box.x.wrapping_add(dx);
        self.attr1.set_x_pos(self.bounding_box.x as u16);
    }
    /// Move relative x position
    #[inline(always)]
    fn move_y(&mut self, dy: i16) {
        self.bounding_box.y = self.bounding_box.y.wrapping_add(dy);
        self.attr0.set_y_pos(self.bounding_box.y as u16);
    }
    /// Set palbank index
    /// Valid sizes: 0..=15
    pub fn set_pal_ind(&mut self, ind: u16) {
        self.attr2.set_palbank_index(ind);
    }
    /// Set beginning tile index for sprite
    /// Valid sizes: 0..=1023=Tile Number ????
    pub fn set_tile_ind(&mut self, ind: u16) {
        self.attr2.set_tile_index(ind);
    }
    pub fn x(&self) -> i16 {
        self.bounding_box.x
    }
    pub fn y(&self) -> i16 {
        self.bounding_box.y
    }

    /// Copy all 3 attributes to `ind` Obj slot in OAM
    #[inline]
    pub fn copy_to_block(&self, ind: u8) {
        OAM_ATTR0.index(ind as usize).write(self.attr0);
        OAM_ATTR1.index(ind as usize).write(self.attr1);
        OAM_ATTR2.index(ind as usize).write(self.attr2);
    }
}
