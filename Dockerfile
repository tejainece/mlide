FROM ubuntu

# Install python3
RUN apt-get update
RUN apt-get install -y python3 python3-pip

# Install ncurses dependency
RUN apt-get install -y libncurses5-dev

# Install scipy, statsmodel, pandas and jupyter
RUN pip3 install numpy scipy matplotlib sympy pandas scikit-learn patsy statsmodels seaborn nltk readline jupyter
RUN pip3 install --user ipython[notebook]

# Change to 'ml' user
RUN adduser --disabled-password --gecos ""  ml
RUN usermod -a -G sudo ml
RUN su - ml

WORKDIR /home/ml/ml

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]
