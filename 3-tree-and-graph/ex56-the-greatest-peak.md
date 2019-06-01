# The Greatest Peaks

The Royal Army is setting up defenses and they asked you, the Royal Engineer, to help them. They're looking to identify the dominant peaks and areas near the border. Can you help them?

## Details

You are given a square map of altitudes of different areas. A peak is a cell surrounded by lower values. A peak's area is the area controlled by that peak. Cells that can be reached by continuously descending (in 4 directions) from a peak are controlled by that peak. A cell that can be reached by descending from more than one cell belongs to the area of the the higher-value cell. Can you identify the smallest and largest areas in each grid?

## Guideline

Grids can also be searched with Graph-Search Techniques. Identify the cells to search from to form a map of the area...

## Challenge

Return an array with the smallest and largest area in each grid.

### Example 1

### Input

```
9 8 5
5 6 3
8 4 1
```

### Output

`[3, 6]`

Explanation
The top 9 and bottom 8 are peaks. The 2 areas are:

```
A A A
A A A
B B B
```

### Example 2

### Input

```
8 12
9 3
```

### Output

`[1, 3]`

Explanation
The 2 areas are:

```
A A
B A
```

### Example 3

Input

```
2  6  9  11
7  8  9  8
6  7  12 9
10 7  6  4
```

### Output

`[3, 9]`

### Explanation

The 3 areas are:

```
B A A A
B B B A
C B B B
C C B B
```
