#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#define FIFO_NAME1 "comm_pipe1"
#define FIFO_NAME2 "comm_pipe2"
int main()
{
    char s[500], vowel[20], send[100];
    int num, fd1, fd2, sig, k = 0, i, words = 0, characters = 0,
                            sentences = 0;
    FILE *fp;
    fp = fopen("fifo.txt", "w");
    mknod(FIFO_NAME1, S_IFIFO | 0666, 0);
    mknod(FIFO_NAME2, S_IFIFO | 0666, 0);
    printf("Waiting for producer process...\n");
    fd1 = open(FIFO_NAME1, O_RDONLY);
    fd2 = open(FIFO_NAME2, O_WRONLY);
    printf("Found the producer.\n");
    if ((num = read(fd1, s, 500)) == -1)
    {
        perror("Read...");
    }
    else
    {
        int character = 0, words = 0; sentences = 0;
        s[num] = '\0';
        printf("Read %d bytes from pipe 1: \"%s\"\n", num, s);
        vowel[0] = '\0';
        for (int i = 0; i < num; i++)
        {
            if (s[i] != ' ')
                characters++;
            if (s[i] == ' ' || s[i + 1] == '\0')
                words++;
            if (s[i] == '.')
                sentences++;
        }
        sprintf(send, "For this text, there are %d characters, %d words, %d sentences.\n", characters, words, sentences);
        fprintf(fp, "%s", send);
        if ((sig = write(fd2, send, strlen(send))) != -1)
            printf("Written to pipe 2 successfully.\n");
        else
            printf("Error while writing to pipe 2.");
    }
    close(fd1);
    close(fd2);
    fclose(fp);
    return 0;
}