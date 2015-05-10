/*
 * $Id: main.cpp,v 1.8 2005/02/16 10:45:39 tsuruoka Exp $
 */
// Enable C++11 via this plugin to suppress 'long long' errors
// [[Rcpp::plugins("cpp11")]]
#include <unistd.h>
#include <stdio.h>
#include <fstream>
#include <map>
#include <list>
#include <iostream>
#include <sstream>
#include "maxent.h"
#include "common.h"
#include <Rcpp.h>
#include <vector>
#include <regex>
using namespace Rcpp;

using namespace std;

string bidir_postag(const string & s, const vector<ME_Model> & vme, const vector<ME_Model> & cvme, bool dont_tokenize);
void bidir_chunking(vector<Sentence> & vs, const vector<ME_Model> & vme);
void init_morphdic();


void version()
{
  cout << "Using GENIA Tagger 3.0" << endl << endl;
}

// regular expression

std::vector<std::string>
  resplit(const std::string & s, std::string rgx_str) {
    
    
    std::vector<std::string> elems;
    
    std::regex rgx (rgx_str);
    
    std::sregex_token_iterator iter(s.begin(), s.end(), rgx, -1);
    std::sregex_token_iterator end;
    
    while (iter != end)  {
      //std::cout << "S43:" << *iter << std::endl;
      elems.push_back(*iter);
      ++iter;
    }
    
    return elems;
    
  }








extern void load_ne_models();

// [[Rcpp::export]]
CharacterVector genia_(CharacterVector file,CharacterVector path)
{
  bool dont_tokenize = false;
  //   int argc=2;
  //   char *argv[]={"abc","/Users/lipidong/Desktop/genia.txt"};
  istream *is(&cin);
  
  string ifilename, ofilename, wd_path;
 
  ifilename= as<std::string>(file[0]);
  wd_path = as<std::string>(path[0]);
  char* c_path = const_cast<char*>(wd_path.c_str());
  
  // ifilename = "/Users/lipidong/Desktop/genia.txt";
  ifstream ifile;
  if (ifilename != "" && ifilename != "-") {
    ifile.open(ifilename.c_str());
    if (!ifile) { cerr << "error: cannot open " << ifilename << endl; exit(1); }
    is = &ifile;
  }
  
  init_morphdic();
  
  vector<ME_Model> vme(16);
  
  cerr << "loading pos_models";
  for (int i = 0; i < 16; i++) {
    char buf[1000];
    //sprintf(buf, "/Users/lipidong/baiduyun/work/RFile/genia/src/models_medline/model.bidir.%d", i);
    sprintf(buf, "%s/extdata/models_medline/model.bidir.%d",c_path, i);
    
    vme[i].load_from_file(buf);
    cerr << ".";
  }
  cerr << "done." << endl;
  
  cerr << "loading chunk_models";
  vector<ME_Model> vme_chunking(16);
  for (int i = 0; i < 8; i +=2 ) {
    char buf[1000];
    sprintf(buf, "%s/extdata/models_chunking/model.bidir.%d",c_path, i);
    vme_chunking[i].load_from_file(buf);
    cerr << ".";
  }
  cerr << "done." << endl;
  
  load_ne_models();
  
  string line;
  int n = 1;
  
  vector<string> out;
  
  while (getline(*is, line)) {
    
    // regular expression
    //vector<string> v222 = resplit(line, "[\\.?!]\\s(?=[A-Z])");
    
    
   // for (const auto & e: v222) {
      
      if (line.size() > 1024) {
        cerr << "warning: the sentence seems to be too long. " << n;
      }
      string postagged = bidir_postag(line, vme, vme_chunking, dont_tokenize);
      //cout << postagged << endl;
      out.push_back(postagged);
      //out.push_back(".\t.\t.\tO\tO\n");
      out.push_back("\t\t\t\t\t\n");
      n++;
      // cout<<n<<endl;
      
    
    
    
  }
  
  CharacterVector result = wrap(out);
  vector<string>().swap(out);
  return result;
}


