#[derive(Debug)]
pub enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT,
}
impl Direction {
    pub fn value(&self) -> i16 {
        match self {
            Direction::UP => -1,
            Direction::DOWN => 1,
            Direction::LEFT => -1,
            Direction::RIGHT => 1,
        }
    }
    pub fn flip(&self) -> Self {
        match self {
            Direction::UP => Direction::DOWN,
            Direction::DOWN => Direction::UP,
            Direction::LEFT => Direction::RIGHT,
            Direction::RIGHT => Direction::LEFT,
        }
    }
}
