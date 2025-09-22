# MODELO PREDITIVO EM LINGUAGEM R.

# Identificar pacientes com alta probabilidade de serem 
# diagnosticados com diabetes, tendo, no mínimo, 75% de acurácia.

# OBTENÇÃO DOS DADOS.

diabetes <- read.csv("file/diabetes.csv")

# ?head()
head(diabetes)

# ---------------------------------------------------------------

# PREPARAÇÃO DOS DADOS.

# Verificando o tipo dos dados das colunas do dataset.
# ?str
str(diabetes)

# Verificando se existem valores ausentes.
# ?colSums()
colSums(is.na(diabetes))

# Verificando a proporção dos valores de cada categoria.
# ?table
table(diabetes$Outcome)

# Alterando o tipo da coluna "Outcome" que é int para factor.
diabetes$Outcome <- as.factor(diabetes$Outcome)

# Verificando valores min, max, média, mediana...
summary(diabetes$Insulin)

# Criando o gráfico de boxplot para cada coluna do dataset.
boxplot(diabetes)

# Criando o boxplot apenas da coluna "Insulin".
boxplot(diabetes$Insulin)

# Criando um histograma da coluna "Insulin"
hist(diabetes$Insulin)

# install.packages("dplyr")
library(dplyr)

# Filtrando o dataset por Insulin - Remoção de .
diabetes2 <- diabetes %>%
  filter(Insulin <= 250)

boxplot(diabetes2$Insulin)

# ---------------------------------------------------------------

# ANÁLISE EXPLORATORIA.

# Criação do boxplot para identificar outliers nas 
# colunas do dataset.
boxplot(diabetes2)

# Criação de histogramas para visualizar a distribuição dos dados.
hist(diabetes2$Pregnancies)
hist(diabetes2$Age)
hist(diabetes2$BMI)

# Visualizando os valores de min, max, média, mediana...
summary(diabetes2$Insulin)

# ---------------------------------------------------------------

# CONSTRUÇÃO DO MODELO. 

# O caTools é um pacote amplamente utilizado que fornece uma 
# coleção de ferramentas para análise de dados, incluindo funções 
# para dividir dados, executar médias móveis e realizar diversas 
# operações matemáticas e estatísticas.
# install.packages("caTools")

library(caTools)

# Um dos usos mais comuns do caTools é dividir dados em conjuntos 
# de treinamento e teste usando a função sample.split . 
# Isso garante que os dados sejam divididos aleatoriamente, 
# preservando a distribuição de classes. Podemos usar o código a 
# seguir para dividir o conjunto de dados iris em conjuntos de 
# treinamento (70%) e de teste (30%).

# A função set.seed() Garante que as operações aleatórias sejam reproduzíveis.
set.seed(123)

# O sample.split() Divide o conjunto de dados com base na Speciescoluna, 
# mantendo 70% dos dados no conjunto de treinamento.
index = sample.split(diabetes2$Pregnancies, SplitRatio = .70)

# Apresenta o resultado.
index

# Seleciona as linhas que são atribuídas ao conjunto de treinamento.
train = subset(diabetes2, index == TRUE)

# Seleciona as linhas que são atribuídas ao conjunto de teste.
test  = subset(diabetes2, index == FALSE)

# Mostra as dimensões (número de linhas e colunas) dos 
# conjuntos de treinamento e teste.
dim(diabetes2)
dim(train)
dim(test)

# O pacote caret permite que você teste diferentes modelos com 
# pouquíssimas alterações no seu código e inclui bootstrapping 
# de validação cruzada quase automático e ajuste de parâmetros 
# gratuitamente.
# install.packages("caret")

library(caret)

# O pacote e1071 fornece uma variedade de algoritmos de 
# aprendizado de máquina e métodos estatísticos.
# install.packages("e1071")

library(e1071)

# Treinando a primeira versão do modelo - KNN.
modelo <- train(
  Outcome ~., data = train, method = "knn")

# Visualizando os resultados do modelo
modelo$results
modelo$bestTune

#Treinando a segunda versão do modelo - testando o comportamento 
# do modelo com outros valores de k.
modelo2 <- train(
  Outcome ~., data = train, method = "knn",
  tuneGrid = expand.grid(k = c(1:20)))

# Visualizando os resultados do modelo.
modelo2$results

# Identificando o melhor valor de k.
modelo2$bestTune

# Visualizando a performance do modelo - gráfico de linhas
plot(modelo2)

# Treinando a terceira versão do modelo - Naive bayes
# install.packages("naivebayes").

library(naivebayes)

modelo3 <- train(
  Outcome ~., data = train, method = "naive_bayes")

# Visualizando os resultados do modelo.
modelo3$results
modelo3$bestTune

# Treinando a quarta versão do modelo - randomForest
# install.packages("randomForest")

library(randomForest)

modelon4 <- train(
  Outcome ~., data = train, method = "rpart2"
)
# Imprime resultados.
modelon4

# Verificando a importância das váriaveis para o 
# aprendizado do modelo.
varImp(modelon4$finalModel)
# As colunas "Insulin e Blood Pressure" não contribuem 
# muito para o aprendizado.

# Treinando o modelo sem as colunas "Insulin e 
#BloodPressure" - train[,c(-3,-5)] exclui as colunas.

modelon4_1 <- train(
  Outcome ~., data = train[,c(-3,-5)], method = "rpart2"
)
# Imprime o resultado.
modelon4_1

# Visualizando a arvore de decisão
plot(modelon4_1$finalModel)
text(modelon4_1$finalModel)

# O kernlab é um pacote de machine learning baseado em 
#kernels que fornece uma infraestrutura modular para 
#implementar e utilizar diversos algoritmos de aprendizagem.
# install.packages("kernlab")
library(kernlab)

set.seed(100)
modelo5 <- train(
  Outcome ~., data = train, method = "svmRadialSigma"
  ,preProcess=c("center")
)

modelo5$results
modelo5$bestTune

# Avaliando o modelo
# ?predict

# Testando o modelo com os dados de teste.
predicoes <- predict(modelo5,test)

# Visualizando o resultado das prediçoes do modelo.
predicoes

# Criando a matriz de confusão para Verificar os 
# resultados do modelo.
confusionMatrix(predicoes, test$Outcome)

# Realizando predições

# Criando um dataframe apenas com o registro de 
# um unico paciente para simular a utilização do modelo.
novos.dados <- data.frame

# Imprime o resultado.
novos.dados

#Utilizando o modelo para gerar a previsão - passando os 
# dados do paciente.
previsao <- predict(modelo5,novos.dados)

resultado <- ifelse(previsao == 1, "Positivo","Negativo")

# Verificando o resultado da predição do modelo.
print(paste("Resultado:",resultado))

# ---------------------------------------------------------------


