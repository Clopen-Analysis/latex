def lp_comparison():
    One = plot(0.1, (x, -5, 5), thickness=3, color="blue")
    Infty = plot(0, (x, -5, -0.1), thickness=3, color="green") + plot(0, (x, 0.1, 5), thickness=3, color="green") + plot(1, (x, -0.1, 0.1), thickness=3, color="green")
    return One + Infty
