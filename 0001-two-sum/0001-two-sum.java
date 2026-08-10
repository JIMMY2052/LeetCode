class Solution {
    public int[] twoSum(int[] nums, int target) {
        // 1. Corrected capitalization and initialization
        HashMap<Integer, Integer> hm = new HashMap<>();
        
        for (int i = 0; i < nums.length; i++) {
            // 2. Corrected math logic: complement = target - nums[i]
            int complement = target - nums[i];
            
            // 3. Changed containValue to containsKey for O(1) lookup
            if (hm.containsKey(complement)) {
                // 4. Returned a new anonymous array instantly
                return new int[]{hm.get(complement), i};
            }
            
            // Store the number as the KEY and its index as the VALUE
            hm.put(nums[i], i);
        }
        
        // 5. Added a fallback return statement to satisfy the compiler
        return new int[]{};
    }
}