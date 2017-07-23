---
title: PyTorch
author: Roger Luo
...

# Some Question

- What is tensor?
- What is comput graph?
- What is dynamic comput graph?
- Why there is Operators and Variables?

---

[rogerluo.me/slide](rogerluo.me/slide)

---

Why PyTorch?

Faster/Easier

---

# Some history

---

PyTorch, previously is a chainer-like deep learning framework for lua in pure C.

- fastest
- self-implemeted tensor backend

---

# Pure C Backend

---

# The Torch Tensor Backend

---

Named `TH`, which offers

- A Storage structure
- A Tensor View of the storage

---

# A Overview of TH Macro

Generic Types generator

```bash
THGenerateXXXTypes.h
```


---

# A Overview of THNN

---

forward and backward methods

---

# Chain them together (autograd)

---

## Why `Variable`

To model grad and value memory allocation

---

## Store each OP

---

## A Python template parser for C

---