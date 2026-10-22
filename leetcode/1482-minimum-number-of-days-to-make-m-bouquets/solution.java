class Solution {
    public int minDays(int[] bloomDay, int m, int k) {

    if ((long) m * k > bloomDay.length) {
    return -1;
     }

     int left = 1;
     int right = 0;

     for(int bd : bloomDay){
        right = Math.max(right , bd);
     }   
      while(left < right){
        int mid = left + (right - left) / 2;
        int flower = 0;
        int bouquets = 0;

        for(int bd : bloomDay){
            if(bd <= mid){
                flower++;
            }else {
                flower = 0;
            }
            if(flower == k){
                bouquets++;
                flower = 0;
            }
        }

        if(bouquets >= m){
            right = mid;
        }else {
            left = mid + 1;
        }
      }
      return left;
    }
}
