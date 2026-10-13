class Solution {
    public int findMaxConsecutiveOnes(int[] nums) {

        int sum = 0;
        int count = 0;

        for(int n : nums){
             if( n == 1){
                count++;
        }else {
            sum = Math.max( sum , count);
            count = 0;
        }
    }
    return sum > count ? sum : count;
        
    }
}
