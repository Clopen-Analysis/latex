def polynomial(n, thickness, color):
    # Return the plot of x^{2^n} on [0, 1].
    return plot(x^(2^n), (x, 0, 1), thickness=thickness, color=color)

def nearly_uniform_plot(colors=["blue","green","red","orange"],thickness=3):
    # Plot a sequence of polynomials converging to zero nearly uniformly.
    plots = []
    for i in range(len(colors)):
        plots.append(polynomial(i, thickness, colors[i]))
    return sum(plots)
