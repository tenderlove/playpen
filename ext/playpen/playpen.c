#include <ruby.h>
#include <sandbox.h>

static VALUE playpen_init(VALUE self, VALUE name, VALUE flags)
{
  char * error;
  if(sandbox_init(StringValuePtr(name), NUM2INT(flags), &error) < 0) {
    rb_raise(rb_eRuntimeError, "%s", error);
  }

  return self;
}

void Init_playpen()
{
  VALUE mPlaypen = rb_define_module("Playpen");
  rb_define_const(mPlaypen, "SANDBOX_NAMED", INT2NUM(SANDBOX_NAMED));
  rb_define_const(mPlaypen, "NO_INTERNET", rb_str_new2(kSBXProfileNoInternet));
  rb_define_singleton_method(mPlaypen, "sandbox_init", playpen_init, 2);
}
