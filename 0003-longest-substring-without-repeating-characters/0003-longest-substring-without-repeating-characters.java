class Solution {
    public int lengthOfLongestSubstring(String s) {
        Map<Character, Integer> register = new HashMap<>();
        int low = 0;
        int high = 0;
        int maxLen = 0;
        while(high < s.length()){
        	char c = s.charAt(high);
        	if(register.containsKey(c)) {
        		int lastOccuringIdx = register.get(c);
        		low = Math.max(low, lastOccuringIdx + 1);
        	}
        	register.put(c, high);
        	maxLen = Math.max(maxLen, high-low+1);
        	high++;
        }
        return maxLen;
    } 
}