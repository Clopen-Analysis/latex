def irrational_rotation(frequency):
    # Yield the forwards orbit of the irrational rotation with angle 2 * pi * frequency and initial data 0.
    y = 0
    yield (cos(y), sin(y))
    theta = 2 * pi * frequency
    while True:
        y = y + theta
        yield (cos(y), sin(y))

def irrational_rotation_plot(iterations=300, frequency=1031/7919):
    # 1031 and 7919 are both large primes, so 1031/7919 "looks like" an irrational number
    j = 0
    pointcloud = []
    for p in irrational_rotation(frequency):
        print(p)
        if j == iterations:
            break
        j = j + 1
        pointcloud.append(point(p, alpha=(iterations-j)/iterations))
    return sum(pointcloud)
