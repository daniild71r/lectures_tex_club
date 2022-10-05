if (!del.empty()) del.pop();
else {
	while (!add.empty()) {
		int x = add.top();
		add.pop();
		del.push(x);
	}
	del.pop();
}