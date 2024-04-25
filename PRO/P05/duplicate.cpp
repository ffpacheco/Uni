char *duplicate(const char s[]) {
    int len = 0;
    while (s[len] != '\0') { ++len; }
    char *res = new char[len + 1]; //+1 cause null ig
    for (int i = 0; i < len; ++i) { res[i] = s[i]; }
    res[len] = '\0';
    return res;
}