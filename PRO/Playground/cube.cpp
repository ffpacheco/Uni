bool is_cube(int volume, int side)
{
    if (volume > 0 && side > 0)
    {
        if (volume == side * side * side)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    else
    {
        return false;
    }
}