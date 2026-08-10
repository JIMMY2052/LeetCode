class Solution {
    public int findMin(int[] arr) {
       int low = 0, high = arr.length - 1;

        while (low < high) {

            // If current range is sorted, first element is minimum
            if (arr[low] < arr[high])
                return arr[low];

            int mid = low + (high - low) / 2;

            // Minimum lies in right half
            if (arr[mid] > arr[high])
                low = mid + 1;
            // Minimum lies in left half (including mid)
            else
                high = mid;
        }

        // low == high points to the minimum element
        return arr[low];
    }
}