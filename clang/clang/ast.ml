let version = "$Id$"

(* Represents the language in a linkage specification.
   [clang/AST/DeclCXX.h] *)
type language = AstBridge.language =
  | Lang_C
  | Lang_CXX
  deriving (Show)


(* Specifies the width of a type, e.g., short, long, or long long.
   [clang/Basic/Specifiers.h] *)
type type_specifier_width = AstBridge.type_specifier_width =
  | TSW_unspecified
  | TSW_short
  | TSW_long
  | TSW_longlong
  deriving (Show)


(* Specifies the signedness of a type, e.g., signed or unsigned.
   [clang/Basic/Specifiers.h] *)
type type_specifier_sign = AstBridge.type_specifier_sign =
  | TSS_unspecified
  | TSS_signed
  | TSS_unsigned
  deriving (Show)


(* Specifies the kind of type.
   [clang/Basic/Specifiers.h] *)
type type_specifier_type = AstBridge.type_specifier_type =
  | TST_unspecified
  | TST_void
  | TST_char
  | TST_wchar			(* C++ wchar_t *)
  | TST_char16			(* C++11 char16_t *)
  | TST_char32			(* C++11 char32_t *)
  | TST_int
  | TST_int128
  | TST_half			(* OpenCL half, ARM NEON __fp16 *)
  | TST_float
  | TST_double
  | TST_bool			(* _Bool *)
  | TST_decimal32		(* _Decimal32 *)
  | TST_decimal64		(* _Decimal64 *)
  | TST_decimal128		(* _Decimal128 *)
  | TST_enum
  | TST_union
  | TST_struct
  | TST_class			(* C++ class type *)
  | TST_interface		(* C++ (Microsoft-specific) __interface type *)
  | TST_typename		(* Typedef, C++ class-name or enum name, etc. *)
  | TST_typeofType
  | TST_typeofExpr
  | TST_decltype		(* C++11 decltype *)
  | TST_underlyingType		(* __underlying_type for C++11 *)
  | TST_auto			(* C++11 auto *)
  | TST_decltype_auto		(* C++1y decltype(auto) *)
  | TST_unknown_anytype		(* __unknown_anytype extension *)
  | TST_atomic			(* C11 _Atomic *)
  | TST_image1d_t		(* OpenCL image1d_t *)
  | TST_image1d_array_t		(* OpenCL image1d_array_t *)
  | TST_image1d_buffer_t	(* OpenCL image1d_buffer_t *)
  | TST_image2d_t		(* OpenCL image2d_t *)
  | TST_image2d_array_t		(* OpenCL image2d_array_t *)
  | TST_image3d_t		(* OpenCL image3d_t *)
  | TST_sampler_t		(* OpenCL sampler_t *)
  | TST_event_t			(* OpenCL event_t *)
  | TST_error			(* erroneous type *)
  deriving (Show)


(* Structure that packs information about the type specifiers that
   were written in a particular type specifier sequence.
   [clang/Basic/Specifiers.h] *)
type written_builtin_specs = AstBridge.written_builtin_specs = {
  wbs_type      : type_specifier_type;
  wbs_sign      : type_specifier_sign;
  wbs_width     : type_specifier_width;
  wbs_mode_attr : bool;
} deriving (Show)


(* A C++ access specifier (public, private, protected), plus the
   special value "none" which means different things in different contexts.
   [clang/Basic/Specifiers.h] *)
type access_specifier = AstBridge.access_specifier =
  | AS_public
  | AS_protected
  | AS_private
  | AS_none
  deriving (Show)


(* The categorization of expression values, currently following the
   C++11 scheme.
   [clang/Basic/Specifiers.h] *)
type expr_value_kind = AstBridge.expr_value_kind =
  | VK_RValue
    (* An r-value expression (a pr-value in the C++11 taxonomy)
       produces a temporary value. *)
  | VK_LValue
    (* An l-value expression is a reference to an object with
       independent storage. *)
  | VK_XValue
    (* An x-value expression is a reference to an object with
       independent storage but which can be "moved", i.e.
       efficiently cannibalized for its resources. *)
  deriving (Show)


(* A further classification of the kind of object referenced by an
   l-value or x-value.
   [clang/Basic/Specifiers.h] *)
type expr_object_kind = AstBridge.expr_object_kind =
  | OK_Ordinary
    (* An ordinary object is located at an address in memory. *)
  | OK_BitField
    (* A bitfield object is a bitfield on a C or C++ record. *)
  | OK_VectorComponent
    (* A vector component is an element or range of elements on a vector. *)
  | OK_ObjCProperty
    (* An Objective-C property is a logical field of an Objective-C
       object which is read and written via Objective-C method calls. *)
  | OK_ObjCSubscript
    (* An Objective-C array/dictionary subscripting which reads an
       object or writes at the subscripted array/dictionary element via
       Objective-C method calls. *)
  deriving (Show)


(* Describes the kind of template specialization that a
   particular template specialization declaration represents.
   [clang/Basic/Specifiers.h] *)
type template_specialization_kind = AstBridge.template_specialization_kind =
  | TSK_Undeclared
    (* This template specialization was formed from a template-id but
       has not yet been declared, defined, or instantiated. *)
  | TSK_ImplicitInstantiation
    (* This template specialization was implicitly instantiated from a
       template. (C++ [temp.inst]). *)
  | TSK_ExplicitSpecialization
    (* This template specialization was declared or defined by an
       explicit specialization (C++ [temp.expl.spec]) or partial
       specialization (C++ [temp.class.spec]). *)
  | TSK_ExplicitInstantiationDeclaration
    (* This template specialization was instantiated from a template
       due to an explicit instantiation declaration request
       (C++11 [temp.explicit]). *)
  | TSK_ExplicitInstantiationDefinition
    (* This template specialization was instantiated from a template
       due to an explicit instantiation definition request
       (C++ [temp.explicit]). *)
  deriving (Show)


(* Thread storage-class-specifier.
   [clang/Basic/Specifiers.h] *)
type thread_storage_class_specifier = AstBridge.thread_storage_class_specifier =
  | TSCS_unspecified
  | TSCS___thread
    (* GNU __thread. *)
  | TSCS_thread_local
    (* C++11 thread_local. Implies 'static' at block scope, but not at
       class scope. *)
  | TSCS__Thread_local
    (* C11 _Thread_local. Must be combined with either 'static' or 'extern'
       if used at block scope. *)
  deriving (Show)


(* Storage classes.
   [clang/Basic/Specifiers.h] *)
