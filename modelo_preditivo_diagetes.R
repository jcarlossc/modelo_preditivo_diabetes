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

