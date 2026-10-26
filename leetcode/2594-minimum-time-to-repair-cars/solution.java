class Solution {
    public long repairCars(int[] ranks, int cars) {

        long left = 1;
        long minRank = Integer.MAX_VALUE;

        for(int rank : ranks){
            minRank = Math.min(minRank , rank);
        } 

          long right = minRank * cars * cars;

          while(left < right){
            long mid = left + (right - left) / 2;
            long repair = 0;

            for(int rank : ranks){
                repair += (long) Math.sqrt(mid / rank);
            }
            if(repair >= cars){
                right = mid;
            } else {
                left = mid + 1;
            }
          }

          return left;
    }
}
