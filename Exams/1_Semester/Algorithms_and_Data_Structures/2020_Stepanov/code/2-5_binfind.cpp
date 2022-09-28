int N, x;
vector<int> a(N);

int left = 0, right = N; // [left, right) - границы рассматриваемой части массива. 
while (right - left > 1) {
    int middle = (left + right) / 2;
    if (a[middle] <= x) {
        left = middle;
    } else {
        right = middle;
    }
}

if (a[left] == x) {
    cout << left;
} else {
    cout << -1;
}