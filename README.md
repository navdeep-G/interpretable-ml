# Interpretable Machine Learning

##### **A collection of code, notebooks, and resources in relation to interpretable machine learning.**

##### **Want to contribute your own examples/code?** Just make a pull request.

### Setup
```
cd interpretable-ml
virtualenv -p python3.6 env
source env/bin/activate
pip install -r notebooks/requirements.txt

** Note: if using Ubuntu, you may have to manually install gcc. Try the following 
1. sudo apt-get update
2. sudo apt-get install gcc
3. sudo apt-get install --reinstall build-essential
```
### Contents 
* An overview of interpretable ML techniques can be found [here](https://github.com/navdeep-G/interpretable-ml/tree/master/interpretable_ml.pdf)
* Use Cases:
	* Financial Services:
  		* [Binomial (UCI creditcard dataset) ](https://github.com/navdeep-G/interpretable-ml/tree/master/jupyter-notebooks/credit/binomial)
  		* [Multinomial (UCI creditcard dataset)](https://github.com/navdeep-G/interpretable-ml/tree/master/jupyter-notebooks/credit/multinomial)
  	* Simulated Data:
  		* [Multinomial](https://github.com/navdeep-G/interpretable-ml/tree/master/jupyter-notebooks/simulated/multinomial)
