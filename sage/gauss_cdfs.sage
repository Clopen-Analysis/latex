def gauss_cdf_plot(sigma, thickness, color):
    # Return the plot of a Gaussian cdf with expectation 0 and standard deviation sigma.
    return plot(0.5 * (1 + erf(x/sigma * sqrt(2))), (x, -1, 1), thickness=thickness, color=color)

def heaviside_approximations_plot(colors=["blue","green","red","orange"],initial_sigma=1,thickness=3):
    # Plot a sequence of Gaussian cdfs converging to the Heaviside function almost everywhere.
    # The ith cdf has standard deviation initial_sigma/3^i and color colors[i].
    plots = []
    sigma = initial_sigma
    for i in range(len(colors)):
        plots.append(gauss_cdf_plot(sigma, thickness, colors[i]))
        sigma = sigma / 3
    return sum(plots)
