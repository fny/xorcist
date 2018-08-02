#include <ruby.h>

VALUE xor_in_place(VALUE self, VALUE x, VALUE y) {
    const char *src;
    char *dest;
    size_t len;
    size_t y_len;

    Check_Type(x, T_STRING);
    Check_Type(y, T_STRING);

    rb_str_modify(x);
    dest = RSTRING_PTR(x);
    len = RSTRING_LEN(x);

    src = RSTRING_PTR(y);
    y_len = RSTRING_LEN(y);

    if (y_len < len) {
        len = y_len;
    }

    for (; len--; ++dest, ++src) {
        *dest ^= *src;
    }

    return x;
}

void Init_xorcist() {
    rb_define_module_function(rb_define_module("Xorcist"), "xor!", xor_in_place, 2);
}
