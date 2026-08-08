class Solution {
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        ListNode start = new ListNode(); // Your anchor head tracker
        ListNode root = start;           // Your moving pointer
        
        while (list1 != null && list2 != null) {
            // Compare values to pick the smaller item
            if (list1.val <= list2.val) {
                root.next = new ListNode(list1.val); // Link the value
                list1 = list1.next;                  // Move ONLY list1 forward
            } else {
                root.next = new ListNode(list2.val); // Link the value
                list2 = list2.next;                  // Move ONLY list2 forward
            }
            root = root.next; // Advance your moving tracker forward exactly one step
        }
        
        // Pick up remaining trailing items if one list finishes early
        if (list1 != null) {
            root.next = list1; // You can link the whole rest of the chain instantly!
        } else {
            root.next = list2;
        }
        
        return start.next; // Returns the clean head safely
    }
}
