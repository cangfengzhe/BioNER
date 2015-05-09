//
//
#include "crfpp.h"
#include "winmain.h"
#include "Rcpp.h"
#include <string>
using namespace std;
using namespace Rcpp;

// [[Rcpp::export]]
int crf_learn_(CharacterVector template_data, CharacterVector train, CharacterVector model,
              CharacterVector freq, CharacterVector max_iterations,
              CharacterVector cost, CharacterVector eta,
              CharacterVector algorithm, CharacterVector shrinking_size) {


   string s_template_data= as<std::string>(template_data[0]);
   string s_train_data = as<std::string>(train[0]);
   string s_model_data= as<std::string>(model[0]);
   string s_freq= as<std::string>(freq[0]);
   string s_max_iterations= as<std::string>(max_iterations[0]);
   string s_cost= as<std::string>(cost[0]);
   string s_eta= as<std::string>(eta[0]);
   string s_algorithm= as<std::string>(algorithm[0]);
   string s_shrinking_size = as<std::string>(shrinking_size[0]);
   char* c_template = const_cast<char*>(s_template_data.c_str());
   char* c_train = const_cast<char*>(s_train_data.c_str());
   char* c_model = const_cast<char*>(s_model_data.c_str());
   char* c_freq = const_cast<char*>(s_freq.c_str());
   char* c_max_iterations = const_cast<char*>(s_max_iterations.c_str());
   char* c_cost = const_cast<char*>(s_cost.c_str());
   char* c_eta = const_cast<char*>(s_eta.c_str());
   char* c_algorithm = const_cast<char*>(s_algorithm.c_str());
   char* c_shrinking_size = const_cast<char*>(s_shrinking_size.c_str());
  // char *param[] = {"_learn", c_template, c_train, c_model,  "--freq", c_freq, "--maxiter", c_max_iterations,"-cost",  c_cost, "--eta", c_eta, "--algorithm", c_algorithm, "--shrinking-size", c_shrinking_size};

   char *param[] = {"_learn",  "-f", c_freq ,"-m", c_max_iterations, "-c",  c_cost, "-e", c_eta, "-a", c_algorithm, "-H", c_shrinking_size, c_template, c_train, c_model};


   int out = crfpp_learn(16, param);

   return 0;


}
