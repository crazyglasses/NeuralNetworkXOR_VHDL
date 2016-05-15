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

#ifndef H_Work_mypackage_H
#define H_Work_mypackage_H

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


#include "ieee/std_logic_1164/std_logic_1164.h"

class Work_mypackage: public HSim__s6 {
public:
  HSimArrayType Array1base;
  HSimArrayType Array1;
  Work_mypackage(const HSimString &name);
  ~Work_mypackage();
};

extern Work_mypackage *WorkMypackage;

#endif
