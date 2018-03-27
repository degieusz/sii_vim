" Vim syntax file
" Language:	C++ special highlighting for STL classes and methods
" Maintainer:	Nathan Skvirsky
" Last Change:	2006 Oct 22

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
if version < 600
  so <sfile>:p:h/c.vim
else
  runtime! syntax/c.vim
  unlet b:current_syntax
endif

" C++ extentions

syn keyword cppSTL		abort abs accumulate acos adjacent_difference adjacent_find adjacent_find_if any append asctime asin assert assign at atan atan2 atexit atof atoi atol auto_ptr back back_inserter bad bad_alloc bad_cast bad_exception bad_typeid badbit beg begin binary_compose binary_negate binary_search bind2nd binder1st binder2nd bitset bsearch c_str calloc capacity ceil cerr cin clear clearerr clock clog close compare compose1 compose2 const_iterator construct copy copy_backward copy_n cos cosh count count_if cout ctime data deque destroy difference_type difftime div divides domain_error empty end endl eof eofbit equal equal_range erase exception exit exp fabs fail failbit failure fclose feof ferror fflush fgetc fgetpos fgets fill fill_n find find_end find_first_not_of find_first_of find_if find_last_not_of find_last_of first flags flip floor flush fmod fopen for_each fprintf fputc fputs fread free freopen frexp front fscanf fseek fsetpos fstream ftell fwrite gcount generate generate_n get get_temporary_buffer getc getchar getenv getline gets gmtime good goodbit greater greater_equal hash_map hash_multimap hash_multiset hash_set ifstream ignore in includes inner_product inplace_merge insert inserter invalid_argument ios ios_base iostate iota is_heap is_open is_sorted isalnum isalpha iscntrl isdigit isgraph islower isprint ispunct isspace istream istream_iterator istringstream isupper isxdigit iter_swap iterator iterator_category key_comp ldiv length length_error less less_equal lexicographical_compare lexicographical_compare_3way list localtime log log10 logic_error logical_and logical_not logical_or longjmp lower_bound make_heap malloc map max max_element max_size mem_fun mem_fun1 mem_fun1_ref mem_fun_ref memchr memcpy memmove memset merge min min_element minus mismatch mktime modf modulus multimap multiplies multiset negate next_permutation npos nth_element numeric_limits ofstream open ostream ostream_iterator ostringstream out_of_range overflow_error pair partial_sort partial_sort_copy partial_sum partition peek perror plus pointer pointer_to_binary_function pointer_to_unary_function pop pop_back pop_front pop_heap pow power precision prev_permutation printf ptr_fun push push_back push_front push_heap put putback putc putchar puts qsort raise rand random_sample random_sample_n random_shuffle range_error rbegin rdbuf rdstate read realloc reference remove remove_copy remove_copy_if remove_if rename rend replace replace_copy replace_copy_if replace_if reserve reset resize return_temporary_buffer reverse reverse_copy reverse_iterator rewind rfind rotate rotate_copy runtime_error scanf search search_n second seekg seekp set set_difference set_intersection set_symmetric_difference set_union setbuf setf setjmp setlocale setvbuf signal sin sinh size size_t size_type sort sort_heap splice sprintf sqrt srand sscanf stable_partition stable_sort std str strcat strchr strcmp strcoll strcpy strcspn strerror strftime string strlen strncat strncmp strncpy strpbrk strrchr strspn strstr strtod strtok strtol strtoul strxfrm substr swap swap_ranges sync_with_stdio system tan tanh tellg tellp temporary_buffer test time time_t tmpfile tmpnam to_string to_ulong tolower top toupper transform unary_compose unary_negate underflow_error unget ungetc uninitialized_copy uninitialized_copy_n uninitialized_fill uninitialized_fill_n unique unique_copy unsetf upper_bound va_arg value_comp value_type vector vfprintf vprintf vsprintf width write nullptr

syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppType		inline virtual explicit export bool wchar_t
syn keyword cppExceptions	throw try catch noexcept
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable override final constexpr volatile decltype
syn keyword cppStructure	class typename template namespace
syn keyword cppNumber		NPOS
syn keyword cppBoolean		true false

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
if version >= 508 || !exists("did_cpp_syntax_inits")
  if version < 508
    let did_cpp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>[ ] 
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink cppAccess		cppStatement
  HiLink cppCast		cppStatement
  HiLink cppExceptions		Exception
  HiLink cppOperator		Operator
  HiLink cppStatement		Statement
  HiLink cppSTL			Identifier
  HiLink cppNCBI		Special
  HiLink cppType		Type
  HiLink cppStorageClass	StorageClass
  HiLink cppStructure		Structure
  HiLink cppNumber		Number
  HiLink cppBoolean		Boolean
  delcommand HiLink
endif


syn keyword CPlaneSpecial
		\ CPLANE_DEBUG GLO_TRUE GLO_FALSE CPLANE_ERROR CPLANE_WARN CPLANE_INFO
		\ BASE_SUCCESS BASE_FAILURE BASE_WARNING BASE_INVALID_PARAM BASE_TIMER_EXPIRED BASE_UNEXPEC_STATE BASE_UNEXPEC_EVENT BASE_OUT_OF_SERVICE BASE_ENTRY_EXISTS
		\ BASE_NOT_SUPPORTED BASE_DATA_FAILURE BASE_TIMER_TICK BASE_PROTOCOL_ERROR BASE_ROLLBACK BASE_OVERLOAD BASE_PROCESSING_SKIPPED BASE_COMMUNICATION_ERROR
		
		
syn keyword GoogleTestSpecial
	    \ SUCCEED FAIL ADD_FAILURE ADD_FAILURE_AT SCOPED_TRACE FRIEND_TEST RUN_ALL_TESTS


syn keyword GoogleTestAssert
	    \ ASSERT_TRUE ASSERT_FALSE
	    \ ASSERT_EQ ASSERT_NE ASSERT_LT ASSERT_LE ASSERT_GT ASSERT_GE ASSERT_THAT
	    \ ASSERT_STREQ ASSERT_STRNE ASSERT_STRCASEEQ ASSERT_STRCASENE
	    \ ASSERT_THROW ASSERT_ANY_THROW ASSERT_NO_THROW
	    \ ASSERT_PRED1 ASSERT_PRED2 ASSERT_PRED3 ASSERT_PRED4 ASSERT_PRED5
	    \ ASSERT_PRED_FORMAT1 ASSERT_PRED_FORMAT2 ASSERT_PRED_FORMAT3 ASSERT_PRED_FORMAT4 ASSERT_PRED_FORMAT5
	    \ ASSERT_FLOAT_EQ ASSERT_DOUBLE_EQ ASSERT_NEAR
	    \ ASSERT_HREF_SUCCEEDED ASSERT_HREF_FAILED
	    \ ASSERT_DEATH ASSERT_DEATH_IF_SUPPORTED ASSERT_EXIT
	    \ ASSERT_NO_FATAL_FAILURE
		\ CPPUNIT_TEST_SUITE CPPUNIT_TEST CPPUNIT_TEST_SUITE_END CPPUNIT_ASSERT CPPUNIT_ASSERT_EQUAL CPLANE_UT
		\ CPPUNIT_ASSERT_NO_THROW
		
syn keyword GoogleTestExpect
		\ EXPECT_CALL
	    \ EXPECT_TRUE EXPECT_FALSE
	    \ EXPECT_EQ EXPECT_NE EXPECT_LT EXPECT_LE EXPECT_GT EXPECT_GE
	    \ EXPECT_STREQ EXPECT_STRNE EXPECT_STRCASEEQ EXPECT_STRCASENE
	    \ EXPECT_THROW EXPECT_ANY_THROW EXPECT_NO_THROW
	    \ EXPECT_PRED1 EXPECT_PRED2 EXPECT_PRED3 EXPECT_PRED4 EXPECT_PRED5
	    \ EXPECT_PRED_FORMAT1 EXPECT_PRED_FORMAT2 EXPECT_PRED_FORMAT3 EXPECT_PRED_FORMAT4 EXPECT_PRED_FORMAT5
	    \ EXPECT_FLOAT_EQ EXPECT_DOUBLE_EQ EXPECT_NEAR
	    \ EXPECT_HREF_SUCCEEDED EXPECT_HREF_FAILED
	    \ EXPECT_DEATH EXPECT_DEATH_IF_SUPPORTED EXPECT_EXIT
	    \ EXPECT_NO_FATAL_FAILURE
	    \ EXPECT_FATAL_FAILURE EXPECT_NONFATAL_FAILURE 
	    \ EXPECT_FATAL_FAILURE_ON_ALL_THREADS EXPECT_NONFATAL_FAILURE_ON_ALL_THREADS
		
