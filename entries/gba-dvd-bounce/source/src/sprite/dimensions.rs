/// Valid sizes: 0..=3
/// Size | 0      | 1           | 2
/// Size | Square | Horiztontal | Vertical
/// 0    | 8x8    | 16x8        | 8x16
/// 1    | 16x16  | 32x8        | 8x32
/// 2    | 32x32  | 32x16       | 16x32
/// 3    | 64x64  | 64x32       | 32x64
pub enum SpriteDimensions {
    Size8x8,
    Size16x8,
    Size8x16,
    Size16x16,
    Size32x8,
    Size8x32,
    Size32x32,
    Size32x16,
    Size16x32,
    Size64x64,
    Size64x32,
    Size32x64,
}

impl SpriteDimensions {
    /// Get attr value for sprite size
    pub fn size(&self) -> u16 {
        match self {
            SpriteDimensions::Size8x8 => 0,
            SpriteDimensions::Size16x8 => 0,
            SpriteDimensions::Size8x16 => 0,
            SpriteDimensions::Size16x16 => 1,
            SpriteDimensions::Size32x8 => 1,
            SpriteDimensions::Size8x32 => 1,
            SpriteDimensions::Size32x32 => 2,
            SpriteDimensions::Size32x16 => 2,
            SpriteDimensions::Size16x32 => 2,
            SpriteDimensions::Size64x64 => 3,
            SpriteDimensions::Size64x32 => 3,
            SpriteDimensions::Size32x64 => 3,
        }
    }
    /// Get attr value for sprite shape
    pub fn shape(&self) -> u16 {
        match self {
            SpriteDimensions::Size8x8 => 0,
            SpriteDimensions::Size16x8 => 1,
            SpriteDimensions::Size8x16 => 2,
            SpriteDimensions::Size16x16 => 0,
            SpriteDimensions::Size32x8 => 1,
            SpriteDimensions::Size8x32 => 2,
            SpriteDimensions::Size32x32 => 0,
            SpriteDimensions::Size32x16 => 1,
            SpriteDimensions::Size16x32 => 2,
            SpriteDimensions::Size64x64 => 0,
            SpriteDimensions::Size64x32 => 1,
            SpriteDimensions::Size32x64 => 2,
        }
    }
}
