class Solution {
    public int splitArray(int[] nums, int k) {

        int left = 0;
        int right = 0;

        for(int num : nums){
            left = Math.max(left , num);
            right += num;
        } 

        while( left < right){
            int mid = left + (right - left) / 2;
            int split = 1;
            int sum = 0;

            for(int num : nums){
                if(num + sum > mid){
                    split++;
                    sum = num;
                }else {
                    sum += num;
                }
            }

            if(split <= k){
                right = mid;
            }else {
                left = mid + 1;
            }
        }
        return left;
    }
}