type storage_class = AstBridge.storage_class =
  | SC_None
  | SC_Extern
  | SC_Static
  | SC_PrivateExtern
  | SC_OpenCLWorkGroupLocal
  | SC_Auto
  | SC_Register
  deriving (Show)


(* In-class initialization styles for non-static data members.
   [clang/Basic/Specifiers.h] *)
type in_class_init_style = AstBridge.in_class_init_style =
  | ICIS_NoInit		(* No in-class initializer. *)
  | ICIS_CopyInit	(* Copy initialization. *)
  | ICIS_ListInit	(* Direct list-initialization. *)
  deriving (Show)


(* Specifies the calling convention that a function uses.
   [clang/Basic/Specifiers.h] *)
type calling_conv = AstBridge.calling_conv =
  | CC_Default
  | CC_C		(* __attribute__((cdecl)) *)
  | CC_X86StdCall	(* __attribute__((stdcall)) *)
  | CC_X86FastCall	(* __attribute__((fastcall)) *)
  | CC_X86ThisCall	(* __attribute__((thiscall)) *)
  | CC_X86Pascal	(* __attribute__((pascal)) *)
  | CC_AAPCS		(* __attribute__((pcs("aapcs"))) *)
  | CC_AAPCS_VFP	(* __attribute__((pcs("aapcs-vfp"))) *)
  | CC_PnaclCall	(* __attribute__((pnaclcall)) *)
  | CC_IntelOclBicc	(* __attribute__((intel_ocl_bicc)) *)
  deriving (Show)


(* The storage duration for an object (per C++ [basic.stc]).
   [clang/Basic/Specifiers.h] *)
type storage_duration = AstBridge.storage_duration =
  | SD_FullExpression	(* Full-expression storage duration (for temporaries). *)
  | SD_Automatic	(* Automatic storage duration (most local variables). *)
  | SD_Thread		(* Thread storage duration. *)
  | SD_Static		(* Static storage duration. *)
  | SD_Dynamic		(* Dynamic storage duration. *)
  deriving (Show)


(* [clang/AST/Type.h] *)
type type_qualifier = AstBridge.type_qualifier =
  (* CVR *)
  | TQ_Const
  | TQ_Volatile
  | TQ_Restrict
  (* ObjCGC *)
  | TQ_Weak
  | TQ_Strong
  (* ObjCLifetime *)
  | TQ_OCL_ExplicitNone
  | TQ_OCL_Strong
  | TQ_OCL_Weak
  | TQ_OCL_Autoreleasing
  deriving (Show)


(* [clang/AST/Expr.h] *)
type predefined_expr = AstBridge.predefined_expr =
  | PE_Func
  | PE_FuncSig
  | PE_Function
  | PE_LFunction
  | PE_FuncDName
  | PE_PrettyFunction
  | PE_PrettyFunctionNoVirtual
  deriving (Show)


(* The kind of a tag type.
   [clang/AST/Type.h] *)
type tag_type_kind = AstBridge.tag_type_kind =
  | TTK_Struct		(* The "struct" keyword. *)
  | TTK_Interface	(* The "__interface" keyword. *)
  | TTK_Union		(* The "union" keyword. *)
  | TTK_Class		(* The "class" keyword. *)
  | TTK_Enum		(* The "enum" keyword. *)
  deriving (Show)


(* The kind of a vector type.
   [clang/AST/Type.h] *)
type vector_kind = AstBridge.vector_kind =
  | VK_GenericVector
  | VK_AltiVecVector
  | VK_AltiVecPixel
  | VK_AltiVecBool
  | VK_NeonVector
  | VK_NeonPolyVector
  deriving (Show)


type attributed_type_kind = AstBridge.attributed_type_kind =
 (* expression operand *)
 | ATK_address_space
 | ATK_regparm
 | ATK_vector_size
 | ATK_neon_vector_type
 | ATK_neon_polyvector_type
 (* enumerated operand (string or keyword) *)
 | ATK_objc_gc
 | ATK_objc_inert_unsafe_unretained
 | ATK_objc_kindof
 | ATK_objc_ownership
 | ATK_pcs
 | ATK_pcs_vfp
 (* no operand *)
 | ATK_noreturn
 | ATK_cdecl
 | ATK_fastcall
 | ATK_stdcall
 | ATK_thiscall
 | ATK_pascal
 | ATK_pnaclcall
 | ATK_inteloclbicc
 | ATK_ms_abi
 | ATK_sysv_abi
 | ATK_ptr32
 | ATK_ptr64
 | ATK_sptr
 | ATK_uptr
 | ATK_vectorcall
 | ATK_nonnull
 | ATK_nullable
 | ATK_null_unspecified
 | ATK_swiftcall
 | ATK_preserve_most
 | ATK_preserve_all
 deriving (Show)


(* The elaboration keyword that precedes a qualified type name or
   introduces an elaborated-type-specifier.
   [clang/AST/Type.h] *)
type elaborated_type_keyword = AstBridge.elaborated_type_keyword =
  | ETK_Struct		(* The "struct" keyword introduces the elaborated-type-specifier. *)
  | ETK_Interface	(* The "__interface" keyword introduces the elaborated-type-specifier. *)
  | ETK_Union		(* The "union" keyword introduces the elaborated-type-specifier. *)
  | ETK_Class		(* The "class" keyword introduces the elaborated-type-specifier. *)
  | ETK_Enum		(* The "enum" keyword introduces the elaborated-type-specifier. *)
  | ETK_Typename	(* The "typename" keyword precedes the qualified type name, e.g., [typename T::type]. *)
  | ETK_None		(* No keyword precedes the qualified type name. *)
  deriving (Show)


(* The kind of operation required for a conversion.
   [clang/AST/OperationKinds.h] *)
