////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_floatpt_H
#define H_Work_floatpt_H

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


#include "ieee/numeric_std/numeric_std.h"
#include "ieee/std_logic_1164/std_logic_1164.h"

class Work_floatpt: public HSim__s6 {
public:
/* subprogram name SIGNED_TO_FP */
char *Gf(HSimConstraints *reConstr, const char *Eb, const HSimConstraints *constrEb);
/* subprogram name FP_TO_SIGNED */
char *Gr(HSimConstraints *reConstr, const char *Ej, const HSimConstraints *constrEj, const int En);

public:

public:
  Work_floatpt(const HSimString &name);
  ~Work_floatpt();
};

extern Work_floatpt *WorkFloatpt;

#endif
