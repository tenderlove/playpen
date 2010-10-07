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
  VALUE cPlaypen = rb_define_class("Playpen", rb_cObject);
  rb_define_const(cPlaypen, "SANDBOX_NAMED", INT2NUM(SANDBOX_NAMED));
  rb_define_const(cPlaypen, "NO_INTERNET", rb_str_new2(kSBXProfileNoInternet));
  rb_define_const(cPlaypen, "NO_NETWORK", rb_str_new2(kSBXProfileNoNetwork));
  rb_define_const(cPlaypen, "NO_WRITE", rb_str_new2(kSBXProfileNoWrite));
  rb_define_const(cPlaypen, "TEMP_ONLY_WRITE", rb_str_new2(kSBXProfileNoWriteExceptTemporary));
  rb_define_const(cPlaypen, "COMPUTATION_ONLY", rb_str_new2(kSBXProfilePureComputation));
  rb_define_singleton_method(cPlaypen, "sandbox_init", playpen_init, 2);
}
