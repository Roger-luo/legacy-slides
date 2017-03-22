---
title: Neural Network Quantum State
subtitle: A machine learning approach
...


# Current Status

---


- [x] C++ implementation with **precise** gradient and energy, and openMP shared memory parallelization
- [x] Julia implementation with **precise** gradient and energy
- [ ] C++/Julia implementation with **sampling** gradient and energy, and openMP shared memory parallelization:
    - sampling is wrong?
    - needs more sampling?
- [ ] Implementation of Appendix C, the mimer-pls inverse algorithm


---

**Optimization algorithms has implemented**:

- Simulated Annealing (C++/MATLAB)
- Particle Swarma Optimization with Simulated Annealing (C++)
- Stochastic Reconfiguration (Julia/C++)
- Gradient Descent with autodiff (Python, tensorflow)
- Adam (Python, tensorflow)
- Adapt Gradient Descent (Python, tensorflow)


---

Conclusion:

Stochastic Reconfiguration (Julia/C++) is the best!

---

**TODO**

- debug for sampling
- implementation for better pinv() algorithm
- c implementation (faster and easier for cuda programming and FLI than c++)
- distributed computing via MPI (accelerate sampling)

---

