int persistence(long long n)
{
    int count = 0;

    while (n > 9)
    {
        long long product = 1;

        while (n > 0)
        {
            product *= n % 10;
            n /= 10;
        }

        n = product;
        count++;
    }

    return count;
}