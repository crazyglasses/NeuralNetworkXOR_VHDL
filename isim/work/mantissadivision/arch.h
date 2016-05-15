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

#ifndef H_Work_mantissadivision_arch_H
#define H_Work_mantissadivision_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_mantissadivision_arch: public HSim__s6 {
public:

    HSim__s4 PE[2];
    HSim__s1 SE[8];

  HSimEnumType Sm_type;
    HSim__s1 SA[8];
HSimConstraints *c10;
  char *t11;
    Work_mantissadivision_arch(const char * name);
    ~Work_mantissadivision_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_mantissadivision_arch(const char *name);

#endif
