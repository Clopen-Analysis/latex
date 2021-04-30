def bell_curve_plot():
    return plot(0.5 * (1 + erf(x/sqrt(2))), (x, -3, 3), thickness=3, color="blue") + plot(1/sqrt(2 * pi) * exp(-0.5 * x^2), (x, -3, 3), thickness=3, color="green")
