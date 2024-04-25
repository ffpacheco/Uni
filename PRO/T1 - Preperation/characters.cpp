#include <iostream>
using namespace std;

int main() {
    char cara;
    cin >> cara;
    if (cara >= '0' && cara <= '9') {
        cout << "DIGIT" << endl;
    } else if (cara >= 'a' && cara <= 'z') {
        cout << "LETTER" << endl;
    } else if (cara >= 'A' && cara <= 'Z') {
        cout << "LETTER" << endl;
    } else {
        cout << "OTHER" << endl;
    }
    return 0;
}
