#include <iostream>
#include <vector>
#include <utility>
#include <algorithm>

int main()
{
    int N;
    std::cin >> N;
    std::vector<std::pair<int, char>> events;

    for (int j = 0; j < N; j++)
    {
        int a, b;
        std::cin >> a >> b;
        events.push_back({a, 'A'});
        events.push_back({b, 'L'});
    }

    std::sort(events.begin(), events.end(), [](const std::pair<int, char> &a, const std::pair<int, char> &b)
         {
             if (a.first == b.first)
             {
                 return a.second > b.second; 
             }
             return a.first < b.first; 
    });

    int max = 0;
    int current = 0;
    for (int i = 0; i < 2*N; i++)
    {
        if (events[i].second == 'A')
        {
            current++;
            max = std::max(max, current);
        }
        else
            current--;
    }
    std::cout << max << std::endl;

    return 0;
}