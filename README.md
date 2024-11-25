# OTDM
OTDM Project 2

- Implement the primal and dual quadratic formulation of the support vector machine in AMPL.
- Apply to a dataset obtained with the accompanying generator  (linux, windows and mac executables provided). Validate the SVM with data different from that of the training set.
- For a good mark, you should apply the SVM  to one more (real-world) dataset. You can use datasets from repositories.
- Compute the separation hyperplane from the dual model and check that it coincides with that of the primal model.
- The report must include all the previous elements (AMPL code, results obtained, analysis of results, etc).
- This assignment is to be done in groups of two and only two students.
(Note: If you are using Windows, check that your Windows installation has Microsoft Visual Studio runtime libraries, otherwise you may have problems running gensvmdat.exe. If you experience such a problems, I recommed you to generate the data file with the Linux version (gensvmdat) in a Linux box, and then to copy the resulting file to Windows)


-J implement dual and primal

- find dataset

- K create script /function that given (w* , gamma, test data set) -> hyperplane, predictions, accuracry/ f1