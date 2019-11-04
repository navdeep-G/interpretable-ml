# Interpretable Machine Learning

##### **A collection of code, notebooks, and resources in relation to interpretable machine learning.**

##### **Want to contribute your own examples/code/resources?** Just make a pull request.

## Setup
```
cd interpretable-ml
virtualenv -p python3.6 env
source env/bin/activate
pip install -r jupyter-notebooks/requirements.txt

** Note: if using Ubuntu, you may have to manually install gcc. Try the following 
1. sudo apt-get update
2. sudo apt-get install gcc
3. sudo apt-get install --reinstall build-essential
```
## Contents 
* [**Overview of interpretable machine learning techniques (not a complete list ...)**](https://github.com/navdeep-G/interpretable-ml/tree/master/interpretable_ml.pdf)
* **Interpretable Machine Learning Use Cases**
	* **Python**
		* **Jupyter Notebooks** 
			* *Financial Services*
  				* [UCI creditcard dataset (Binary Classification)](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/credit/binomial)
  				* [UCI creditcard dataset (Multinomial Classification)](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/credit/multinomial)
			* *Simulated Data*
  				* [Binary Classfication](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/simulated/binomial)
  				* [Multinomial Classification](https://github.com/navdeep-G/interpretable-ml/tree/master/python/jupyter-notebooks/simulated/multinomial)
