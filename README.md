# RGSS

By [Abolfazl Hashemi](https://www.linkedin.com/in/abolfazlh/), [Mahsa Ghasemi](https://www.linkedin.com/in/mahsa-ghasemi-247a3186), [Haris Vikalo](http://users.ece.utexas.edu/~hvikalo/), and [Ufuk Topcu](https://www.ae.utexas.edu/facultysites/topcu/wiki/index.php/Main_Page).

### Table of Contents
0. [Introduction](#introduction)
0. [Citation](#citation)
0. [MATLAB implementation](#matlab-implementation)

### Introduction

In this repository, we release the MATLAB implementaation of our proposed randomized greedy algorithm for large-scale sensor scheduling. In our work, we also show that the mean square error (MSE) objective of the linear estimator of states in a linear dynamical system is weak submodular under mild conditions.   

### Citation

If you use RGSS in your research, please cite:

@article{hashemi2016sparse,
  title={Sparse recovery via Orthogonal Least-Squares under presence of Noise},
  author={Hashemi, Abolfazl and Vikalo, Haris},
  journal={arXiv preprint arXiv:1608.02554},
  year={2016}
}
        
### MATLAB implementation

The MATLAB function ```sensor_selection.m``` is the implementation of both greedy and proposed randomized greedy schemes for sensor selection. The file ```sdp_relax.m``` is the implementation of the proposed SDP method.
