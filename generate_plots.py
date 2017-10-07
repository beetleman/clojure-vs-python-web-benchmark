#!/usr/bin/env python
import csv
from itertools import cycle
import matplotlib.pyplot as plt


def to_python(s):
    if s.endswith('app'):
        return s
    elif '.' in s:
        return float(s)
    else:
        return int(s)


def load(p):
    with open(p, 'r') as f:
        report = csv.reader(f)
        raw_data = [list(map(to_python, l)) for l in report]

    data = {}
    for i in raw_data:
        title = i[0]
        if title not in data:
            data[title] = []
        data[title].append(i[1:])
    return data


def plot(data, ax, y_index, x_index=0):
    markers = cycle(['o', 'x', '+', '*'])
    for label, rows in data.items():
        x = [i[x_index] for i in rows]
        y = [i[y_index] for i in rows]
        ax.scatter(x, y, label=label, marker=next(markers))


def plots(plots_desc, data):
    for p in plots_desc:
        title, x_desc, y_desc, prepare, fname = p
        x_label, x_index = x_desc
        y_label, y_index = y_desc
        fig, ax = plt.subplots()
        prepare(ax)
        ax.set_title(title)
        plot(data, ax, y_index, x_index)
        ax.legend()
        ax.set_xlabel(x_label)
        ax.set_ylabel(y_label)
        fig.savefig('plots/' + fname)


def main():
    plots(
        [
            [
                "Requests/sec",
                ["delay [ms]", 0],
                ["req/s", 1],
                lambda ax: ax.set_yscale("log", nonposx='clip'),
                "requests_per_sec.png"
            ],
            [
                "Transfer",
                ["delay [ms]", 0],
                ["KB/s", 2],
                lambda ax: ax.set_yscale("log", nonposx='clip'),
                "transfer.png"
            ],
            [
                "Latency",
                ["delay [ms]", 0],
                ["KB/s", 3],
                lambda ax: ax,
                "latency.png"
            ],
            [
                "Timeouts",
                ["delay [ms]", 0],
                ["errors", 5],
                lambda ax: ax,
                "timeouts.png"
            ],
            [
                "All Errors",
                ["delay [ms]", 0],
                ["errors", 6],
                lambda ax: ax,
                "all_errors.png"
            ]
        ],
        load('./results.csv')
    )


if __name__ == '__main__':
    main()
