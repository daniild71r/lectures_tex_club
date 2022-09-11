cnt[0 ... k] = {0, ..., 0}
for (size_t i = 0; i < n; ++i) {
    ++cnt[a[i]];
} // cnt[x] - кол-во вхождений элемента x в массив
for (size_t i = 0; i < k; ++i) {
    cnt[i] += cnt[i - 1];
} // cnt[x] - кол-во вхождений чисел <= x в массиве
ans[1 ... n] //отсорт. массив
for (size_t i = n - 1; i >= 0; --i) {
    ans[cnt[a[i]]--] = a[i];
}

