//类欧几里得算法，抄的

// java
class Solution {
    public long waysToBuyPensPencils(int total, int cost1, int cost2) {
        long ans = 0;
        for (int i = 0; i <= total; i += cost1) ans += (total - i) / cost2 + 1;
        return ans;
    }
}