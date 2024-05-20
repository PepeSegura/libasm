int main(void)
{
    int i = 0;
    while (i < 128)
    {
        printf("is %d [%c] a space:%d\n", i, i, isspace(i));
        i++;
    }
}