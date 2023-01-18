%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_nn
from lib.cairo_math_64x61_git.contracts.cairo_math_64x61.hyp64x61 import cosh
//"./lib/cairo_math_64x61_git/contracts/cairo_math_64x61/math64x61.cairo"
@storage_var
func cosH() -> (res: felt) {
}

@external
func set_cosHyperbolic{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    _input59x18: felt
) -> (output59x18: felt) {
    // The maximum input we need to support when called by hyperbolicCurve is `b*x^c`
    // We know that |x| <= 1, so the max input we must support is B_UPPER_BOUND

    // Verify that cosh input >= 0
    assert_nn(_input59x18);

    // Verify that cosh input <= B_UPPER_BOUND
    // assert_le(_input59x18, B_UPPER_BOUND);
    let value = exp(_input59x18);
    cosH.write(value);
    return (output59x18=value);
}

@view
func get_cosHyperbolic{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    res: felt
) {
    let (res) = cosH.read();
    return (res=res);
}
