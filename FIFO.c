#include <stdio.h>

int main()
{

    int len;
    printf("Enter the Length of String : ");
    scanf("%d", &len);

    char s[len];
    printf("Enter the String : ");
    scanf("%s", s);

    int n;
    printf("Enter the number of page frames : ");
    scanf("%d", &n);

    char q[n];

    int c = 0;

    for (int i = 0; i < n; i++)
        q[i] = 'a';

    for (int i = 0; i < len; i++)
    {
        int j;
        int found = 0;
        for (j = 0; j < n; j++)
        {
            if (q[j] == s[i])
            {
                printf("----\n");
                found = 1;
                break;
            }

            if (q[j] == 'a')
            {
                q[j] = s[i];
                break;
            }
        }

        if (j == n)
            q[c++ % n] = s[i];

        if (!found)
        {
            for (int i = 0; i < n; i++)
                printf("%c ", q[i]);
            printf("\n");
        }
    }

    // int c = 1;

    return 0;
}