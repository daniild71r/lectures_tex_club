void CountingSort(long long* a, int n, int byte);
void LSDSort(long long* a, int n) {
    for (int r = 0; r < sizeof(long long); ++r) {
        CountingSort(a, n, r);
    }
}