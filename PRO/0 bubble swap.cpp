for (int i = 0; i < n - 1; ++i) {
    for (int j = 0; j < n - 1 - i; ++j) {
        if (copy[j] > copy[j + 1]) {
            int temp    = copy[j];
            copy[j]     = copy[j + 1];
            copy[j + 1] = temp;
        }
    }
}
