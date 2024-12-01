# OTDM - Constrained Optimization - SVM

This report focuses on implementing and analyzing the primal and dual quadratic formulations of the Support Vector Machine (SVM) using AMPL. The main objectives include applying the SVM to a dataset generated with the provided generator, validating the model on a separate external dataset, and analyzing its performance.

## Repository Structure

```
  .
  ├── data_formatter    # generation, formatting of the external dataset
  ├── data_generator    # generation, formatting of the data given in the assignment
  ├── dual              # model implementation and evaluation of dual SVM
  ├── primal            # model implementation and evaluation of primal SVM
  ├── report            # analysis
  │   ├── report.html   # reproducibility script for the analysis
  │   └── report.Rmd    # final report
  └── tutorial          # tutorial given by the assignment

```

## Getting Started

### Prerequisites
- AMPL is required to run the provided scripts and functions.

### Running the Project
1. Change paths for the primal and dual directories in the report.Rdm file to yours.
2. Change path to ampl file to yours with respect to your operating system.

Hint: replacement through `CMD + F` of:
- `/Users/danilakokin/Desktop/UPC/Semester3/OTDM/OTDM_Project_2`
- `/Users/danilakokin/Downloads/ampl_macos64/ampl`
will do all the work

## Authors
- Julian Fransen
- Danila Kokin
