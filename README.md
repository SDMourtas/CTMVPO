# Continuous-Time Mean-Variance Portfolio Optimization
The Markowitz mean-variance portfolio optimization is widely acclaimed as a very important investment strategy. This repository contains three continuous-time versions of the mean-variance portfolio optimization (MVPO) problem. The first two MVPO problems are defined as time-varying quadratic programming (TVQP) problems, while the third MVPO problem is defined as a time-varying nonlinear programming (TVNLP) problem.
The purpose of this package is to solve online the continuous-time versions of the MVPO problem by using a continuous-time neural network (NN) solver. This solver is the zeroing NN (ZNN).
The main article used is the following:
*	S.D.Mourtas, C.Kasimis, "Exploiting Mean-Variance Portfolio Optimization Problems through Zeroing Neural Networks", (submitted)

# M-files Description
*	Main_CTMVPO.m: the main function and parameters declaration
*	MVPO_EX.m: problem setup
*	CTMVPO1.m: main procedure for the two TVQP MVPO problems
*	CTMVPO2.m: main procedure for the TVNLP MVPO problem
*	dataprep.m: expected return and covariance construction
*	problem.m: complementary function for the problem setup
*	problem2.m: complementary function for the problem setup
*	inputs.m: complementary function for the problem setup
*	linots.m: function for vectors' linear interpolation
*	linotss.m: function for matrices' linear interpolation
* pchinots.m: time-series piecewise cubic Hermite interpolation of vectors-matrices
* pchinotss.m: time-series piecewise cubic Hermite interpolation of structures
* sp.m: the piecewise polynomial of the cubic spline interpolant of vectors-matrices
* splinots.m: time-series cubic spline interpolation of vectors-matrices
* sps.m: the piecewise polynomial of the cubic spline interpolant of structures
* splinotss.m: time-series cubic spline interpolation of structures
* oomega.m: parameter for spliting the observations to the time periods
*	ZNN1.m: the ZNN solver for the two TVQP MVPO problems
*	ZNN2.m: the ZNN solver for the TVNLP MVPO problem
*	nonlcon.m: the function that includes the nonlinear constraint

# Installation
*	Unzip the file you just downloaded and copy the CTMVPO directory to a location,e.g.,/my-directory/
*	Run Matlab/Octave, Go to /my-directory/CTMVPO/ at the command prompt
*	run 'Main_CTMVPO' (Matlab/Octave)

# Results
After running the Main_CTMVPO.m file, the package outputs are the following:
*	The optimal portfolio of the selected CTMVPO problem created by ZNN.
*	The time consumptions of ZNN, quadprog and fmincon.
*	The graphic illustration of the portfolio weights along with the optimal portfolios expected return, variance and the error between the ZNN, quadprog and fmincon.

# Environment
The CTMVPO package has been tested in Matlab 2021a on OS: Windows 10 64-bit.
