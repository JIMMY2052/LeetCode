import java.util.Arrays;
class Solution {
    public int thirdMax(int[] nums) {
        Arrays.sort(nums);
        int count = 1;
        int thirdLargest = nums[nums.length - 1];

        // Traverse from right to left to find distinct elements
        for (int i = nums.length - 2; i >= 0; i--) {
            if (nums[i] != nums[i + 1]) {
                count++;
                if (count == 3) {
                    thirdLargest = nums[i];
                    break;
                }
            }
        }

            return thirdLargest;

    }
}