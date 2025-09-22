# 📌 Modelo Preditivo em R - Diagnóstico de Diabetes

Este projeto tem como objetivo **identificar pacientes com alta probabilidade de serem diagnosticados com diabetes**, utilizando diferentes algoritmos de Machine Learning.  
A meta é alcançar **pelo menos 75% de acurácia** no modelo final.

---

## 📌 Estrutura do Projeto

1. **Obtenção dos dados**  
   - Carregamento do dataset `diabetes.csv`.  
   - Análise inicial do formato e tipos de dados.  

2. **Preparação dos dados**  
   - Conversão da variável alvo `Outcome` para fator.  
   - Análise de valores ausentes.  
   - Detecção e tratamento de outliers (ex.: variável `Insulin`).  
   - Criação de histogramas e boxplots para análise da distribuição.  

3. **Análise Exploratória**  
   - Estatísticas descritivas.  
   - Visualização de distribuições por histograma.  
   - Boxplots comparativos.  

4. **Construção do Modelo**  
   Foram utilizados diferentes algoritmos:  
   - **KNN (k-Nearest Neighbors)**  
   - **Naive Bayes**  
   - **Decision Tree (rpart2)**  
   - **SVM (Support Vector Machine)**  

   O dataset foi dividido em:  
   - **70% treino**  
   - **30% teste**  

   Ferramentas utilizadas:  
   - `caTools` → divisão treino/teste.  
   - `caret` → treinamento e validação de modelos.  
   - `e1071`, `naivebayes`, `randomForest`, `kernlab` → implementação dos algoritmos.  

5. **Avaliação dos Modelos**  
   - Métricas de avaliação: **acurácia, matriz de confusão e importância das variáveis**.  
   - Seleção do melhor modelo com base na performance no conjunto de teste.  

6. **Predição em Novos Casos**  
   - Simulação da predição para um único paciente.  
   - Resultado classificado como **Positivo** ou **Negativo**.  

7. **Visualização dos Resultados**  
   - Geração de arquivo `resultado.csv` com as predições.  
   - Renomeação das colunas para melhor interpretação.  

---

## 📌 Pacotes Utilizados

- `dplyr` → Manipulação de dados  
- `caTools` → Divisão treino/teste  
- `caret` → Treinamento e avaliação de modelos  
- `e1071` → Algoritmos de ML  
- `naivebayes` → Algoritmo Naive Bayes  
- `randomForest` → Árvores de decisão  
- `kernlab` → Suporte para SVM  

---

## 📌 Pré-requisitos

Antes de rodar o projeto, você precisa ter:

- [R](https://cran.r-project.org/) instalado (versão recomendada: ≥ 4.3)  
- [RStudio](https://posit.co/download/rstudio-desktop/) instalado  
- Instalação da [Linguagem R](https://informaticus77-r.blogspot.com/2025/09/blog-post.html):
- Microtutorial [RStudio:](https://informaticus77-r.blogspot.com/2025/09/blog-post_8.html)

---

## 📌 Clonar este repositório
Abra o terminal e execute:
```bash
https://github.com/jcarlossc/modelo_preditivo_diabetes.git
cd modelo_preditivo_diabetes
```

---

## 📌 Ativar ambiente com renv
Este projeto utiliza o pacote renv para gerenciar dependências de forma reprodutível.
1. Abra o projeto no RStudio.
2. Ative o ambiente e restaure as dependências:
```
# Estes comandos devem ser executados no console do RStudio.
renv::activate()
renv::restore()
```
3. Verifique se tudo está funcionando:
```
# Este comando deve ser executado no console do RStudio.
renv::status()
```

---

## 📌 Sobre
Este material foi criado para servir como introdução ao R, com exemplos simples e organizados para facilitar o aprendizado inicial.

---

## 📌 Contribuições
Se quiser contribuir:
1. Faça um fork deste repositório
2. Crie uma branch para sua feature ou correção (git checkout -b minha-feature)
3. Faça commits descritos claramente
4. Submeta um Pull Request

---

## 📌 Licença
Este projeto está licenciado sob a MIT License.

---

## 📌 Contatos
📌Autor: Carlos da Costa<br>
📌Recife, PE - Brasil<br>
📌Telefone: +55 81 99712 9140<br>
📌Telegram: @jcarlossc<br>
📌Blogger linguagem R: [https://informaticus77-r.blogspot.com/](https://informaticus77-r.blogspot.com/)<br>
📌Blogger linguagem Python: [https://informaticus77-python.blogspot.com/](https://informaticus77-python.blogspot.com/)<br>
📌Email: jcarlossc1977@gmail.com<br>
📌Portfólio em construção: https://portfolio-carlos-costa.netlify.app/<br>
📌LinkedIn: https://www.linkedin.com/in/carlos-da-costa-669252149/<br>
📌GitHub: https://github.com/jcarlossc<br>
📌Kaggle: https://www.kaggle.com/jcarlossc/  
📌Twitter/X: https://x.com/jcarlossc1977
