#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

// Function prototypes
size_t  ft_strlen(const char *s);
char    *ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strdup(const char *s);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

void test_ft_strlen() {
    printf("Testing ft_strlen:\n\n");
    const char *test_cases[] = {"Hello, World!", "", "1234567890", " ", "\n", "A longer string with multiple words."};
    for (int i = 0; i < 6; i++) {
        const char *str = test_cases[i];
        size_t expected = strlen(str);
        size_t result = ft_strlen(str);
        printf("Input: \"%s\"\nExpected: %zu\nGot: %zu\n\n", str, expected, result);
    }
}

void test_ft_strcpy() {
    printf("Testing ft_strcpy:\n\n");
    const char *test_cases[] = {"Hello, World!", "", "1234567890", " ", "\n", "A longer string with multiple words."};
    char dest[100];
    for (int i = 0; i < 6; i++) {
        const char *src = test_cases[i];
        ft_strcpy(dest, src);
        printf("Source: \"%s\"\nDestination: \"%s\"\n\n", src, dest);
    }
}

void test_ft_strcmp() {
    printf("Testing ft_strcmp:\n\n");
    const char *test_cases[][2] = {
        {"Hello", "Hello"},
        {"Hello", "World"},
        {"", ""},
        {"123", "123"},
        {"abc", "ABC"},
        {"A longer string", "A longer string with more words"}
    };
    for (int i = 0; i < 6; i++) { 
        const char *str1 = test_cases[i][0];
        const char *str2 = test_cases[i][1];
        int expected = strcmp(str1, str2);
        int result = ft_strcmp(str1, str2);
        printf("Comparing: \"%s\" and \"%s\"\nExpected: %d\nGot: %d\n\n", str1, str2, expected, result);
    }
}

void test_ft_strdup() {
    printf("Testing ft_strdup:\n\n");
    const char *test_cases[] = {"Hello, World!", "", "1234567890", " ", "\n", "A longer string with multiple words."};
    for (int i = 0; i < 6; i++) {
        const char *src = test_cases[i];
        char *dup = ft_strdup(src);
        printf("Source: \"%s\"\nDuplicate: \"%s\"\n\n", src, dup);
        free(dup);
    }
}

void test_ft_write() {
    printf("Testing ft_write:\n\n");
    const char *test_cases[] = {"Hello, World!\n", "", "1234567890\n", " \n", "\n", "A longer string with multiple words.\n"};
    for (int i = 0; i < 6; i++) {
        const char *str = test_cases[i];
        ssize_t expected = write(STDOUT_FILENO, str, strlen(str));
        ssize_t result = ft_write(STDOUT_FILENO, str, strlen(str));
        printf("\nExpected: %zd\nGot: %zd\n\n", expected, result);
    }
}

void test_ft_read() {
    printf("Testing ft_read:\n\n");
    char buffer[50];
    ssize_t bytes_read = ft_read(STDIN_FILENO, buffer, 50);
    if (bytes_read >= 0) {
        buffer[bytes_read] = '\0';
        printf("Read: \"%s\"\nBytes read: %zd\n\n", buffer, bytes_read);
    } else {
        printf("Error: %s\n\n", strerror(errno));
    }
}

int main() {
    printf("====================================\n");
    test_ft_strlen();
    printf("====================================\n");
    test_ft_strcpy();
    printf("====================================\n");
    test_ft_strcmp();
    printf("====================================\n");
    test_ft_strdup();
    printf("====================================\n");
    test_ft_write();
    printf("====================================\n");
    test_ft_read();
    printf("====================================\n");
    return 0;
}