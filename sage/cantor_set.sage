def split(interval):
    # Split a Cantor set interval in two.
    left = interval[0]
    right = interval[1]
    return [[left, left + 1/3 * (right - left)], [left + 2/3 * (right - left), right]]

def plot_cantor_set(iterates=5, thickness=1, color="blue"):
    plots = []
    intervals = [[0, 1]]

    for i in range(iterates):
        new_intervals = []
        print("Printing " + str(len(intervals)) + " intervals at stage " + str(i))
        for interval in intervals:
            plots.append(plot(-i, (x, interval[0], interval[1]), color=color, thickness=thickness, axes=False))
            for child in split(interval):
                new_intervals.append(child)
        intervals = new_intervals

    return sum(plots)
