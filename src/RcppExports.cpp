// This file was generated by Rcpp::compileAttributes
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// crf_learn_
int crf_learn_(CharacterVector template_data, CharacterVector train, CharacterVector model, CharacterVector freq, CharacterVector max_iterations, CharacterVector cost, CharacterVector eta, CharacterVector algorithm, CharacterVector shrinking_size, CharacterVector thread);
RcppExport SEXP BioTmR_crf_learn_(SEXP template_dataSEXP, SEXP trainSEXP, SEXP modelSEXP, SEXP freqSEXP, SEXP max_iterationsSEXP, SEXP costSEXP, SEXP etaSEXP, SEXP algorithmSEXP, SEXP shrinking_sizeSEXP, SEXP threadSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< CharacterVector >::type template_data(template_dataSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type train(trainSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type model(modelSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type freq(freqSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type max_iterations(max_iterationsSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type cost(costSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type eta(etaSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type algorithm(algorithmSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type shrinking_size(shrinking_sizeSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type thread(threadSEXP);
    __result = Rcpp::wrap(crf_learn_(template_data, train, model, freq, max_iterations, cost, eta, algorithm, shrinking_size, thread));
    return __result;
END_RCPP
}
// crf_test_
int crf_test_(CharacterVector test_data, CharacterVector model, CharacterVector output, CharacterVector nbest, CharacterVector cost_factor);
RcppExport SEXP BioTmR_crf_test_(SEXP test_dataSEXP, SEXP modelSEXP, SEXP outputSEXP, SEXP nbestSEXP, SEXP cost_factorSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< CharacterVector >::type test_data(test_dataSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type model(modelSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type output(outputSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type nbest(nbestSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type cost_factor(cost_factorSEXP);
    __result = Rcpp::wrap(crf_test_(test_data, model, output, nbest, cost_factor));
    return __result;
END_RCPP
}
// genia_
CharacterVector genia_(CharacterVector data, SEXP path);
RcppExport SEXP BioTmR_genia_(SEXP dataSEXP, SEXP pathSEXP) {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    Rcpp::traits::input_parameter< CharacterVector >::type data(dataSEXP);
    Rcpp::traits::input_parameter< SEXP >::type path(pathSEXP);
    __result = Rcpp::wrap(genia_(data, path));
    return __result;
END_RCPP
}
// rcpp_hello
List rcpp_hello();
RcppExport SEXP BioTmR_rcpp_hello() {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    __result = Rcpp::wrap(rcpp_hello());
    return __result;
END_RCPP
}
// test
int test();
RcppExport SEXP BioTmR_test() {
BEGIN_RCPP
    Rcpp::RObject __result;
    Rcpp::RNGScope __rngScope;
    __result = Rcpp::wrap(test());
    return __result;
END_RCPP
}
