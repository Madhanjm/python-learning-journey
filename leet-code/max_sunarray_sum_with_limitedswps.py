"""PROBLEM – 2 : Maximum Subarray Sum With Limited Swaps
Problem Title
Maximum Subarray Sum After At Most S Swaps
Problem Description
You are given an integer array of size N. You are allowed to perform at most S swaps
between any two elements. After performing swaps (or without swaps), find the
maximum possible sum of a contiguous subarray.
Input Specification
● Line 1: Integer N – array size
● Line 2: Integer S – maximum allowed swaps
● Line 3: N space-separated integers – array elements
Output Specification
Print one integer – maximum possible subarray sum.
Constraints
● 1 ≤ N ≤ 10⁵
● 0 ≤ S ≤ N
● −10⁵ ≤ arr[i] ≤ 10⁵
Sample Input
5
1
1 -2 3 -1 5
Sample Output
9
Explanation
Initial array: [1, -2, 3, -1, 5]
● Maximum subarray without swap = 7
● Allowed swaps = 1
● Swap −2 and 5
● New array → [1, 5, 3, -1, -2]
● Maximum subarray = 9
Special Case (S = 0)
Output will be the standard Kadane’s Algorithm result.
Approach
● For S = 0 → Apply Kadane’s algorithm.
● For S > 0 →
○ Identify negative elements inside potential subarrays.
○ Replace them using maximum available elements outside the subarray.
● Use greedy + priority queue optimization.
Time Complexity
O(N log N)
Space Complexity
O(N)"""

def kandens_algo(arr):
    cur_sum=max_sum=arr[0]
    for num in arr:
        cur_sum=max(num,cur_sum+num)
        max_sum=max(max_sum,cur_sum)
    return max_sum

N = int(input())
S = int(input())
arr = list(map(int, input().split()))

if S==0:
    print(kandens_algo(arr))
else:
    arr.sort(reverse=True)
    total=0
    ans=0
    for i in arr:
        total+=i
        ans=max(total,ans)
    print(ans)