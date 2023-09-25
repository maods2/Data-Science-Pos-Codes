library(readxl)
library(data.table)

# Lendo uma por??o reduzida dos dados
df <- read_excel("~/Data-Science-Pos-Codes/01-EstatisticaR/datasets/banco_estadual_COVID19_15_07_2020_reduzido.xlsx")
head(df)

# Lendo uma aba espec?fica
obitos <- read_excel("~/Data-Science-Pos-Codes/01-EstatisticaR/datasets/banco_estadual_COVID19_15_07_2020_reduzido.xlsx",sheet='obitos')
head(obitos)


#Entendendo o conjunto de dados
df <- as.data.table(df)
head(df)
View(df[1:100,])
str(df)
dim(df)

# Distribui??es de Frequ?ncias
# Vari?vel qualitativa
library(knitr)
freq = table(df$`CLASSIFICACAO FINAL`)

prop = round(prop.table(table(df$`CLASSIFICACAO FINAL`))*100,2)

kable(cbind(freq,prop),col.names = c("Freq","Prop"))

# Distribui??o de frequ?ncia para Vari?vel quantitativa
table(df$`IDADE EM ANOS`)
setnames(df,"IDADE EM ANOS","idade_em_anos")

# Transformando a vari?vel em num?rica
df[,idade_em_anos := as.numeric(idade_em_anos)]

# Criando nova vari?vel com grupos de valores
df[idade_em_anos %between% c(0,18), idade_grupos := "0 - 18"]
df[idade_em_anos %between% c(19,24), idade_grupos := "19 - 24"]
df[idade_em_anos %between% c(25,34), idade_grupos := "25 - 34"]
df[idade_em_anos %between% c(35,44), idade_grupos := "35 - 44"]
df[idade_em_anos %between% c(45,54), idade_grupos := "45 - 54"]
df[idade_em_anos >= 55, idade_grupos := "55 +"]

#Construindo tabela de frequ?ncia
freq = table(df$idade_grupos)
prop = round(prop.table(table(df$idade_grupos))*100,2)
kable(cbind(freq,prop),col.names = c("Freq","Prop"))

#######################
# Desafio de estudo ###
#######################

#Entenda a fun??o de agrupamento

agrupar <- function(x, grupos = NULL, sep = "-", text = ""){
  # Input: Vetor com valores num?ricos.
  # Output: Fator com nomes dos grupos da vari?vel num?rica.
  if(length(grupos) < 2) {
    stop("N?mero de grupos deve ser maior que 2.")		
  }
  x <- as.numeric(x)
  brackets <- paste(grupos, grupos[2:length(grupos)]-1, sep = sep)
  brackets[length(grupos)] <- paste0(grupos[length(grupos)], " +")
  x <- factor(findInterval(x, grupos), levels = c(1:length(brackets)))
  levels(x) <- paste0(brackets, text)
  x
}

df$idade_grupos <- agrupar(df$idade_em_anos, grupos = c( 18, 25, 35, 45, 55))
table(df$idade_grupos)


# Gr?ficos para Vari?veis Qualitativas

#Gr?fico em barras
setnames(df,'CLASSIFICACAO FINAL','classificacao_final')
barplot(table(df$classificacao_final))

# Gr?fico de barras mais elegante com ggplot2
library(ggplot2)

# Base do gr?fico, painel vazio
ggplot(data = df)

# Precisamos definir quais vari?veis ser?o mapeadas nos aspectos visuais do gr?fico
ggplot(data = df,aes(x=classificacao_final))

# Adicionando camadas ao gr?fico

ggplot(df, aes(x=classificacao_final)) + 
  geom_bar() 

# Melhorando a apar?ncia
ggplot(df, aes(x=classificacao_final)) + 
  geom_bar() + 
  labs(x="Classifica??o Final", y="Frequ?ncia", title="COVID-19") +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.3))

# Transformando a vari?vel em fator e renomando os n?veis do fator
table(df$classificacao_final)                                  
levels(df$classificacao_final)
names(table(df$classificacao_final))                                  

df$classificacao_final <- factor(df$classificacao_final)
levels(df$classificacao_final) <- c("Confirmado","Confirmado","Confirmado","Confirmado","Descartado","Descartado","Suspeito")

table(df$classificacao_final)                                  
str(df$classificacao_final)
levels(df$classificacao_final)

# Construindo o gr?fico de barras com a nova vari?vel classificacao_final
ggplot(df, aes(x=classificacao_final)) + 
  geom_bar() + 
  labs(x="Classifica??o Final", y="Frequ?ncia", title="COVID-2019")


# Gr?fico em setores

# Preparando o conjunto de dados
freq = table(df$classificacao_final)
prop = round(prop.table(table(df$classificacao_final))*100,2)
df_pie = data.table(cbind(freq,prop))
df_pie[,classificacao_final := levels(df$classificacao_final)]  

# Construindo o gr?fico
ggplot(df_pie, aes(x='',y=prop,fill = classificacao_final)) + 
  geom_bar(width = 1, stat = "identity") + 
  coord_polar("y", start=0)


# Gr?ficos para vari?veis quantitativas

# Histograma
ggplot(df[!is.na(idade_em_anos)], aes(x=idade_em_anos)) + 
  geom_histogram(bins=20) + 
  labs(x="Idade", y="Frequ?ncia", title="COVID-19")


# Diagrama de dispers?o
plot(df$idade_em_anos)


# Medidas Resumo
# Moda

z <- table(df$idade_em_anos) 
moda = names(z)[z == max(z)]
moda

# Mediana
x <- c(3, 4, 7, 8 , 8)
median(x)

# Media
x<- c(3, 4, 7, 8, 8)	
mean(x)

#############
## Desafio ##
#############

#Qual a idade mediana dos individuos testados para o covid-19?
#E qual a idade m?dia?
#Quais as idades m?dia e mediana entre os testados positivos e negativos para o covid-19?
  

# Medidas de dispers?o

# Desvio padr?o
grupoA <- c(3,4,5,6,7)
sd(grupoA)
var(grupoA)


#############
## Desafio ##
#############

# Crie uma fun??o que calcula o desvio padr?o. N?o vale utilizar a fun??o pronta do R sd.
# Confirme se a fun??o sd calcula o desvio padr?o considerando n ou n-1


#Quantis Emp?ricos
grupoA <- c(3,4,5,6,7)
mean(grupoA)
sd(grupoA)
var(grupoA)
median(grupoA)

newgrupoA <- c(3,4,5,6,7,100)
mean(newgrupoA)
sd(newgrupoA)
var(newgrupoA)
median(newgrupoA)

summary(newgrupoA)
summary(grupoA)

# Boxplot
ggplot(df[!is.na(idade_em_anos)], aes(y=idade_em_anos)) + 
  geom_boxplot() + 
  labs(x="", y="Idade", title="COVID-19")
















######## Gabarito ########

mean(df[`RESULTADO DO TESTE` %in% 'POSITIVO']$idade_em_anos,na.rm=T)
mean(df[`RESULTADO DO TESTE` %in% 'NEGATIVO']$idade_em_anos,na.rm=T)
median(df[`RESULTADO DO TESTE` %in% 'NEGATIVO']$idade_em_anos,na.rm=T)
median(df[`RESULTADO DO TESTE` %in% 'POSITIVO']$idade_em_anos,na.rm=T)

df[!is.na(idade_em_anos),
   list(mean=mean(idade_em_anos),
        median = median(idade_em_anos),
        sd=sd(idade_em_anos),
        max = max(idade_em_anos),
        min = min(idade_em_anos)),
   by=`RESULTADO DO TESTE`]
