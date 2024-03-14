# BC-Predict_Histological
[![DOI](https://zenodo.org/badge/762600906.svg)](https://zenodo.org/doi/10.5281/zenodo.10817854)
## Machine learning models for predicting the histological subtype of breast cancers
A resource to accompany:
Muthamilselvan S && Palaniappan A. [BC-Predict](https://apalania.shinyapps.io/BC-Predict): Mining of signal biomarkers and multilevel validation of cascade classifier for early-stage breast cancer subtyping and prognosis. 2024 (submitted) 

## [BC-Predict](https://apalania.shinyapps.io/BC-Predict)
[BC-Predict](https://apalania.shinyapps.io/BC-Predict) is the primary resource translating the results from the above cited study into a unified predictive model of multiple problems in breast cancer heterogeneity. It provides access to all the models developed in the study. All predictions are accompanied by prediction probabilities to provide confidence for the predicted class. BC-Predict is available for purely academic research.  For any use not indicated above, please contact: [Authors](mailto:apalania@scbt.sastra.edu).

[BC-Predict_Histological](https://github.com/apalania/BC-Predict_Histological) is a command-line interface to one of the models in the BC-Predict architecture, namely the Invasive Ductal v/s Invasive Lobular carcinoma. Since this problem was the least tractable of the different problems addressed, we are sharing the source code and the model objects developed, with a view to accelerating research in this area.  The standalone interface is a refinement over the webserver 

### Histological_subtype Model Performance
#### Confusion Matrix:
This is the performance of the ensemble model  for the external validation described in our manuscript. The inconclusive events from the two models XGBoost and neural network (1 layer) were omitted. 11 such instances were ignored in constructing the confusion matrix.

| *Ref/Pred* |D |L  |
|:---:|---|---|
| __D__ |91  |6  |
| __L__ | 0 |7 |

where Reference (ground truth) in columns & Predicted class in rows; D: Ductal, L: Lobular. This yields a balanced accuracy of ~ 0.76. 

EnsembleClassifier_HistologicalSubtype.R
-----------

    > source EnsembleClassifier_HistologicalSubtype.R
    
* Requests sample input from user, containing gene expression values of selected biomarkers (for a sample dataset, please see 'Datasets' below).
* Loads the model_XGB.rds and model_neuralNet_1layer.rds objects, and predicts the sample class (Ductal or Lobular) along with the probability of the predicted class. 
	- If the two models do not agree on the prediction class, then the prediction is deemed '_Inconclusive_'. 
* Provides a refined command-line interface for the Histological Subtype model in: [BC-Predict](https://apalania.shinyapps.io/BC-Predict) webserver.
	* suitable for further investigations and model improvement.
	* 
Models
-----
We provide the RDS objects of the best-performing Histological Subtyping models from our work (refer the Citation). These could be used in an Ensemble Classifier model for academic purposes (as implemented in [BC-Predict](https://apalania.shinyapps.io/BC-Predict) webserver). Both models were trained on the TCGA BRCA dataset. 

1. model_XGB.rds: Optimized XGBoost model.   
2. model_neuralNet_1layer.rds: Optimized 1-layer neural network model. 

### Sample Datasets

    
1. Test.csv: File format used as input to BC-Predict, both the web-server and command-line HistologicalSubtype. Expression values of the biomarkers are provided one sample per line, in a comma-separated format, with a header line indicating the order of the biomarkers.

## Citing us:
Muthamilselvan S, Palaniappan A. BC-Predict: Mining of signal biomarkers and multilevel validation of cascade classifier for early-stage breast cancer subtyping and prognosis (2024). Submitted 
## Machine learning models for predicting the histological subtype of breast cancers

## Copyright & License


Copyright (c) 2024, the Authors @ [SASTRA University](https://www.sastra.edu). GPL-3.0 License (only this repo). 
