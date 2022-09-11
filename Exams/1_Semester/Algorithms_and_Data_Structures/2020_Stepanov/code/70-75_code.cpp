result = 0;
while (f(r)>l) {
    result += T[r];
    r = (int)f(r) - 1;
}
while (g(l)<=r) {
    result += M[l];
    l = (int)g(l);
}