type cast_kind = AstBridge.cast_kind =
  | CK_BooleanToSignedIntegral
    (* Convert a boolean to -1 or 0 for true and false, respectively. *)
  | CK_Dependent
    (* A conversion which cannot yet be analyzed because
       either the expression or target type is dependent.  These are
       created only for explicit casts; dependent ASTs aren't required
       to even approximately type-check.
         ( T* ) malloc(sizeof(T))
         reinterpret_cast<intptr_t>(A<T>::alloc());
    *)
  | CK_BitCast
    (* A conversion which causes a bit pattern of one type
       to be reinterpreted as a bit pattern of another type.  Generally
       the operands must have equivalent size and unrelated types.

       The pointer conversion char* -> int* is a bitcast.  A conversion
       from any pointer type to a C pointer type is a bitcast unless
       it's actually BaseToDerived or DerivedToBase.  A conversion to a
       block pointer or ObjC pointer type is a bitcast only if the
       operand has the same type kind; otherwise, it's one of the
       specialized casts below.

       Vector coercions are bitcasts. *)
  | CK_LValueBitCast
    (* A conversion which reinterprets the address of
       an l-value as an l-value of a different kind.  Used for
       reinterpret_casts of l-value expressions to reference types.
         bool b; reinterpret_cast<char&>(b) = 'a';
    *)
  | CK_LValueToRValue
    (* A conversion which causes the extraction of
       an r-value from the operand gl-value.  The result of an r-value
       conversion is always unqualified. *)
  | CK_NoOp
    (* A conversion which does not affect the type other than
       (possibly) adding qualifiers.
         int    -> int
         char** -> const char * const *
    *)
  | CK_BaseToDerived
    (* A conversion from a C++ class pointer/reference
       to a derived class pointer/reference.
         B *b = static_cast<B*>(a);
    *)
  | CK_DerivedToBase
    (* A conversion from a C++ class pointer
       to a base class pointer.
         A *a = new B();
    *)
  | CK_UncheckedDerivedToBase
    (* A conversion from a C++ class
       pointer/reference to a base class that can assume that the
       derived pointer is not null.
         const A &a = B();
         b->method_from_a();
    *)
  | CK_Dynamic
    (* A C++ dynamic_cast. *)
  | CK_ToUnion
    (* The GCC cast-to-union extension.
         int   -> union { int x; float y; }
         float -> union { int x; float y; }
    *)
  | CK_ArrayToPointerDecay
    (* Array to pointer decay.
         int[10] -> int*
         char[5][6] -> char( * )[6]
    *)
  | CK_FunctionToPointerDecay
    (* Function to pointer decay.
         void(int) -> void( * )(int)
    *)
  | CK_NullToPointer
    (* Null pointer constant to pointer, ObjC
       pointer, or block pointer.
         ( void* ) 0
         void (^block)() = 0;
    *)
  | CK_NullToMemberPointer
    (* Null pointer constant to member pointer.
         int A::*mptr = 0;
         int (A::*fptr)(int) = nullptr;
    *)
  | CK_BaseToDerivedMemberPointer
    (* Member pointer in base class to
       member pointer in derived class.
         int B::*mptr = &A::member;
    *)
  | CK_DerivedToBaseMemberPointer
    (* Member pointer in derived class to
       member pointer in base class.
         int A::*mptr = static_cast<int A::*>(&B::member);
    *)
  | CK_MemberPointerToBoolean
    (* Member pointer to boolean.  A check
       against the null member pointer. *)
  | CK_ReinterpretMemberPointer
    (* Reinterpret a member pointer as a
       different kind of member pointer.  C++ forbids this from
       crossing between function and object types, but otherwise does
       not restrict it.  However, the only operation that is permitted
       on a "punned" member pointer is casting it back to the original
       type, which is required to be a lossless operation (although
       many ABIs do not guarantee this on all possible intermediate types). *)
  | CK_UserDefinedConversion
    (* Conversion using a user defined type conversion function.
         struct A { operator int(); }; int i = int(A());
    *)
  | CK_ConstructorConversion
    (* Conversion by constructor.
         struct A { A(int); }; A a = A(10);
    *)
  | CK_IntegralToPointer
    (* Integral to pointer.  A special kind of reinterpreting conversion.
       Applies to normal, ObjC, and block pointers.
         ( char* ) 0x1001aab0
         reinterpret_cast<int*>(0)
    *)
  | CK_PointerToIntegral
    (* Pointer to integral.  A special kind of reinterpreting conversion.
       Applies to normal, ObjC, and block pointers.
         (intptr_t) "help!"
    *)
  | CK_PointerToBoolean
    (* Pointer to boolean conversion.  A check against null.  Applies to
       normal, ObjC, and block pointers. *)
  | CK_ToVoid
  | CK_VectorSplat
  | CK_IntegralCast
  | CK_IntegralToBoolean
  | CK_IntegralToFloating
  | CK_FloatingToIntegral
  | CK_FloatingToBoolean
  | CK_FloatingCast
  | CK_CPointerToObjCPointerCast
  | CK_BlockPointerToObjCPointerCast
  | CK_AnyPointerToBlockPointerCast
  | CK_ObjCObjectLValueCast
  | CK_FloatingRealToComplex
  | CK_FloatingComplexToReal
  | CK_FloatingComplexToBoolean
  | CK_FloatingComplexCast
  | CK_FloatingComplexToIntegralComplex
  | CK_IntegralRealToComplex
  | CK_IntegralComplexToReal
  | CK_IntegralComplexToBoolean
  | CK_IntegralComplexCast
  | CK_IntegralComplexToFloatingComplex
  | CK_ARCProduceObject
  | CK_ARCConsumeObject
  | CK_ARCReclaimReturnedObject
  | CK_ARCExtendBlockObject
  | CK_AtomicToNonAtomic
  | CK_NonAtomicToAtomic
  | CK_CopyAndAutoreleaseBlockObject
  | CK_BuiltinFnToFnPtr
  | CK_ZeroToOCLEvent
  | CK_AddressSpaceConversion
  deriving (Show)


(* [clang/Basic/Builtins.def] *)
type atomic_op = AstBridge.atomic_op =
  | AO__c11_atomic_init
  | AO__c11_atomic_load
  | AO__c11_atomic_store
  | AO__c11_atomic_exchange
  | AO__c11_atomic_compare_exchange_strong
  | AO__c11_atomic_compare_exchange_weak
  | AO__c11_atomic_fetch_add
  | AO__c11_atomic_fetch_sub
  | AO__c11_atomic_fetch_and
  | AO__c11_atomic_fetch_or
  | AO__c11_atomic_fetch_xor
  | AO__atomic_load
  | AO__atomic_load_n
  | AO__atomic_store
  | AO__atomic_store_n
  | AO__atomic_exchange
  | AO__atomic_exchange_n
  | AO__atomic_compare_exchange
  | AO__atomic_compare_exchange_n
  | AO__atomic_fetch_add
  | AO__atomic_fetch_sub
  | AO__atomic_fetch_and
  | AO__atomic_fetch_or
  | AO__atomic_fetch_xor
  | AO__atomic_fetch_nand
  | AO__atomic_add_fetch
  | AO__atomic_sub_fetch
  | AO__atomic_and_fetch
  | AO__atomic_or_fetch
  | AO__atomic_xor_fetch
  | AO__atomic_nand_fetch
  deriving (Show)


