class Solution {
    public int romanToInt(String s) {
        int n = s.length();
        int total = 0;
        int ans = 0;

        for (int i = n - 1; i >= 0; i--) {
            switch(s.charAt(i)) {
                case 'I': total = 1;
                break;
                case 'V': total = 5;
                break;
                case 'X': total = 10;
                break;
                case 'L': total = 50;
                break;
                case 'C': total = 100;
                break;
                case 'D': total = 500;
                break;
                case 'M': total = 1000;
                break;
            }
            if (4 * total < ans)
                ans -= total;
            else
                ans += total;
        }

        return ans;
    }
}