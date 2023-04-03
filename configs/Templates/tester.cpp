/*
 * tester.cpp
 */

#include <cmath>
#include <fstream>
#include <iostream>
#include <string>
using namespace std;

const double EPS = 1e-4;
double ans1, ans2;

int main(int argc, char const* argv[])
{

    ifstream test_in(argv[1]);  /* This stream reads from test's input file   */
    ifstream test_out(argv[2]); /* This stream reads from test's output file  */
    ifstream user_out(argv[3]); /* This stream reads from user's output file  */

    /* Your code here */
    /* If user's output is correct, return 0, otherwise return 1       */

    test_out >> ans1;
    user_out >> ans2;

    if (fabs(ans1 - ans2) < EPS)
        return 0;
    else
        return 1;
}