(* [clang/AST/OperationKinds.h] *)
type unary_operator = AstBridge.unary_operator =
  | UO_PostInc	(* i++ *) (* [C99 6.5.2.4] Postfix increment and decrement *)
  | UO_PostDec  (* i-- *)
  | UO_PreInc	(* ++i *) (* [C99 6.5.3.1] Prefix increment and decrement *)
  | UO_PreDec   (* --i *)
  | UO_AddrOf	(* &a  *) (* [C99 6.5.3.2] Address and indirection *)
  | UO_Deref    (* *a  *)
  | UO_Plus	(* +a  *) (* [C99 6.5.3.3] Unary arithmetic *)
  | UO_Minus    (* -a  *)
  | UO_Not      (* ~a  *)
  | UO_LNot     (* !a  *)
  | UO_Real	(* __real *) (* "__real expr"/"__imag expr" Extension. *)
  | UO_Imag     (* __imag *)
  | UO_Extension(* __extension__ marker. *)
  | UO_Coawait  (* __await C++ coroutine await *)
  deriving (Show)

(* [llvm-3.4/include/clang/Basic/TypeTraits.h] *)
type binary_type_trait = AstBridge.binary_type_trait =
  | BTT_IsBaseOf
  | BTT_IsConvertible
  | BTT_IsConvertibleTo
  | BTT_IsSame
  | BTT_TypeCompatible
  | BTT_IsTriviallyAssignable
  deriving (Show)

(* [llvm-3.4/include/clang/Basic/TypeTraits.h] *)
type unary_type_trait = AstBridge.unary_type_trait =
  | UTT_HasNothrowAssign
  | UTT_HasNothrowMoveAssign
  | UTT_HasNothrowCopy
  | UTT_HasNothrowConstructor
  | UTT_HasTrivialAssign
  | UTT_HasTrivialMoveAssign
  | UTT_HasTrivialCopy
  | UTT_HasTrivialDefaultConstructor
  | UTT_HasTrivialMoveConstructor
  | UTT_HasTrivialDestructor
  | UTT_HasVirtualDestructor
  | UTT_IsAbstract
  | UTT_IsArithmetic
  | UTT_IsArray
  | UTT_IsClass
  | UTT_IsCompleteType
  | UTT_IsCompound
  | UTT_IsConst
  | UTT_IsEmpty
  | UTT_IsEnum
  | UTT_IsFinal
  | UTT_IsFloatingPoint
  | UTT_IsFunction
  | UTT_IsFundamental
  | UTT_IsIntegral
  | UTT_IsInterfaceClass
  | UTT_IsLiteral
  | UTT_IsLvalueReference
  | UTT_IsMemberFunctionPointer
  | UTT_IsMemberObjectPointer
  | UTT_IsMemberPointer
  | UTT_IsObject
  | UTT_IsPOD
  | UTT_IsPointer
  | UTT_IsPolymorphic
  | UTT_IsReference
  | UTT_IsRvalueReference
  | UTT_IsScalar
  | UTT_IsSealed
  | UTT_IsSigned
  | UTT_IsStandardLayout
  | UTT_IsTrivial
  | UTT_IsTriviallyCopyable
  | UTT_IsUnion
  | UTT_IsUnsigned
  | UTT_IsVoid
  | UTT_IsVolatile
  deriving (Show)

(* [clang/Basic/TypeTraits.h] *)
type array_type_trait = AstBridge.array_type_trait =
  | ATT_ArrayRank
  | ATT_ArrayExtent
  deriving (Show)

(* [clang/AST/OperationKinds.h] *)
type binary_operator = AstBridge.binary_operator =
  | BO_PtrMemD	(* [C++ 5.5] Pointer-to-member operators. *)
  | BO_PtrMemI
  | BO_Mul	(* [C99 6.5.5] Multiplicative operators. *)
  | BO_Div
  | BO_Rem
  | BO_Add	(* [C99 6.5.6] Additive operators. *)
  | BO_Sub
  | BO_Shl	(* [C99 6.5.7] Bitwise shift operators. *)
  | BO_Shr
  | BO_LT	(* [C99 6.5.8] Relational operators. *)
  | BO_GT
  | BO_LE
  | BO_GE
  | BO_EQ	(* [C99 6.5.9] Equality operators. *)
  | BO_NE
  | BO_And	(* [C99 6.5.10] Bitwise AND operator. *)
  | BO_Xor	(* [C99 6.5.11] Bitwise XOR operator. *)
  | BO_Or	(* [C99 6.5.12] Bitwise OR operator. *)
  | BO_LAnd	(* [C99 6.5.13] Logical AND operator. *)
  | BO_LOr	(* [C99 6.5.14] Logical OR operator. *)
  | BO_Assign	(* [C99 6.5.16] Assignment operators. *)
  | BO_MulAssign
  | BO_DivAssign
  | BO_RemAssign
  | BO_AddAssign
  | BO_SubAssign
  | BO_ShlAssign
  | BO_ShrAssign
  | BO_AndAssign
  | BO_OrAssign
  | BO_XorAssign
  | BO_Comma	(* [C99 6.5.17] Comma operator. *)
  deriving (Show)


type overloaded_operator_kind = AstBridge.overloaded_operator_kind =
  | OO_New			(* "new"      *)
  | OO_Delete			(* "delete"   *)
  | OO_Array_New		(* "new[]"    *)
  | OO_Array_Delete		(* "delete[]" *)
  | OO_Plus			(* "+"        *)
  | OO_Minus			(* "-"        *)
  | OO_Star			(* "*"        *)
  | OO_Slash			(* "/"        *)
  | OO_Percent			(* "%"        *)
  | OO_Caret			(* "^"        *)
  | OO_Amp			(* "&"        *)
  | OO_Pipe			(* "|"        *)
  | OO_Tilde			(* "~"        *)
  | OO_Exclaim			(* "!"        *)
  | OO_Equal			(* "="        *)
  | OO_Less			(* "<"        *)
  | OO_Greater			(* ">"        *)
  | OO_PlusEqual		(* "+="       *)
  | OO_MinusEqual		(* "-="       *)
  | OO_StarEqual		(* "*="       *)
  | OO_SlashEqual		(* "/="       *)
  | OO_PercentEqual		(* "%="       *)
  | OO_CaretEqual		(* "^="       *)
  | OO_AmpEqual			(* "&="       *)
  | OO_PipeEqual		(* "|="       *)
  | OO_LessLess			(* "<<"       *)
  | OO_GreaterGreater		(* ">>"       *)
  | OO_LessLessEqual		(* "<<="      *)
  | OO_GreaterGreaterEqual	(* ">>="      *)
  | OO_EqualEqual		(* "=="       *)
  | OO_ExclaimEqual		(* "!="       *)
  | OO_LessEqual		(* "<="       *)
  | OO_GreaterEqual		(* ">="       *)
  | OO_AmpAmp			(* "&&"       *)
  | OO_PipePipe			(* "||"       *)
  | OO_PlusPlus			(* "++"       *)
  | OO_MinusMinus		(* "--"       *)
  | OO_Comma			(* ","        *)
  | OO_ArrowStar		(* "->*"      *)
  | OO_Arrow			(* "->"       *)
  | OO_Call			(* "()"       *)
  | OO_Subscript		(* "[]"       *)
  | OO_Conditional		(* "?"        *)
  | OO_Coawait                  (* __await    *)
  deriving (Show)


