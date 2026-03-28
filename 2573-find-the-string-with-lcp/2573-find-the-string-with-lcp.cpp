class Solution {
public:
    struct DSU {
        vector<int> p, r;
        DSU(int n) {
            p.resize(n);
            r.assign(n, 0);
            iota(p.begin(), p.end(), 0);
        }
        int find(int x) {
            if (p[x] != x) p[x] = find(p[x]);
            return p[x];
        }
        void unite(int a, int b) {
            a = find(a);
            b = find(b);
            if (a == b) return;
            if (r[a] < r[b]) swap(a, b);
            p[b] = a;
            if (r[a] == r[b]) r[a]++;
        }
    };

    string findTheString(vector<vector<int>>& lcp) {
        int n = lcp.size();
        DSU dsu(n);

        // Step 1: union positions that must have same starting char
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                if (lcp[i][j] > 0) {
                    dsu.unite(i, j);
                }
            }
        }

        // Step 2: assign smallest lexicographical characters
        string word(n, '?');
        unordered_map<int, char> mp;
        char cur = 'a';

        for (int i = 0; i < n; i++) {
            int root = dsu.find(i);
            if (!mp.count(root)) {
                if (cur > 'z') return "";
                mp[root] = cur++;
            }
            word[i] = mp[root];
        }

        // Step 3: build actual lcp matrix and verify
        vector<vector<int>> actual(n, vector<int>(n, 0));

        for (int i = n - 1; i >= 0; i--) {
            for (int j = n - 1; j >= 0; j--) {
                if (word[i] == word[j]) {
                    actual[i][j] = 1;
                    if (i + 1 < n && j + 1 < n) {
                        actual[i][j] += actual[i + 1][j + 1];
                    }
                } else {
                    actual[i][j] = 0;
                }
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (actual[i][j] != lcp[i][j]) return "";
            }
        }

        return word;
    }
};