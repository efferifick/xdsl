// RUN: XDSL_ROUNDTRIP
%a = "test.op"() : () -> !x86.reg<rax>
// CHECK: %{{.*}} = "test.op"() : () -> !x86.reg<rax>

%0, %1 = "test.op"() : () -> (!x86.reg<>, !x86.reg<>)
%rsp = "test.op"() : () -> !x86.reg<rsp>

%add = x86.add %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK: %{{.*}} = x86.add %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%sub = x86.sub %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.sub %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%mul = x86.imul %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.imul %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%and = x86.and %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.and %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%or = x86.or %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.or %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%xor = x86.xor %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.xor %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
%mov = x86.mov %0, %1 : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.mov %{{.*}}, %{{.*}} : (!x86.reg<>, !x86.reg<>) -> !x86.reg<>
x86.push %0 : (!x86.reg<>) -> ()
// CHECK-NEXT: x86.push %{{.*}} : (!x86.reg<>)
%pop, %poprsp = x86.pop %rsp : (!x86.reg<rsp>) -> (!x86.reg<>, !x86.reg<rsp>)
// CHECK-NEXT: %{{.*}}, %{{.*}} = x86.pop %{{.*}} : (!x86.reg<rsp>) -> (!x86.reg<>, !x86.reg<rsp>)
%not = x86.not %0 : (!x86.reg<>) -> !x86.reg<>
// CHECK-NEXT: %{{.*}} = x86.not %{{.*}} : (!x86.reg<>) -> !x86.reg<>