(* clang/AST/BuiltinTypes.def *)
type builtin_type = AstBridge.builtin_type =
  | BT_Void
  | BT_Bool

  | BT_Char_S
  | BT_Char_U
  | BT_SChar
  | BT_UChar
  | BT_WChar_U
  | BT_WChar_S
  | BT_Char16
  | BT_Char32

  | BT_Short
  | BT_UShort
  | BT_Int
  | BT_UInt
  | BT_Long
  | BT_ULong
  | BT_LongLong
  | BT_ULongLong
  | BT_Int128
  | BT_UInt128

  | BT_Half
  | BT_Float
  | BT_Float128
  | BT_Double
  | BT_LongDouble

  | BT_NullPtr

  | BT_ObjCId
  | BT_ObjCClass
  | BT_ObjCSel

  | BT_OCLClkEvent
  | BT_OCLEvent
  | BT_OCLImage1dRO
  | BT_OCLImage1dWO
  | BT_OCLImage1dRW
  | BT_OCLImage1dArrayRO
  | BT_OCLImage1dArrayWO
  | BT_OCLImage1dArrayRW
  | BT_OCLImage1dBufferRO
  | BT_OCLImage1dBufferWO
  | BT_OCLImage1dBufferRW
  | BT_OCLImage2dRO
  | BT_OCLImage2dWO
  | BT_OCLImage2dRW
  | BT_OCLImage2dArrayRO
  | BT_OCLImage2dArrayWO
  | BT_OCLImage2dArrayRW
  | BT_OCLImage2dArrayDepthRO
  | BT_OCLImage2dArrayDepthWO
  | BT_OCLImage2dArrayDepthRW
  | BT_OCLImage2dArrayMSAARO
  | BT_OCLImage2dArrayMSAAWO
  | BT_OCLImage2dArrayMSAARW
  | BT_OCLImage2dArrayMSAADepthRO
  | BT_OCLImage2dArrayMSAADepthWO
  | BT_OCLImage2dArrayMSAADepthRW
  | BT_OCLImage2dDepthRO
  | BT_OCLImage2dDepthWO
  | BT_OCLImage2dDepthRW
  | BT_OCLImage2dMSAARO
  | BT_OCLImage2dMSAAWO
  | BT_OCLImage2dMSAARW
  | BT_OCLImage2dMSAADepthRO
  | BT_OCLImage2dMSAADepthWO
  | BT_OCLImage2dMSAADepthRW
  | BT_OCLImage3dRO
  | BT_OCLImage3dWO
  | BT_OCLImage3dRW
  | BT_OCLNDRange
  | BT_OCLQueue
  | BT_OCLReserveID
  | BT_OCLSampler

  | BT_OMPArraySection

  | BT_Dependent
  | BT_Overload
  | BT_BoundMember
  | BT_PseudoObject
  | BT_UnknownAny
  | BT_BuiltinFn
  | BT_ARCUnbridgedCast
  deriving (Show)


type captured_region_kind = AstBridge.captured_region_kind =
  | CR_Default
  | CR_OpenMP
  deriving (Show)


type access_control = AstBridge.access_control =
  | AC_None
  | AC_Private
  | AC_Protected
  | AC_Public
  | AC_Package
  deriving (Show)

type receiver_kind = AstBridge.receiver_kind =
  | RK_Class
  | RK_Instance
  | RK_SuperClass
  | RK_SuperInstance
  deriving (Show)

type sloc = AstBridge.sloc = {
  loc_s : Sloc.t;
  loc_e : Sloc.t;
} deriving (Show)


type desg = AstBridge.desg = {
  dr : desg_;
  dr_sloc : sloc;
}

and desg_ = AstBridge.desg_ =
  | FieldDesignator		of string
  | ArrayDesignator		of expr
  | ArrayRangeDesignator	of expr * expr


and expr = AstBridge.expr = {
  e      : expr_;
  e_cref : expr Ref.t;
  e_sloc : sloc;
  e_type : ctyp;
}

