[![DOI](https://zenodo.org/badge/762600906.svg)](https://zenodo.org/doi/10.5281/zenodo.10817854)
![](https://img.shields.io/badge/licence-GPL--3.0-green)
# BC-Predict_Histological
## Machine learning models for predicting the histological subtype of breast cancers
A resource to accompany:

`
Muthamilselvan S, Vaithilingam N and Palaniappan A (2025) BC-Predict: mining of signal biomarkers and production of models for early-stage breast cancer subtyping and prognosis. Front. Bioinform. 5:1644695. doi: 10.3389/fbinf.2025.1644695
`
## [BC-Predict](https://apalania.shinyapps.io/BC-Predict)
[BC-Predict](https://apalania.shinyapps.io/BC-Predict) is the primary resource translating the results from the above cited study into a unified predictive model of multiple problems in breast cancer heterogeneity. It provides access to all the models developed in the study. All predictions are accompanied by prediction probabilities to provide confidence for the predicted class. BC-Predict is available for purely academic research.  For any use not indicated above, please contact: [Authors](mailto:apalania@scbt.sastra.edu).

[BC-Predict_Histological](https://github.com/apalania/BC-Predict_Histological) is a command-line interface to one of the models in the BC-Predict architecture, namely the Invasive Ductal v/s Invasive Lobular carcinoma. Since this problem was the least tractable of the different problems addressed, we are sharing the source code and the model objects developed, with a view to foster research in this area.   

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
	  
Models
-----
We provide the RDS objects of the best-performing Histological Subtyping models from our work (refer the Citation). These could be used in an Ensemble Classifier model for academic purposes (as implemented in [BC-Predict](https://apalania.shinyapps.io/BC-Predict) webserver). Both models were trained on the TCGA BRCA dataset. 

1. model_XGB.rds: Optimized XGBoost model.   
2. model_neuralNet_1layer.rds: Optimized 1-layer neural network model. 

### Sample Datasets

    
1. Test.csv: File format used as input to BC-Predict, both the web-server and command-line HistologicalSubtype. Expression values of the biomarkers are provided one sample per line, in a comma-separated format, with a header line indicating the order of the biomarkers.

## Please cite:
Muthamilselvan S, Vaithilingam N and Palaniappan A (2025) BC-predict: mining of signal biomarkers and production of models for early-stage breast cancer subtyping and prognosis. Front. Bioinform. 5:1644695. [doi: 10.3389/fbinf.2025.1644695](https://www.frontiersin.org/journals/bioinformatics/articles/10.3389/fbinf.2025.1644695/) [![DOI](https://zenodo.org/badge/762600906.svg)](https://zenodo.org/doi/10.5281/zenodo.10817854)
## Funding
1. DST-SERB EMR/2017/00040
2. Computing in our lab is also supported by a generous grant from Google TRC (TPU Research Cloud).
## Copyright & License
Copyright (c) 2024, the Authors @ [SASTRA University](https://www.sastra.edu). Repository licensed under GPL-3.0.  
