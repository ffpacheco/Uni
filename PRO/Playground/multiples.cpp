int solution(int number)
{
    int count = 0;
    if (number < 0)
        return 0;
    for (int i = 0; i < number; i++)
    {
        if (i % 3 == 0 && i % 5 != 0)
        {
            count += i;
        }
        if (i % 5 == 0 && i % 3 != 0)
        {
            count += i;
        }
        if (i % 5 == 0 && i % 3 == 0)
        {
            count += i;
        }
    }
    return count;
}