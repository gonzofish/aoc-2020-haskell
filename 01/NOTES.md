# AoC 2020 - "Day 1: Report Repair"

## Part 1

- Expense report is puzzle input
- Find two entries that sum to `2020`
  - Multiply those 2 numbers together

### Idea for Algo
- Sort list low to high
- Add lowest & greatest value
  - Too low? Shrink list to tail
  - Two high? Chop last value off list

### In Haskell

1721
979
366
299
675
1456

===>
299
366
675
979
1456
1721

1721 + 299 = 2020

<details>
  <legend><strong>SPOILER:</strong> Solution</legend>

  <ul>
    <li>
      Numbers: <code>527</code>, <code>1493</code>
    </li>
    <li>
      Solution: <code>786_811</code>
    </li>
</details>
