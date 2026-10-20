class Solution {
    public long minimumTime(int[] time, int totalTrips) {
        int minTime = time[0];

       for(int t : time){
        minTime  = Math.min(minTime , t);
       } 

     long left = 1 ;
     long right = (long) minTime * totalTrips;

       while(left < right){
        long mid = left + (right - left) / 2;
        long trips = 0 ; 

       for(int i = 0 ;  i < time.length ; i++){
             trips += mid/time[i];
        }

             if(trips >= totalTrips){
                right = mid;
             }else {
                left = mid + 1;
             }
       } 

       return left;
    }
}
