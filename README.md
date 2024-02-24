# BC-Predict_Histological
Machine learning models for predicting the histological subtype of breast cancers

BC-Predict: Mining of signal biomarkers and multilevel validation of cascade classifier for early-stage breast cancer subtyping and prognosis

BC-Predict_Histological
The BC-Predict web-server is built on Rshiny and deployed for academic research at https://apalania.shinyapps.io/BC-Predict. All predictions are accompanied by prediction probabilities to provide confidence for the predicted class. BC-Predict is written in R and meant only for academic use. For any commercial use, please contact: Authors (Dr Ashok Palaniappan).

Confusion Matrix:
This is the performance of the ensemble model  for the external validation described in our manuscript. The inconclusive events from the two models XGBoost and neural network (1 layer) were omitted. 11 such instances were ignored in constructing the confusion matrix.


Confusion matrix
Ground Truth
D
L 
Predicted
D
91
6
L 
0
7


where Reference (ground truth) in columns & Predicted class in rows; D: Ductal, L: Lobular. This yields a balanced accuracy of ~ 0.76. 

Histology_subtype.R
> source Histology_subtype.R
Requests sample input from user, containing gene expression values of selected biomarkers (for a sample dataset, please see 'Datasets' below).
Loads the XGB.rds and model_neuralNet_1layer.rds model object and predicts the sample class (Ductal and lobular) along with the probability of the predicted class. The inconclusive events 

If the prediction class is not same from two model, then the predicted class is deemed 'Inconclusive'.
Provides a refined command-line interface for: BC-Predict webserver for histology subtype classification.
Models
We provide the RDS objects of the best-performing models from our work (refer the Citation). These could be used in an Ensemble Classifier model for academic purposes.

1. XGB.rds: The XGBoost model built on the full TCGA BRCA dataset that is at the heart of [BC-Predict](https://apalania.shinyapps.io/BC-Predict)
2. model_neuralNet_1layer.rds: One of the other best-performing models based on neural network(refer the Citation)

Test.csv: File format used as input to BC-Predict, both the web-server and command-line tool. Expression values of the biomarkers are provided one sample per line, in a comma-separated format, with a header line indicating the order of the biomarkers.

Citing us:
Muthamilselvan S, Palaniappan A. BC-Predict: Mining of signal biomarkers and multilevel validation of cascade classifier for early-stage breast cancer subtyping and prognosis (2024). Submitted