and expr_ = AstBridge.expr_ =
  | IntegerLiteral		of int
  | CharacterLiteral		of char
  | FloatingLiteral		of float
  | StringLiteral		of string
  | ImaginaryLiteral		of (* sub *)expr
  | BinaryOperator		of binary_operator
                                 * (* lhs *)expr
                                 * (* rhs *)expr
  | UnaryOperator		of unary_operator
                                 * (* operand *)expr
  | DeclRefExpr			of (* name *)string
  | PredefinedExpr		of (* kind *)predefined_expr
  | ImplicitCastExpr		of cast_kind * expr
  | CStyleCastExpr		of cast_kind * tloc * expr
  | CompoundLiteralExpr		of tloc
                                 * (* init *)expr
  | ParenExpr			of expr
  | VAArgExpr			of (* sub *)expr
                                 * (* type *)tloc
  | CallExpr			of (* callee *)expr
                                 * (* args *)expr list
  | MemberExpr			of (* base *)expr
                                 * (* member *)string
                                 * (* is_arrow *)bool
  | ConditionalOperator		of (* cond *)expr
                                 * (* then *)expr
                                 * (* else *)expr
  | BinaryConditionalOperator	of (* cond *)expr
                                 * (* else *)expr
  | DesignatedInitExpr		of desg list
                                 * (* init *)expr
  | InitListExpr		of (* inits *)expr list
  | ImplicitValueInitExpr
  | ArraySubscriptExpr		of (* base *)expr
                                 * (* index *)expr
  | StmtExpr			of (* body *)stmt
  | AddrLabelExpr		of string
  | OffsetOfExpr		of (* type *)tloc
                                 * (* components *)offsetof_node list
  | OpaqueValueExpr		of (* source *)expr
  | ExtVectorElementExpr	of (* base *)expr
                                 * (* accessor *)string
  | AtomicExpr			of (* op *)atomic_op
                                 * (* sub exprs *)expr list
  | ShuffleVectorExpr		of (* sub exprs *)expr list
  | BinaryTypeTraitExpr		of (* trait *)binary_type_trait
                                 * (* lhs *)ctyp
                                 * (* rhs *)ctyp
  | UnaryTypeTraitExpr		of (* trait *)unary_type_trait
                                 * (* queried type *)ctyp
  | SizeOfExpr			of expr
  | SizeOfType			of tloc
  | AlignOfExpr			of expr
  | AlignOfType			of tloc
  | VecStepExpr			of expr
  | VecStepType			of tloc
  | ConvertVectorExpr           of (* src *)expr
                                 * (* type *)ctyp
  | ChooseExpr                  of (* cond *)expr
                                 * (* lhs *)expr
                                 * (* rhs *)expr
  | GNUNullExpr                 of ctyp
  | ArrayTypeTraitExpr          of (* trait *)array_type_trait
                                 * (* queried *)ctyp
                                 * (* dimension *)expr option
  | ObjCStringLiteral           of string
  | ObjCMessageExpr             of (* instance receiver *)expr option
                                 * (* class receiver *)ctyp option
                                 * (* selector *)string
                                 * (* args *)expr list
  | ObjCEncodeExpr              of (* encoded type *)ctyp
  | ObjCIvarRefExpr             of (* base *)expr
                                 * (* decl *)decl
                                 * (* is_arrow *)bool
                                 * (* is_free_ivar *)bool
  | ObjCBoolLiteralExpr         of (* value *)bool
  | CXXBoolLiteralExpr          of (* value *)bool
  | ObjCArrayLiteral            of (* elements *)expr list
  | ObjCBoxedExpr               of (* sub expr *)expr
  | ObjCDictionaryLiteral       of (* map *)(expr * expr) list
  | PseudoObjectExpr            of (* syntactic *)expr
                                 * (* semantic exprs *) expr list
                                 * (* result *) expr option
  | ObjCPropertyRefExpr         of (* base *)expr
  | ObjCIsaExpr                 of (* base *)expr
  | ObjCSelectorExpr            of (* selector *)string
  | ObjCProtocolExpr            of (* protocol *)string
  | GenericSelectionExpr        of (* controlling *)expr
                                 * (* assoc_list *)(expr * ctyp option) list
                                 * (* result *)expr


  | AsTypeExpr
  | BlockExpr
  | CUDAKernelCallExpr
  | CXXBindTemporaryExpr
  | CXXConstCastExpr
  | CXXConstructExpr
  | CXXDefaultArgExpr
  | CXXDefaultInitExpr
  | CXXDeleteExpr
  | CXXDependentScopeMemberExpr
  | CXXDynamicCastExpr
  | CXXFoldExpr
  | CXXFunctionalCastExpr
  | CXXMemberCallExpr
  | CXXNewExpr
  | CXXNoexceptExpr
  | CXXNullPtrLiteralExpr
  | CXXOperatorCallExpr
  | CXXPseudoDestructorExpr
  | CXXReinterpretCastExpr
  | CXXScalarValueInitExpr
  | CXXStaticCastExpr
  | CXXStdInitializerListExpr
  | CXXTemporaryObjectExpr
  | CXXThisExpr
  | CXXThrowExpr
  | CXXTypeidExpr
  | CXXUnresolvedConstructExpr
  | CXXUuidofExpr
  | CoawaitExpr
  | CompoundAssignOperator
  | CoyieldExpr
  | DependentScopeDeclRefExpr
  | DesignatedInitUpdateExpr
  | ExprWithCleanups
  | ExpressionTraitExpr
  | FunctionParmPackExpr
  | LambdaExpr
  | MSPropertyRefExpr
  | MSPropertySubscriptExpr
  | MaterializeTemporaryExpr
  | NoInitExpr
  | OMPArraySectionExpr
  | ObjCBridgedCastExpr
  | ObjCIndirectCopyRestoreExpr
  | ObjCSubscriptRefExpr
  | PackExpansionExpr
  | ParenListExpr
  | SizeOfPackExpr
  | SubstNonTypeTemplateParmExpr
  | SubstNonTypeTemplateParmPackExpr
  | TypeTraitExpr
  | TypoExpr
  | UnresolvedLookupExpr
  | UnresolvedMemberExpr
  | UserDefinedLiteral

and offsetof_node = AstBridge.offsetof_node =
  | OON_Array			of expr
  | OON_Field			of string
  | OON_Identifier		of string
  | OON_Base			of cxx_base_specifier


and stmt = AstBridge.stmt = {
  s      : stmt_;
  s_cref : stmt Ref.t;
  s_sloc : sloc;
}

and stmt_ = AstBridge.stmt_ =
  | NullStmt
  | BreakStmt
  | ContinueStmt
  | LabelStmt			of (* label *)string
                                 * stmt
  | CaseStmt			of (* range_begin *)expr
                                 * (* range_end *)expr option
                                 * (* stmt *)stmt
  | DefaultStmt			of (* stmt *)stmt
  | GotoStmt			of (* label *)string
  | ExprStmt			of (* expr *)expr
  | CompoundStmt		of (* body *)stmt list
  | ReturnStmt			of (* expr *)expr option
  | IfStmt			of (* cond *)expr
                                 * (* then *)stmt
                                 * (* else *)stmt option
  | ForStmt			of (* init *)stmt option
                                 * (* cond *)expr option
                                 * (* incr *)expr option
                                 * (* body *)stmt
  | WhileStmt			of (* cond *)expr
                                 * (* body *)stmt
  | DoStmt			of (* body *)stmt
                                 * (* cond *)expr
  | SwitchStmt			of (* value *)expr
                                 * (* body *)stmt
  | DeclStmt			of (* decls *)decl list
  | GCCAsmStmt			of (* asm string *)expr
                                 * (* asm outputs *)asm_arg list
                                 * (* asm inputs *)asm_arg list
                                 * (* clobbers *)string list
  | IndirectGotoStmt		of (* target *)expr
  | CapturedStmt                of captured_region_kind
                                 * stmt
                                 * decl
                                 * (* captures *)stmt list
  | ObjCAtCatchStmt             of (* param *)decl
                                 * (* body *)stmt
  | ObjCAtFinallyStmt           of (* body *)stmt
  | ObjCAtTryStmt               of (* try body *)stmt
                                 * (* catch stmts *)stmt list
                                 * (* finally body *)stmt option
  | ObjCAtThrowStmt             of (* throw *)expr
  | ObjCAtSynchronizedStmt      of (* expr *)expr (* lock *)
                                 * (* body *)stmt list (* critical section *)
  | ObjCForCollectionStmt       of (* element *)stmt
                                 * (* collection *)expr
                                 * (* body *)stmt


  | AttributedStmt
  | CXXCatchStmt
  | CXXForRangeStmt
  | CXXTryStmt
  | CoreturnStmt
  | CoroutineBodyStmt
  | MSAsmStmt
  | MSDependentExistsStmt
  | OMPAtomicDirective
  | OMPBarrierDirective
  | OMPCancelDirective
  | OMPCancellationPointDirective
  | OMPCriticalDirective
  | OMPDistributeDirective
  | OMPFlushDirective
  | OMPForDirective
  | OMPForSimdDirective
  | OMPMasterDirective
  | OMPOrderedDirective
  | OMPParallelDirective
  | OMPParallelForDirective
  | OMPParallelForSimdDirective
  | OMPParallelSectionsDirective
  | OMPSectionDirective
  | OMPSectionsDirective
  | OMPSimdDirective
  | OMPSingleDirective
  | OMPTargetDataDirective
  | OMPTargetDirective
  | OMPTaskDirective
  | OMPTaskLoopDirective
  | OMPTaskLoopSimdDirective
  | OMPTaskgroupDirective
  | OMPTaskwaitDirective
  | OMPTaskyieldDirective
  | OMPTeamsDirective
  | ObjCAutoreleasePoolStmt
  | SEHExceptStmt
  | SEHFinallyStmt
  | SEHLeaveStmt
  | SEHTryStmt

