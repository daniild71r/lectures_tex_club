map<vector<int>, int> num;
vector<int> classes; // вектор классов экв. по изоморфизму для вершин деревьев
ll c = 0; // количество классов

void dfs (int v) {
  vector<int> ans;
  for(int u: сын v) {
    dfs(u);
    ans.push_back(classes[u]);
  }
  sort(ans.begin(), ans.end());
  if (!num.count(ans)) {
    num[ans] = c++;
  }
  classes[v] = num[ans];
}
