" Vim syntax file
" Language:		HLSL
" Maintainer:	LNSEAB <lnseab@gmail.com>

if exists( "b:current_syntax" )
	finish
endif

syntax case ignore

syn keyword hlslReturn		return
syn	keyword	hlslBreak		break
syn	keyword hlslContinue	continue
syn keyword hlslDiscard		discard

syn keyword hlslIf			if
syn keyword hlslElse		else
syn keyword hlslSwitch		switch
syn keyword hlslCase		case
syn keyword hlslDefault		default

syn keyword hlslDo			do
syn keyword hlslFor			for
syn keyword hlslWhile		while

syn keyword hlslExtern			extern
syn keyword hlslNointerpolation	nointerpolation
syn keyword hlslPrecise			precise
syn keyword hlslShared			shared
syn keyword hlslGroupShared		groupshared
syn keyword hlslStatic			static
syn keyword hlslUniform			uniform
syn keyword hlslVolatile		volatile
syn keyword hlslRegister		register
syn keyword	hlslIn				in
syn keyword	hlslOut				out
syn keyword hlslInOut			inout

syn keyword hlslInline		inline
syn keyword hlslCompile		compile

syn keyword hlslConst		const
syn keyword hlslRowMajor	row_major
syn keyword hlslColumnMajor	column_major

syn keyword hlslStruct		struct
syn keyword	hlslTechnique	technique
syn keyword hlslPass		pass

syn keyword hlslTypedef	typedef
syn keyword hlslType	bool int uint half float double Buffer vector matrix void string
syn keyword hlslTexture	texture Texture1D Texture1DArray Texture2D Texture2DArray Texture3D TextureCube
syn keyword hlslSampler	sampler sampler1D sampler2D sampler3D samplerCUBE sampler_state SamplerState	

syn keyword hlslShaderProfile1	vs_1_1 
syn keyword hlslShaderProfile2	ps_2_0 ps_2_x vs_2_0 vs_2_x 
syn keyword hlslShaderProfile3	ps_3_0 vs_3_0 
syn keyword hlslShaderProfile4	gs_4_0 ps_4_0 vs_4_0 gs_4_1 ps_4_1 vs_4_1 cs_4_0 cs_4_1
syn keyword hlslShaderProfile5	cs_5_0 ds_5_0 gs_5_0 hs_5_0 ps_5_0 vs_5_0

syn keyword hlslVertexShader	VertexShader
syn keyword hlslPixelShader		PixelShader

syn keyword hlslTrue	true
syn keyword hlslFalse	false
syn keyword hlslNone	none

" Types 
syn match	hlslVector	"\%(int\|uint\|half\|float\|double\)[1-4]" contains=hlsltype
syn match	hlslMatrix	"\%(int\|uint\|half\|float\|double\)[1-4]x[1-4]" contains=hlsltype

" Literal
syn	match	hlslNumber			"\<[0-9]\+\%(\.[0-9]*\%([eE][+-][0-9]\+\)\?[flFL]\?\)\?" 
syn	match	hlslFloatDecimal	"\.[0-9]\+\%([eE][+-][0-9]\+\)\?[flFL]\?"
syn	match	hlslFloatNoPoint	"\<[0-9]\+[eE][+-][0-9]\+[flFL]\?"	
syn	match	hlslHexNumber		"\<0x[0-9a-fA-F]\+"
syn region	hlslCharacter		start=+'+ skip=+\\'+ end=+'+
syn region	hlslString			start=+"+ skip=+\\"+ end=+"+

" Comment
syn region	hlslComment			start="/\*" end="\*/" fold extend
syn match	hlslCommentError	display "\*/"
syn	region	hlslCommentLine		start="//" end="$" keepend