syn keyword GoogleTestMockMethods
		\ MOCK_CONST_METHOD0 MOCK_CONST_METHOD1 MOCK_CONST_METHOD2 MOCK_CONST_METHOD3 MOCK_CONST_METHOD4 MOCK_CONST_METHOD5 MOCK_CONST_METHOD6 MOCK_CONST_METHOD7 MOCK_CONST_METHOD8 MOCK_CONST_METHOD9 MOCK_CONST_METHOD10
		\ MOCK_METHOD0 MOCK_METHOD1 MOCK_METHOD2 MOCK_METHOD3 MOCK_METHOD4 MOCK_METHOD5 MOCK_METHOD6 MOCK_METHOD7 MOCK_METHOD8 MOCK_METHOD9 MOCK_METHOD10
		\ SCOPED_TRACE ON_CALL

syn keyword GoogleTestDecl
	    \ TEST TEST_F TEST_P TYPED_TEST TYPED_TEST_CASE TYPED_TEST_P TYPED_TEST_CASE_P NiceMock StrictMock MATCHER MATCHER_P MATCHER_P2 MATCHER_P3 MATCHER_P4 MATCHER_P5 FRIEND_TEST
	    \ TEST_TECH FDD_AND_TDD_SUBCLASSES TEST_TDD TEST_FDD

syn keyword GoogleTestInstantiation
	    \ INSTANTIATE_TEST_CASE_P REGISTER_TYPED_TEST_CASE_P INSTANTIATE_TYPED_TEST_CASE_P INSTANTIATE_TEST_CASE_TECHNOLOGY INSTANTIATE_TEST_CASE_TECHNOLOGY_COMBINED
		
syn keyword GoogleTestTypes
		\ InSequence testing StaticAssertTypeEq
		
syn keyword CPlaneType
	    \ u8 u16 u32 u64 i8 i16 i32 i64 TBoolean EBaseStatus
		
"syn match MacroDefinitions		"\<[A-Z_]*\>"
		
hi def link MacroDefinitions           Macro
hi def link CPlaneType                 Type
hi def link CPlaneSpecial              Macro
hi def link GoogleTestSpecial          Special
hi def link GoogleTestAssert           Macro
hi def link GoogleTestExpect           Macro
hi def link GoogleTestDecl             Identifier
hi def link GoogleTestInstantiation    Statement
hi def link GoogleTestMockMethods      Macro

let cOperatorList  = '[-&|:+<>=*/!~]'    " A list of symbols that we don't want to immediately precede the operator
let cOperatorList .= '\@<!'             " Negative look-behind (check that the preceding symbols aren't there)
let cOperatorList .= '\%('              " Beginning of a list of possible operators
let cOperatorList .=     '\('           " First option, the following symbols...
let cOperatorList .=        '[-&|+<>=:]'
let cOperatorList .=     '\)'
let cOperatorList .=     '\1\?'         " Followed by (optionally) the exact same symbol, so -, --, =, ==, &, && etc
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '->'           " Pointer dereference operator
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '<='           "
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '>='           "
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '>&'           " 
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '*>'           " 
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[-+*/%&^|!]=' " One of the listed symbols followed by an =, e.g. +=, -=, &= etc
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '[*?,^!~%]'     " Some simple single character operators
let cOperatorList .= '\|'               " Next option:
let cOperatorList .=     '\('           " One of the shift characters:
let cOperatorList .=         '[<>]'     
let cOperatorList .=     '\)'
let cOperatorList .=     '\2'           " Followed by another identical character, so << or >>...
let cOperatorList .=     '='            " Followed by =, so <<= or >>=.
let cOperatorList .= '\)'               " End of the long list of options
let cOperatorList .= '[-&|+:<>=*/!~^?]'    " The list of symbols that we don't want to follow
let cOperatorList .= '\@!'              " Negative look-ahead (this and the \@<! prevent === etc from matching)

exe "syn match cOperator display '" . cOperatorList . "'"

syn match cOperator display ';'
hi link cOperator Operator

let b:current_syntax = "cpp"

" vim: ts=8

