# A Robust Super-Resolution Classifier by Nonlinear Optics
This repository contains the code and data used in the 2024 paper "A Robust Super-Resolution Classifier by Nonlinear Optics" by Ishan Darji, Santosh Kumar, and Yuping Huang.
This paper was published to the journal Optics Letters in October of 2024, which can be found at: [https://opg.optica.org/ol/abstract.cfm?URI=ol-48-16-4320](https://opg.optica.org/ol/fulltext.cfm?uri=ol-49-19-5419&id=559944). 

Abstract:

"Spatial-mode projective measurements could achieve super-resolution in remote sensing and imaging, yet their performance is usually sensitive to the parameters of the target scenes. 
We propose and demonstrate a robust classifier of close-by light sources using optimized mode projection via nonlinear optics. 
Contrary to linear-optics based methods using the first few Hermite–Gaussian (HG) modes for the projection, here the projection modes are optimally tailored by shaping the pump wave to drive the nonlinear-optical process. 
This minimizes modulation losses and allows high flexibility in designing those modes for robust and efficient measurements. 
We test this classifier by discriminating one light source and two sources separated well within the Rayleigh limit without prior knowledge of the exact centroid or brightness. 
Our results show a classification fidelity of over 80% even when the centroid is misaligned by half the source separation, or when one source is four times stronger than the other."

The data consists of effects of two different parameters for this method, which are separated into their respective folders.
Each study was repeated 10 times and their data is stored in '.mat' format.
The data analysis code is another matlab file named 'analysis.m'.
Each major figure for the results is also stored for easy reference.
