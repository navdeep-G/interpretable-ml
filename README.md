# Interpretable Machine Learning

##### **A collection of code, notebooks, and resources for training interpretable machine learning (ML) models, explaining ML models, and debugging ML models for accuracy, discrimination, and security.**

##### **Want to contribute your own examples/code/resources?** Just make a pull request.

## Setup
```
cd interpretable-ml
virtualenv -p python3.6 env
source env/bin/activate
pip install -r python/jupyter-notebooks/requirements.txt

** Note: if using Ubuntu, you may have to manually install gcc. Try the following 
1. sudo apt-get update
2. sudo apt-get install gcc
3. sudo apt-get install --reinstall build-essential
```
## Contents 
* [**Overview of interpretable machine learning techniques (not a complete list ...)**](https://github.com/navdeep-G/interpretable-ml/tree/master/interpretable_ml.pdf)
	* **Python**
		* **Jupyter Notebooks** 
			* *Financial Services*
  				* [UCI creditcard dataset (Binary Classification)](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/credit/binomial)
  				* [UCI creditcard dataset (Multinomial Classification)](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/credit/multinomial)
			* *Simulated Data*
  				* [Binary Classfication](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/simulated/binomial)
  				* [Multinomial Classification](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/simulated/multinomial)

## Further reading:
* [*Awesome Machine Learning Interpretability*](https://github.com/jphall663/awesome-machine-learning-interpretability)
* [*A Responsible Machine Learning Workflow with Focus on Interpretable Models, Post-hoc Explanation, and Discrimination Testing*](https://www.mdpi.com/2078-2489/11/3/137)
* [*An Introduction to Machine Learning Interpretability, 2nd Edition*](https://www.h2o.ai/wp-content/uploads/2019/08/An-Introduction-to-Machine-Learning-Interpretability-Second-Edition.pdf)
* [*On the Art and Science of Explainable Machine Learning*](https://arxiv.org/pdf/1810.02909.pdf)
* [*Proposals for model vulnerability and security*](https://www.oreilly.com/ideas/proposals-for-model-vulnerability-and-security)
* [*Proposed Guidelines for the Responsible Use of Explainable Machine Learning*](https://arxiv.org/pdf/1906.03533.pdf)
* [*Real-World Strategies for Model Debugging*](https://medium.com/@jphall_22520/strategies-for-model-debugging-aa822f1097ce)
* [*Warning Signs: Security and Privacy in an Age of Machine Learning*](https://fpf.org/wp-content/uploads/2019/09/FPF_WarningSigns_Report.pdf)
* [*Why you should care about debugging machine learning models*](https://www.oreilly.com/radar/why-you-should-care-about-debugging-machine-learning-models/)
