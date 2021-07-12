// build.rs
use gba_image_macros::prelude::*;

fn main() {
    // Create a ConstWriter for the macros to use
    let writer = ConstWriter::from_path(&Path::new("src/assets.rs")).unwrap();
    let mut consts = writer.finish_dependencies();
    // add a load_sprite macro for each sprite
    load_sprite!(consts, "dvd", "DVD");
    // Only update if this file or files in the asset folder update
    println!("cargo:rerun-if-changed=build.rs");
    println!("cargo:rerun-if-changed=assets");
}
