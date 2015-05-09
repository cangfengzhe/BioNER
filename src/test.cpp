//
  //  CRF++ -- Yet Another CRF toolkit
//
  //  $Id: crf_learn.cpp 1587 2007-02-12 09:00:36Z taku $;
//
  //  Copyright(C) 2005-2007 Taku Kudo <taku@chasen.org>
  //
  #include "crfpp.h"
  #include "winmain.h"
  #include "Rcpp.h"
  #include <string>
  using namespace std;
using namespace Rcpp;

// [[Rcpp::export]]

SEXP test(CharacterVector xs) {

  string template_data= Rcpp::as<std::string>(xs[0]);
  //char *str2=const_cast<char*>(cc.c_str());

   char*aa= const_cast<char*>(template_data.c_str());
    cout << aa;


  return(xs);
}