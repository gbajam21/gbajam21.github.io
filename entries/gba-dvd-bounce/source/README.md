# gba-dvd
GBA program that is just the DVD bounce screen saver written in Rust

![DVD bounce](readme-images/animation.gif)

When the logo hits the corner, there's a small and satisfying flashing animation

![Hitting Corner](readme-images/corner-animation.gif)

## Setup
Follow the `rust-console/gba` setup (https://github.com/rust-console/gba).

## Building
If you install `cargo-make`, you build and fix the ROM with the Makefile.toml
```
cargo make justrelease
```

Otherwise you can build the ROM file with and fix the ROM manually
```
cargo build --release

arm-none-eabi-objcopy -O binary [RUST_BINARY_NAME] [ROM_NAME].gba
gbafix [ROM_NAME].gba
```

## License

Licensed under either of

 * Apache License, Version 2.0
   ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license
   ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
 * Zlib
   ([LICENSE-ZLIB](LICENSE-ZLIB) or https://opensource.org/licenses/Zlib)

at your option.

## Contribution

This crate is tri-licensed under Zlib / Apache-2.0 / MIT. Any contributions you submit must be licensed the same.
