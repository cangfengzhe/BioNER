#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <Rcpp.h>
#include <vector>
using namespace Rcpp;

using namespace std;
// [[Rcpp::export]]
int test() {
  char cwd[1024];
  if (getcwd(cwd, sizeof(cwd)) != NULL)
    fprintf(stdout, "Current working dir: %s\n", cwd);
  else
    perror("getcwd() error");
  return 0;
}
