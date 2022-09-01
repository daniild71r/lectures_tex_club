//s - входная строка, s[i] либо число, либо +,-,*
stack <long long> st;
for (int i = 0; i < s.size(); ++i) {
    if (isNumber(s[i])) {
        st.push(s[i]);
    } else {
        long long x = st.top(); st.pop();
        long long y = st.top(); st.pop();
        st.push(y ? x); //нужно написать if в зависимости от s[i]
    }
}