and asm_arg = AstBridge.asm_arg = {
  aa_constraint : string;
  aa_expr : expr;
}

and tloc = AstBridge.tloc = {
  tl      : tloc_;
  tl_cref : tloc Ref.t;
  tl_sloc : sloc;
  tl_type : ctyp;
}

and tloc_ = AstBridge.tloc_ =
  | BuiltinTypeLoc		of builtin_type
  | TypeOfExprTypeLoc		of (* underlying *)expr
  | TypeOfTypeLoc		of (* underlying *)tloc
  | DecltypeTypeLoc		of (* underlying *)expr
  | ParenTypeLoc		of (* inner *)tloc
  | QualifiedTypeLoc		of (* unqual *)tloc
                                 * (* qual *)type_qualifier list
                                 * (* aspace *)int option
  | TypedefTypeLoc		of (* name *)string
  | PointerTypeLoc		of (* pointee *)tloc
  | FunctionNoProtoTypeLoc	of (* result *)tloc
  | FunctionProtoTypeLoc	of (* result *)tloc
                                 * (* args *)decl list
  | ConstantArrayTypeLoc	of (* member-type *)tloc
                                 * (* size *)int
  | VariableArrayTypeLoc	of (* member-type *)tloc
                                 * (* size *)expr option
  | IncompleteArrayTypeLoc	of (* member-type *)tloc
  | ElaboratedTypeLoc		of (* named-type *)tloc
  | EnumTypeLoc			of (* name *)string
  | RecordTypeLoc		of (* kind *)tag_type_kind
                                 * (* name *)string
  | DecayedTypeLoc		of (* original *)tloc
  | TemplateTypeParmTypeLoc	of (* name *)string
  | ComplexTypeLoc		of (* element *)ctyp
  | VectorTypeLoc		of (* element-type *)ctyp
                                 * (* numElements *)int
                                 * (* vector-kind *)vector_kind
  | ExtVectorTypeLoc		of (* element-type *)ctyp
                                 * (* numElements *)int
                                 * (* vector-kind *)vector_kind
  | AttributedTypeLoc		of (* kind *)attributed_type_kind
                                 * (* modified loc *)tloc
                                 * (* attr. expr operand *)expr option
  | AtomicTypeLoc		of (* value *)tloc
  | ObjCObjectPointerTypeLoc    of (* pointee *)tloc
  | ObjCObjectTypeLoc           of (* base *)tloc
  | ObjCInterfaceTypeLoc        of (* name *)string
  | AdjustedTypeLoc             of (* original *)tloc
                                 * (* inner *)ctyp

  | AutoTypeLoc
  | BlockPointerTypeLoc
  | DependentNameTypeLoc
  | DependentSizedArrayTypeLoc
  | DependentSizedExtVectorTypeLoc
  | DependentTemplateSpecializationTypeLoc
  | InjectedClassNameTypeLoc
  | LValueReferenceTypeLoc
  | MemberPointerTypeLoc
  | PackExpansionTypeLoc
  | PipeTypeLoc
  | RValueReferenceTypeLoc
  | SubstTemplateTypeParmPackTypeLoc
  | SubstTemplateTypeParmTypeLoc
  | TemplateSpecializationTypeLoc
  | UnaryTransformTypeLoc
  | UnresolvedUsingTypeLoc


and ctyp = AstBridge.ctyp = {
  t        : ctyp_;
  t_cref   : ctyp Ref.t;
  t_qual   : type_qualifier list;
  t_aspace : int option;
  t_self   : ctyp Util.DenseIntMap.key;
  t_canon  : ctyp Util.DenseIntMap.key;
}

and ctyp_ = AstBridge.ctyp_ =
  | BuiltinType			of builtin_type
  | TypeOfExprType		of (* underlying *)expr
  | TypeOfType			of (* underlying *)ctyp
  | DecltypeType		of (* underlying *)expr
  | ParenType			of (* inner *)ctyp
  | TypedefType			of (* name *)string
  | PointerType			of (* pointee *)ctyp
  | FunctionNoProtoType		of (* result *)ctyp
  | FunctionProtoType		of (* result *)ctyp
                                 * (* args *)ctyp list
  | ConstantArrayType		of (* member-type *)ctyp
                                 * (* size *)int
  | VariableArrayType		of (* member-type *)ctyp
                                 * (* size *)expr option
  | IncompleteArrayType		of (* member-type *)ctyp
  | ElaboratedType		of (* named-type *)ctyp
  | EnumType			of (* name *)string
  | RecordType			of (* kind *)tag_type_kind
                                 * (* name *)string
  | DecayedType			of (* decayed *)ctyp
                                 * (* original *)ctyp
  | TemplateTypeParmType	of (* name *)string option
  | ComplexType			of (* element *)ctyp
  | VectorType			of (* element-type *)ctyp
                                 * (* numElements *)int
                                 * (* vector-kind *)vector_kind
  | ExtVectorType		of (* element-type *)ctyp
                                 * (* numElements *)int
                                 * (* vector-kind *)vector_kind
  | AttributedType		of (* kind *)attributed_type_kind
                                 * (* modified type *)ctyp
  | AtomicType			of (* value *)ctyp
  | ObjCObjectPointerType       of (* pointee *)ctyp
  | ObjCObjectType              of (* base *)ctyp
  | ObjCInterfaceType           of (* name *)string
  | AdjustedType                of (* original *)ctyp
                                 * (* adjusted *)ctyp

  | AutoType
  | BlockPointerType
  | DependentNameType
  | DependentSizedArrayType
  | DependentSizedExtVectorType
  | DependentTemplateSpecializationType
  | InjectedClassNameType
  | LValueReferenceType
  | MemberPointerType
  | PackExpansionType
  | PipeType
  | RValueReferenceType
  | SubstTemplateTypeParmPackType
  | SubstTemplateTypeParmType
  | TemplateSpecializationType
  | UnaryTransformType
  | UnresolvedUsingType


