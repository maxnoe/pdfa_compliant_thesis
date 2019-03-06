import matplotlib.pyplot as plt
import numpy as np
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('output')
args = parser.parse_args()

t = np.linspace(0, 1, 500)
plt.plot(t, np.sin(2 * np.pi * t))
plt.xlabel(r'$t \mathbin{/} \si{\micro\second}$')
plt.tight_layout(pad=0)

plt.savefig(args.output, dpi=300)
