#include <iomanip>
#include <iostream>
#include <limits.h>
#include <queue>
#include <set>
#include <string.h>
#include <unordered_set>
#include <vector>

typedef long long ll;

///// fastIO & !stdio ///////
#define scanf dont_use_scanf
#define fscanf dont_use_fscanf
#define printf dont_use_printf
#define fprintf dont_use_fprintf
void fast_io(void) __attribute__((constructor));
void fast_io()
{
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);
    std::cout.tie(0);
}

/////////// pair /////////////
typedef std::pair<int, int> ipair;
static inline ipair new_pair(int a, int b)
{
    ipair t;
    t.first = a;
    t.second = b;
    return t;
}

///////////// heap friendly struct ///////////
struct Yal {
    int a;
    int b;
    int type;
    bool operator<(const Yal& other) const
    {
        return this->type > other.type;
    }
    bool operator==(const Yal& other) const
    {
        return (this->a == other.a) && this->b == other.b;
    }
    struct HashFunction {
        std::size_t operator()(const Yal& y) const
        {
            size_t xHash = std::hash<int>()(y.a);
            size_t yHash = std::hash<int>()(y.b) << 1;
            return xHash ^ yHash;
        }
    };
};

static inline Yal new_yal(int a, int b, int type)
{
    return { a, b, type };
}
typedef std::priority_queue<Yal, std::vector<Yal>> heap_yal_t;
typedef std::priority_queue<int> heap_t;

/////////// solution //////////////

#define MAX_N 100005
ll n;

int main()
{
    std::cin >> n;

    return 0;
}

//////// CHEAT SHEET ///////////
/*
 * *** heap ***
 * heap_t heap;
 *
 * heap.push(1)
 * cout << heap.top();
 * heap.pop();
 *
 * *** set ***
 * set cheat sheet
 * set<int> s;
 * unordered_set<Yal,Yal::HashFunction> s;
 * s.insert(1);
 * s.erase(1);
 * for(auto const& item : s){
 */
