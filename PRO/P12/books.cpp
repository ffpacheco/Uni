#include "Book.h"
#include "Page.h"
#include <string>
#include <map>
#include <fstream>
#include <sstream>
#include <iostream>
using namespace std;

void Book::build_index(const std::set<std::string> &words)
{
    index_.clear();

    for (size_t page_n = 0; page_n < book_.size(); ++page_n)
    {
        const Page &page = book_[page_n];
        std::set<std::string> found_words;
        for (size_t line_n = 0; line_n < page.get_num_lines(); ++line_n)
        {
            std::istringstream line_stream(page.get_line(line_n));
            std::string w;

            while (line_stream >> w)
            {
                if (words.find(w) != words.end())
                {
                    found_words.insert(w);
                }
            }
        }

        for (const std::string &word : found_words)
        {
            index_[word].insert(page_n + 1);
        }
    }
}
