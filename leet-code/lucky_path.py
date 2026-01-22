"""
You said:
PROBLEM – 1 : Lucky Path Counter
Problem Title
Count of Lucky Paths With Sum Divisible by K
Problem Description
You are given N distinct paths, each identified by a coordinate pair xi,yix_i, y_ixi,yi and
associated with a numeric value viv_ivi. A path is considered Lucky if its value is
divisible by K.
Your task is to compute the total number of lucky paths.
Input Specification
● Line 1: Integer N – number of paths
● Line 2: Integer K – divisibility value
● Next N lines: Two integers xi,yix_i, y_ixi,yi – coordinates of each path
● Next N lines: One integer viv_ivi – value of each path
Output Specification
Print a single integer — number of lucky paths.
Constraints
● 1 ≤ N ≤ 10⁵
● 1 ≤ K ≤ 10⁹
● −10⁹ ≤ vᵢ ≤ 10⁹
Sample Input
5
2
0 0
1 4
1 3
1 5
2 1
2
4
6
5
2
Sample Output
4
Explanation
Values = [2, 4, 6, 5, 2] Divisible by K = 2 → 2, 4, 6, 2 Total Lucky Paths = 4
Approach
● Coordinates are irrelevant to the divisibility condition.
● Iterate through all values and check if vi%K==0v_i \% K == 0vi%K==0.
● Maintain a counter for lucky paths.
Time Complexity
O(N)
Space Complexity
O(1)
- 3 -"""

n=int(input())
k=int(input())

for _ in range(n):
    input()#ignore coordinates

count=0

for _ in range(n):
    value=int(input())
    if value % k==0:
        count+=1

print(f'Answer{count}')