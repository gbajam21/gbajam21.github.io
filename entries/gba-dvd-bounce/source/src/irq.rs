use gba::prelude::*;

#[instruction_set(arm::a32)]
pub extern "C" fn vblank_handler_a32() {
    vblank_handler_t32()
}

pub fn vblank_handler_t32() {
    // disable Interrupt Master Enable to prevent an interrupt during the handler
    unsafe { IME.write(false) };

    // read which interrupts are pending, and "filter" the selection by which are
    // supposed to be enabled.
    let which_interrupts_to_handle = IRQ_PENDING.read() & IE.read();
    // read the current IntrWait value. It sorta works like a running total, so
    // any interrupts we process we'll enable in this value, which we write back
    // at the end.
    let mut intr_wait_flags = INTR_WAIT_ACKNOWLEDGE.read();

    // Switch board
    if which_interrupts_to_handle.vblank() {
      intr_wait_flags.set_vblank(true);
    }
    // acknowledge that we did stuff.
    IRQ_ACKNOWLEDGE.write(which_interrupts_to_handle);

    // write out any IntrWait changes.
    unsafe { INTR_WAIT_ACKNOWLEDGE.write(intr_wait_flags) };

    // re-enable as we go out.
    unsafe { IME.write(true) };
}