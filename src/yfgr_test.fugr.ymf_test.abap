FUNCTION YMF_TEST.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IM_P1) TYPE  YDE_APELLIDO OPTIONAL
*"     VALUE(IM_P2) TYPE  YED_NOMBRE OPTIONAL
*"  EXPORTING
*"     REFERENCE(EX_P1) TYPE REF TO  STRING
*"  RAISING
*"      CX_SY_ZERODIVIDE
*"     RESUMABLE(CX_SY_ASSIGN_CAST_ERROR)
*"----------------------------------------------------------------------
ENDFUNCTION.