and decl = AstBridge.decl = {
  d      : decl_;
  d_cref : decl Ref.t;
  d_sloc : sloc;
}

and decl_ = AstBridge.decl_ =
  | EmptyDecl
  | TranslationUnitDecl		of (* decls *)decl list
  | LinkageSpecDecl		of (* decls *)decl list
                                 * language
  | FunctionDecl		of (* type *)tloc
                                 * (* name *)declaration_name
                                 * (* body *)stmt option
  | TypedefDecl			of (* type *)tloc
                                 * (* name *)string
  | VarDecl			of (* type *)tloc
                                 * (* name *)string
                                 * (* init *)expr option
  | ParmVarDecl			of (* type *)tloc
                                 * (* name *)string
  | RecordDecl			of tag_type_kind
                                 * (* name *)string
                                 * (* members *)decl list option
                                 * (* bases *)cxx_base_specifier list
  | FieldDecl			of field_decl
  | EnumDecl			of (* name *)string
                                 * (* enumerators *)decl list
  | EnumConstantDecl		of (* name *)string
                                 * (* value *)expr option
  | NamespaceDecl		of (* name *)string
                                 * (* is_inline *)bool
                                 * (* decls *)decl list
  | ClassTemplateDecl		of (* templated *)decl
                                 * (* params *)decl list
  | TemplateTypeParmDecl	of (* type *)ctyp
                                 * (* default *)tloc option
  | UsingDecl			of (* name *)declaration_name
  | AccessSpecDecl		of access_specifier
  | FileScopeAsmDecl		of (* insns *)expr
  | CapturedDecl                of (* body *)stmt option
  | StaticAssertDecl            of (* assert *)expr
                                 * (* message *)string
  | LabelDecl                   of (* name *)string
  | ObjCInterfaceDecl           of (* name *)string
                                 * (* referenced protocols *)string list
                                 * (* ivars *)decl list
                                 * (* methods *)decl list
  | ObjCIvarDecl                of access_control
                                 * field_decl
  | ObjCProtocolDecl            of (* name *)string
                                 * (* referenced protocols *)string list
                                 * (* methods *)decl list
  | ObjCMethodDecl              of (* result *)ctyp
                                 * (* name *)string
                                 * (* params *)decl list
  | ObjCImplementationDecl      of (* name *)string
                                 * (* ivars *)decl list
                                 * (* initializers *)expr list
  | ObjCCategoryImplDecl        of (* name *)string
  | ObjCCategoryDecl            of (* class interface name *)string
                                 * (* name *)string
                                 * (* referenced protocols *)string list
                                 * (* methods *)decl list

  | BlockDecl
  | BuiltinTemplateDecl
  | CXXConstructorDecl
  | CXXConversionDecl
  | CXXDestructorDecl
  | ClassScopeFunctionSpecializationDecl
  | ClassTemplatePartialSpecializationDecl
  | ClassTemplateSpecializationDecl
  | ExternCContextDecl
  | FriendDecl
  | FriendTemplateDecl
  | FunctionTemplateDecl
  | ImplicitParamDecl
  | ImportDecl
  | IndirectFieldDecl
  | MSPropertyDecl
  | NamespaceAliasDecl
  | NonTypeTemplateParmDecl
  | OMPThreadPrivateDecl
  | ObjCAtDefsFieldDecl
  | ObjCCompatibleAliasDecl
  | ObjCPropertyDecl
  | ObjCPropertyImplDecl
  | ObjCTypeParamDecl
  | TemplateTemplateParmDecl
  | TypeAliasDecl
  | TypeAliasTemplateDecl
  | UnresolvedUsingTypenameDecl
  | UnresolvedUsingValueDecl
  | UsingDirectiveDecl
  | UsingShadowDecl
  | VarTemplateDecl
  | VarTemplatePartialSpecializationDecl
  | VarTemplateSpecializationDecl
  | PragmaCommentDecl
  | OMPCapturedExprDecl
  | OMPDeclareReductionDecl
  | CXXInheritedCtorInitExpr
  | OMPTargetUpdateDirective
  | PragmaDetectMismatchDecl
  | ConstructorUsingShadowDecl
  | OMPDistributeSimdDirective
  | OMPTargetExitDataDirective
  | OMPTargetParallelDirective
  | OMPTargetEnterDataDirective
  | OMPTargetParallelForDirective
  | OMPDistributeParallelForDirective
  | OMPTargetParallelForSimdDirective
  | OMPDistributeParallelForSimdDirective
  | ObjCAvailabilityCheckExpr

and field_decl = AstBridge.field_decl = {
  fd_type : tloc;
  fd_name : string;
  fd_bitw : expr option; (* bit width *)
  fd_init : expr option; (* initialiser *)
  fd_index : int;
  fd_mutable : bool;
}


and cxx_base_specifier = AstBridge.cxx_base_specifier = {
  cbs_virtual        : bool;
  cbs_base_of_class  : bool;
  cbs_pack_expansion : bool;
  cbs_inherit_ctors  : bool;
  cbs_access_spec    : access_specifier;
  cbs_type           : tloc;
}


and declaration_name = AstBridge.declaration_name =
  | DN_Identifier			of string
  | DN_ObjCZeroArgSelector
  | DN_ObjCOneArgSelector
  | DN_ObjCMultiArgSelector
  | DN_CXXConstructorName		of ctyp
  | DN_CXXDestructorName		of ctyp
  | DN_CXXConversionFunctionName
  | DN_CXXOperatorName			of overloaded_operator_kind
  | DN_CXXLiteralOperatorName
  | DN_CXXUsingDirective


  (* All of the above derive Show. *)
  deriving (Show)
