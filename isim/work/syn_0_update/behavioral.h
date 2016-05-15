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

#ifndef H_Work_syn_0_update_behavioral_H
#define H_Work_syn_0_update_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_syn_0_update_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[12];

  char *t53;
    HSim__s1 SA[4];
  char *t54;
  char *t55;
  char *t56;
    Work_syn_0_update_behavioral(const char * name);
    ~Work_syn_0_update_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_syn_0_update_behavioral(const char *name);

#endif
