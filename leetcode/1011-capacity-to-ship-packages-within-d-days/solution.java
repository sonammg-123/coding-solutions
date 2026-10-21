class Solution {
    public int shipWithinDays(int[] weights, int days) {
        
        int left = 0;
        int right = 0;
        for(int weight : weights){
            left = Math.max( left , weight);
            right += weight;
        }

        while(left < right){
            int mid = left + (right - left) / 2;
            int d = 1;
            int currentload = 0;

            for(int weight : weights){
                if(currentload + weight > mid){
                    d++;
                    currentload = weight;
                } else {
                    currentload += weight;
                }
            } 

            if(d <= days){
                right = mid;
            } else {
                left = mid + 1;
            }
        }
        return left;
    }
}
