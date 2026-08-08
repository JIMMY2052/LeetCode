class Solution {
    public int removeDuplicates(int[] nums) {
        // To track seen elements
        HashSet<Integer> s = new HashSet<>();
        
        // To maintain the new size of the array
        int idx = 0;  

        for (int i = 0; i < nums.length; i++) {
            if (!s.contains(nums[i])) { 
                s.add(nums[i]);  
                nums[idx++] = nums[i];  
            }
        }

        // Return the size of the array 
        // with unique elements
        return idx;
    }

    
}