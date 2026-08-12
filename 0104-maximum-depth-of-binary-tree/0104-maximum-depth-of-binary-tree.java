/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
   public int maxDepth(TreeNode root) {
    return traverse(root, 0);
}

public int traverse(TreeNode cur, int curDepth) {
    if(cur == null) return curDepth;
    curDepth++;
    return Math.max(traverse(cur.left, curDepth), traverse(cur.right, curDepth));
}
}