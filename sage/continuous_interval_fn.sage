def random_fourier(iterations, sigma):
    # Returns a random symbolic function on [0, 1] given by random Fourier coefficients with distribtion N(0, sigma).
    f = 0
    for i in range(iterations):
        f = f + gauss(0, 5) * cos(2 * pi * i * x) + gauss(0, 5) * sin(2 * pi * i * x)
    return f

def random_fourier_plot(iterations=10, sigma=5):
    f = random_fourier(iterations, sigma)
    return plot(f, (x, 0, 1), thickness=3)
