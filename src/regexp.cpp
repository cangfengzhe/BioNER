// // [[Rcpp::depends(BH)]]
//
// // Enable C++11 via this plugin to suppress 'long long' errors
// // [[Rcpp::plugins("cpp11")]]
// #include <iostream>
// #include <string>
// #include <regex>
// #include <iterator>
// #include <string>
// #include <regex>
// #include <Rcpp.h>
//
// using namespace Rcpp;
// using namespace std;
//
// std::vector<std::string>
//   resplit(const std::string & s, std::string rgx_str) {
//
//
//     std::vector<std::string> elems;
//
//     std::regex rgx (rgx_str);
//
//     std::sregex_token_iterator iter(s.begin(), s.end(), rgx, -1);
//     std::sregex_token_iterator end;
//
//     while (iter != end)  {
//       //std::cout << "S43:" << *iter << std::endl;
//       elems.push_back(*iter);
//       ++iter;
//     }
//
//     return elems;
//
//   }
//
// // [[Rcpp::export]]
// int test()
// {
//
//   string s222 = "first. Second! third? Forth";
//   vector<string> v222 = resplit(s222, "[\\.?!]\\s(?=[A-Z])");
//
//   for (const auto & e: v222) {
//     cout <<"Token:" << e << endl;
//   }
//
//   return 0;
//
// }