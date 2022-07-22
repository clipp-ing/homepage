# Some of my personal projects.
A collection of personal projects I've worked on. 

1. JPX - Stock Prediction 
<br>
The dataset consists of information (such as open price, close price, etc.) of 2000 stocks on labelled dates. The objective is to predict a target for each stock
on a specific date. I used a model I wanted to test using an embedding layer and an RNN (GRU). Since there are not many dates in the dataset and a lot of features it was not feasible to feed each date into the model and try to predict 2000 targets. Insead the idea was to randomly sample a group of stocks, feed stock codes into an embedding layer and then run features through an RNN. The samples were essentially random partitions of the stocks and an epoch was considered as a pass through each partition. Once the next epoch began, the partitions would be different.
<br>
