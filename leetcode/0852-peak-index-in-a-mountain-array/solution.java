class Solution 
{
    public int peakIndexInMountainArray(int[] arr) 
    {
        int low=0;
        int high=arr.length;
        int len=high;
        high--;
        while(low<=high)
        {
            int mid=low+(high-low)/2;
            if(mid>0&&mid<len-1)
            {
                if(arr[mid]>arr[mid+1]&&arr[mid]>arr[mid-1])
                    return mid;
                
                else if(arr[mid]<arr[mid+1]) 
                    low=mid+1;
                else
                    high=mid-1;
            }
            if(mid==len-1)
            high=mid-1;
            else if(mid==0)
            low=mid+1;
        }    
        return 1;
    }
}
