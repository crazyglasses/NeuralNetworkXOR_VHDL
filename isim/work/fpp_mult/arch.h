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

#ifndef H_Work_fpp_mult_arch_H
#define H_Work_fpp_mult_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_fpp_mult_arch: public HSim__s6 {
public:

    HSim__s1 SE[8];

HSimConstraints *c40;
  char *t41;
HSim__s4 Cd;
  HSimEnumType Mult_sm;
    HSim__s1 SA[6];
    Work_fpp_mult_arch(const char * name);
    ~Work_fpp_mult_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_fpp_mult_arch(const char *name);

#endif