" Preprocessor
syn region	hlslPPConditional	start="#\s*\%(if\|ifdef\|ifndef\|elif\|else\)" end="$"
syn match	hlslPPEndIf			"#\s*endif"
syn	match	hlslPPInclude		"#\s*include\s*[<\"][^>\"]\+[>\"]"
syn match	hlslPPLine			"#\s*line\s\+[0-9]\+\s\+\%(\"[^\"]\+\"\)\?"
syn region	hlslPPDefine		start="#\s*define" skip="\\\s*$" end="$" keepend
syn match	hlslPPUndef			"#\s*undef"
syn region	hlslPPPragma		start="#\s*pragma" skip="\\\s*$" end="$" keepend
syn region	hlslPPError			start="#\s*error" end="$" keepend
syn match	hlslPPEmpty			"#\s*$"

" Brackets
syn region	hlslParen			transparent start="(" end=")" contains=TOP,hlslParenError
syn	match	hlslParenError		display ")"
syn region	hlslCurly			transparent start="{" end="}" contains=TOP,hlslCurlyError
syn match	hlslCurlyError		display "}"

" Semantics
syn region	hlslConditionalOperator		start="[a-zA-Z0-9_().]\+\s*?" end=":\s*[a-zA-Z0-9_().]\+"
syn match	hlslSemantics				":\s*\w\+" contains=ALLBUT,hlslConditionalOperator

syntax case match

hi def link	hlslReturn		Statement
hi def link	hlslBreak		Statement
hi def link	hlslContinue	Statement
hi def link	hlslDiscard		Statement

hi def link	hlslIf			Conditional
hi def link	hlslElse		Conditional
hi def link	hlslSwitch		Conditional
hi def link	hlslCase		Label
hi def link	hlslDefault		Label

hi def link hlslDo			Repeat
hi def link hlslFor			Repeat
hi def link	hlslWhile		Repeat

hi def link hlslExtern			StorageClass
hi def link hlslNointerpolation	StorageClass
hi def link	hlslPrecise			StorageClass
hi def link	hlslShared			StorageClass
hi def link	hlslGroupShared		StorageClass
hi def link hlslStatic			StorageClass
hi def link	hlslUniform			StorageClass
hi def link	hlslVolatile		StorageClass
hi def link	hlslRegister		StorageClass
hi def link	hlslIn				StorageClass
hi def link	hlslOut				StorageClass
hi def link	hlslInOut			StorageClass

hi def link hlslInline		Keyword
hi def link hlslCompile		Keyword

hi def link hlslConst		StorageClass
hi def link hlslRowMajor	StorageClass
hi def link hlslColumnMajor	StorageClass

hi def link	hlslStruct		Structure
hi def link	hlslTechnique	Structure
hi def link	hlslPass		Structure

hi def link	hlslTypedef		Keyword
hi def link	hlslType		Type
hi def link	hlslTexture		Type
hi def link	hlslSampler		Type

hi def link hlslShaderProfile1	Identifier
hi def link hlslShaderProfile2	Identifier
hi def link hlslShaderProfile3	Identifier
hi def link hlslShaderProfile4	Identifier
hi def link hlslShaderProfile5	Identifier

hi def link	hlslVertexShader	Keyword
hi def link hlslPixelShader		Keyword

hi def link	hlslTrue	Constant
hi def link	hlslFalse	Constant
hi def link hlslNone	Constant

hi def link	hlslVector	Type
hi def link	hlslMatrix	Type

hi def link	hlslNumber			Constant
hi def link hlslFloatDecimal	Constant
hi def link hlslFloatNoPoint	Constant
hi def link hlslHexNumber		Constant
hi def link	hlslCharacter		Constant
hi def link	hlslString			Constant

hi def link	hlslComment			Comment
hi def link hlslCommentError	Error
hi def link hlslCommentLine		Comment

hi def link	hlslPPConditional	PreProc
hi def link	hlslPPEndIf			PreProc
hi def link	hlslPPInclude		PreProc
hi def link	hlslPPLine			PreProc
hi def link hlslPPDefine		PreProc
hi def link hlslPPUndef			PreProc
hi def link hlslPPPragma		PreProc	
hi def link	hlslPPError			PreProc
hi def link hlslPPEmpty			PreProc

hi def link	hlslParenError		Error
hi def link hlslCurlyError		Error

hi def link hlslSemantics		Identifier

let b:current_syntax = "hlsl"

"vim; ts=4
