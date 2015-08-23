#include <ruby.h>

VALUE Xorcist = Qnil;

void Init_xorcist();

VALUE xor_in_place(VALUE x, VALUE y, VALUE self);

VALUE xor_in_place(VALUE self, VALUE x, VALUE y) {
    const char *src = 0;
    char *dest = 0;
    size_t len;
    size_t y_len;

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
    Xorcist = rb_define_module("Xorcist");
    rb_define_module_function(Xorcist, "xor!", xor_in_place, 2);
}
