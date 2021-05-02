class Ball:
    # A class for balls in euclidean space.
    def __init__(self, center, radius):
        self.center = center
        self.radius = radius

    def draw(self, alpha=1, fill=False, thickness=1, edgecolor="blue", facecolor="blue"):
        if len(self.center) != 2:
            print("Error: trying to draw in high dimension...")
            return False
        return circle(self.center, self.radius, fill=fill, thickness=thickness, alpha=alpha, edgecolor=edgecolor, facecolor=facecolor)

    def meets(self, ball):
        # Returns True iff self meets ball.
        if len(self.center) != len(ball.center):
            print("Error: Balls in different dimensions...")
            return False
        d = 0 # The distance squared between the centers of self and ball.
        for i in range(len(self.center)):
            d = d + (self.center[i] - ball.center[i])^2
        return (d < (self.radius + ball.radius)^2)

    def generate_random(left_bound, right_bound, radius_mean, radius_noise):
        # Returns a random ball with center in [left_bound, right_bound]^2, whose radius is about radius_mean with tolerance given by radius_noise.
        center = (uniform(left_bound, right_bound), uniform(left_bound, right_bound))
        radius = exp(gauss(log(radius_mean), radius_noise))
        return Ball(center, radius)

def sort_by_radius(balls):
    # Given a list of balls, return the same list sorted by radius, largest first, using heapsort.

    # Binary tree structure
    def parent(i):
        return floor((i - 1)/2)
    def left(i):
        return (2 * i) + 1
    def right(i):
        return (2 * i) + 2

    def heapify(b):
        # Create a heap
        end = len(b) - 1
        start = parent(end)
        while start > -1:
            sift(b, start, end)
            start = start - 1

    def sift(b, start, end):
        # Repair a damaged heap
        root = start
        while left(root) <= end:
            child = left(root)
            swap = root

            if b[swap].radius >= b[child].radius:
                swap = child
            if child + 1 <= end and b[swap].radius > b[child + 1].radius:
                swap = child + 1
            if swap == root:
                return
            y = b[root]
            b[root] = b[swap]
            b[swap] = y
            root = swap

    heapify(balls)
    end = len(balls) - 1
    while end > 0:
        y = balls[end]
        balls[end] = balls[0]
        balls[0] = y
        end = end - 1
        sift(balls, 0, end)


def vitali(balls):
    # Return a subset B of balls which is disjoint, such that the 3-dilates of B cover the same region as balls.
    sorted_balls = balls.copy()
    sort_by_radius(sorted_balls)
    subcover = []
    for i in range(len(sorted_balls)):
        if not any([b.meets(sorted_balls[i]) for b in subcover]):
            subcover.append(sorted_balls[i])
    return subcover

def draw_all(balls, alpha=1, fill=False, thickness=1, edgecolor="blue", facecolor="blue"):
    # Draw all balls in the list balls.
    return sum([ball.draw(alpha=alpha, fill=fill, thickness=thickness, edgecolor=edgecolor, facecolor=facecolor) for ball in balls])

def artistic_vitali(balls):
    # Return a list drawings of each step of the Vitali covering algorithm. The ball that is about to be added to the subcover is green,
    # the balls not in the subcover are blue, and the balls in the subcover are red.
    sorted_balls = balls.copy()
    unused_balls = balls.copy()
    sort_by_radius(sorted_balls)
    drawings = [draw_all(unused_balls)]
    subcover = []
    for i in range(len(sorted_balls)):
        if not any([b.meets(sorted_balls[i]) for b in subcover]):
            drawings.append(draw_all(unused_balls) + draw_all(subcover, edgecolor="red") + sorted_balls[i].draw(edgecolor="green"))
            subcover.append(sorted_balls[i])
            unused_balls.remove(sorted_balls[i])
    drawings.append(draw_all(unused_balls) + draw_all(subcover, edgecolor="red"))
    return drawings
