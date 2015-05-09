//
//  CRF++ -- Yet Another CRF toolkit
//
//  $Id: crf_test.cpp 1587 2007-02-12 09:00:36Z taku $;
//
//  Copyright(C) 2005-2007 Taku Kudo <taku@chasen.org>
//
#include "crfpp.h"
#include "winmain.h"
#include "Rcpp.h"
#include <string>
using namespace Rcpp;
using namespace std;
// [[Rcpp::export]]
int crf_test_(CharacterVector test_data ,CharacterVector model, CharacterVector output, CharacterVector nbest, CharacterVector cost_factor) {
  string s_test= as<std::string>(test_data[0]);
  string s_model= as<std::string>(model[0]);
  string s_output = as<std::string>(output[0]);
  string s_nbest= as<std::string>(nbest[0]);
  string s_cost_factor= as<std::string>(cost_factor[0]);
   char* c_test = const_cast<char*>(s_test.c_str());
   char* c_model = const_cast<char*>(s_model.c_str());
   char* c_output = const_cast<char*>(s_output.c_str());
   char* c_nbest = const_cast<char*>(s_nbest.c_str());
   char* c_cost_factor = const_cast<char*>(s_cost_factor.c_str());

    char*argv[]={"crf_test", "-m", c_model, c_test, "-n", c_nbest, "-c", c_cost_factor, "-o", c_output};
    return crfpp_test(10, argv);
 // return crfpp_test(argc, argv);

}
