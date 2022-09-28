//a - массив элементов
stack<int> s;
for (int i = 0; i <= n; ++i) {
	while (s.empty() == false && a[s.top()] <= a[i]) { 
		s.pop();
	}
	if (s.empty() == true) {
		f[i] = -1;
	} else {
		f[i] = s.top();
	}
	s.push(i);
}