---
title: Person re-identification
...

#

Person re-identification (re-id) is essentially  the task of recognizing if a person has been observed in  different locations over a set of non-overlapping cameras views. It's an important task for surveillance applications, either for on-line tracking of an individual over a network of cameras, or for off-line retrieval of all videos containing a person of interest.

# Related works

# [2016,CVPR] Top-push Video-based Person Re-identification

#

$$
f(D) = (1-\alpha) \sum_{x_i,x_j,y_i=y_j} D(\vec{x_i},\vec{x_j}) +\\ \alpha \sum_{x_i,x_j,y_i=y_j} \max{D(\vec{x_i},\vec{x_j})-\min_{y_k\neq y_i}D(\vec{x_i},\vec{x_k})+\rho,0}
$$

#

![](../img/ml-1.png)

#
![](../img/ml-2.png)

# Results

![](../img/ml-3.png)

# Deep Metric Learning for Person Re-Identification

---

### Advantages

> - DML can learn a similarity metric from image pixels
directly. All layers in DML are optimized by the same
objective function, which are more effective than the
hand-crafted features in traditional methods.
> - The multi-channel filters learned in DML can capture
the   color   and   texture   information   simultaneously,
which  are  more  reasonable  than  the  simple  fusion
strategies in traditional methods,e.g.,feature concate-nation and sum rule.
> - The  structure  of  DML  is  flexible  that  can  easily
switch between view specific and general person re-
identification tasks by whether sharing the parameters
of sub-networks.

#

![](../img/ml-struct.png)


# CNN

# A brief intro of CNN
In machine learning, a convolutional neural network (CNN, or ConvNet) is a type of feed-forward artificial neural network in which the connectivity pattern between its neurons is inspired by the organization of the animal visual cortex, whose individual neurons are arranged in such a way that they respond to overlapping regions tiling the visual field.

#

![](../img/Conv_layers.png)

# Use CNNs in Video Classification

The CNNs have been established as a powerful class of models for image recognition as a powerful class of models for image-recognition problems. But when we add a time-domain data in the training set like videos. The precision become much lower than images.

# Large-Scale Video Classification by CNNs

This is a CVPR2014 paper by Google and Stanford.

In this paper, researchers explored a pretty large data-set (1 million videos) in four different architectures. And the best architecture improved the precision from
