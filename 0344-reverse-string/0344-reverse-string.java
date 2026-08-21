class Solution {
    public void reverseString(char[] s) {
        int len = s.length;
        // Only loop until the middle of the array
        for (int i = 0; i < len / 2; i++) {
            // Swap the front element with its matching back element
            char temp = s[i];
            s[i] = s[len - 1 - i];
            s[len - 1 - i] = temp;
        }
    }
}