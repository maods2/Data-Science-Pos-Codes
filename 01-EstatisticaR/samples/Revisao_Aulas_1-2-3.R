##################################################################################
#                                                                                #
#    DATA-SCIENCE-CIMATEC - ESTATISTICA APLICADA COM R - JULHO/2020              #
#    REVISÃO DAS AULAS 1,2 e 3                                                   #
#                                                                                #
##################################################################################

#=================================================================================
# Obter o diretório de trabalho
#=================================================================================
getwd()

#=================================================================================
# Definir o diretório de trabalho. A barra deve estar inverida
#=================================================================================
setwd('Z:/DATA-SCIENCE-CIMATEC/1.Estatística Aplicada com R/DataSet')


#=================================================================================
# Instalando e carregando pacotes
# Para instalar = install.packages('Nome_Pacote')
# Para carregar =library('Nome_Pacote')
# Para saber se o pacote está instalado find.package('ggplot2'). Extra aula:
#=================================================================================

#=================================================================================
# Funçoes de calculadora do R
#=================================================================================
10+2
10-2
10*2
10/2
10^2    # 10 Elevado a 2
10**2   # 10 Elevado a 2
9%%2    # Resto da divisao de 9 por 2 (modulo)
9%/%2   # Parte inteira da divisao de 9 por 2

#=================================================================================
# Operadores Logicos
#=================================================================================
10<2    # Retorna FALSE
10<=2   # Retorna FALSE
10>2    # Retorna TRUE
10==2   # Retorna FALSE. Sinal de igual: ==
10!=2   # Retorna TRUE. Sinal de negaçã: !

#=================================================================================
# IF, ELSE e ELSE IF (ELSE e ELSE IF são opcionais)
#
# Além de TRUE e FALSE, o R aceita 1 e 0, respectivamente
# Objetos character, NA, NaN e list não são interpretáveis como lógicos
#=================================================================================
condicao_1 = true
condicao_2 = F
condicao_3 = F

if(condicao_1){
  print('Condição 1 = VERDADEIRA')
  
} else if (condicao_2){
  print('Condição 2 = VERDADEIRA')
  
}  else if (condicao_3){
    print('Condição 3 = VERDADEIRA')
  
} else {
  
  print('Nenhuma condição é VERDADEIRA')
  
}

#=================================================================================
# FOR
# Repete a variável i de 1 a 10
# Paste-> Concatena caracter. No caso abaixo a variavel i é convertido para string
#=================================================================================
for (i in 1:10){
  print(paste0('i = ',i))
}

#=================================================================================
# PASTE. Concatena e converte numeros para string
#=================================================================================

paste(1,10,100,1000)  # Com espaço: "1 10 100 1000"
paste0(1,10,100,1000) # Sem espaço: "1101001000"

#=================================================================================
# IFELSE - Efetua teste e retorna valor de acordo com rssultado ifelse(test, yes, no)
# Sqrt - Calcula a raiz quadrada 
#=================================================================================

# Combine valores em uma lista ou vetor
x <- c(6:-4)  
x
sqrt(x)       
# Mostra erro porque tem valores negativos

sqrt(ifelse(x >= 0, x, NA))  
# Calcula a raiz quadrada somente dos valores positivos. Quando negativo mostra NA


#=================================================================================
# WHILE - Executa um loop até que a condição seja atendida
#=================================================================================

Y = 0
while(Y < 11){
    print(paste('Loop Até 10 = ',Y))
    Y=Y+1
    print(ifelse(Y > 9, F, T))
}

#=================================================================================
# Vetorização. Vetores sao objetos que guardam dados
#=================================================================================

numeros = 1:5  # Carrega um vetor de 1 a 5
numeros

log10(numeros) # Calcula o log de cada elemento do vetor

2^numeros      # Eleva o número 2 a cada elemento do vetor

#=================================================================================
# Reciclagem. Exemplo: Soma de vetores de tamanhos diferentes
#=================================================================================

x <- c(1,5)
y <- c(1,10,100,1000)
x + y # Resultado : 2   15  101 1005 (100 é somado com o 1 e 1000 com o 5)


x <- c(7,9)
y <- c(1,10,100,1000)
x + y # Resultado : 8   19  107 1009 (100 é somado com o 7 e 1000 com o 9)


#=================================================================================
# Funções. também são objetos. Podem ser passadas como argumentos de outras funções
# Basica        : Install.package(paocte), read.table(arquivo)
# Estatistica  : min(x), max(x)
# Matematica   : log(x), sqrt(x)
# Definida pelo usuário através do comand function
#=================================================================================

# Função para ecoar uma palavra. Tem 2 argumentos palavra e n_ecos(assume 3 se omitido).
ecoar <- function(palavra, n_ecos = 3) {
  paste(c(rep(palavra, n_ecos), "!"), collapse = " ")
}
ecoar("eco")
ecoar("eco",5)

# REP. Replica os elements do vetor ou lista.
n=3
palavra="Amor"
rep(palavra, n)

# C. Combine Values em vetor ou lista
paste0(c(1, 2, 3), c(4, 5, 6)) # "14" "25" "36"
paste0(c(1, 2, 3))             #  "1" "2" "3"

# COLLAPSE. Passa vetor e colar todos seus elementos com uma string
n=3
palavra="Amor"
paste(c(rep(palavra, n), "!"), collapse = " ") # "Amor Amor Amor !"
paste (rep(palavra, n), "!")                  # "Amor !" "Amor !" "Amor !"
paste(c(1, 2, 3, 4, 5, 6), collapse = '@')      # [1] "1@2@3@4@5@6"

#=================================================================================
# Estruturas de dados básicas: 
# Vetores - Fatores - Matrizes - Listas - DataFrames
#=================================================================================

#Vetores: homogêneo e unidimensional
x <- c(1, 2, 5, 7,10) ;x ;typeof(x)
x <- c(1, 2, 5, 7, 10.5) ;x ;typeof(x)
x <- c(T, F, TRUE, FALSE) ;x ;typeof(x)
x <- c("string 1", "string 2") ;x ;typeof(x)
x <- c("string 1", T) ;x ;typeof(x)

# Fatores: heterogêneo e unidimensional
# Podem ser vistos como vetores de inteiros que possuem rótulos (levels)

sexo <- c("M", "H", "H", "H", "M", "M", "H","NA","NA")
fator <- as.factor(sexo); 
fator             # [1] M  H  H  H  M  M  H  NA NA # Levels: H M NA
as.numeric(fator) # [1] 2 1 1 1 2 2 1 3 3

# A função levels() retorna os levels do fator. 
# Levels são organizados em ordem alfabética.
levels(fator) # [1] "H" "M" "NA"

c5 <- c("M", "F", "F", "F", "M", "M"); c5 ; typeof(c5)
f5 <- as.factor(c5); f5 ; typeof(f5)
f5 <- factor(c5, levels = c("M","F")); f5 ; typeof(f5)
f5[7] <- "M"
f5[7] <- "teste"

# A função factor cria um fator, a partir de um vetor :

# Cuidado ao converter factors em objetos numéricos
f <- factor(c("2", "3", "1", "10"))
as.numeric(f)
as.numeric(as.character(f)) # Só converte se for caracter


#Matrizes: homogêneo e bidimensional
matrix(1:12, ncol=4)
matrix(data=1:12,nrow=3,ncol=4)
# Extra Classe

# Nota. Quando 2 tipos são inseridos numa estrutura homogênea (vetores ou matrizes), o R Converterá 
# o objeto para o tipo mais flexível, na ordem 1.Logical, 2.Integer, 3.Double e 4.Character. 
# Na lista acima, character é o tipo mais flexível.

#Listas: heterogêneo
pessoa <- list(idade=21, nome='Fred', score=c(65,78,55,44,78))
pessoa
pessoa$idade    # 21
pessoa$nome     # Fred
pessoa$score    # 65 78 55 44 78

# Data frame: heterogêneo
# É uma tabela de uma base de dados, em que cada linha corresponde 
# a um registo (linha) da tabela

df <- data.frame(x = 1:4,y = c("um", "dois", "tres", "quatro"), z = T)
df1 <- data.frame(x = 3:4, y = c("s", "s"), z = T)
df2 <- data.frame(x = 1:2, y = c("n", "n"), z = F)

df1[2,c("x","y")]     # Exibe a linha 2 e as colunas x e y
df1[ ,c("x","y","z")] # Exibe todas as linhas e as colunas x,y e z
df2[ ,c("x")]         # Exibe todas as linhas e a colunas x

# É possível combinar data frames usando as funções rbind() e cbind()

# Para unir 2 através das linhas -> rbind().
rbind(df1, df2)
# x y     z
# 3 s  TRUE
# 4 s  TRUE
# 1 n FALSE
# 2 n FALSE

# Para unir 2 matrizes através das colunas -> função cbind().
cbind(df1, df2)
# x y    z x y     z
# 3 s TRUE 1 n FALSE
# 4 s TRUE 2 n FALSE

# Extra Classe =====================================================
Tabela <- data.frame(
  nome = c("João", "Pedro", "Amanda", "Fábio", "Fernanda", "Gustavo"),
  altura = c(1.80, 1.77, 1.71, 1.65, 1.66, 1.63),
  idade = c(22, 21, 18, 20, 23, 19),
  sexo = c("masculino", "masculino", "feminino", "masculino", "feminino", "masculino"),
  peso = c(78.3, 82.1, 66.5, 88.1, 58, 75.4),
  fumante = c(TRUE, FALSE, FALSE, FALSE, TRUE, FALSE),
  uf = c("PB", "AL", "PE", "PE", "SP", "CE"),
  renda = c(2, 5, 10, 20, 10, NA)
)

Tabela
# Resultado 
# nome		  altura	idade	sexo		  peso	fumante	uf	renda
# João		  1.80	  22	  masculino	78.3	sim	    PB	2
# Pedro		  1.77	  21	  masculino	82.1	não	    AL	5
# Amanda		1.71	  18	  feminino	66.5	sim	    PE	10
# Fábio		  1.65	  20	  masculino	88.1	não	    PE	20
# Fernanda	1.66	  23	  feminino	58.0	sim	    SP	10
# Gustavo		1.63	  19	  masculino	75.4	não	    CE	NA

Tabela[2 ,c("nome", "sexo")]  # Exibe o nome e o sexo da linha 2

#=================================================================================
# Subsetting.A seleção de um subconjunto de um objeto. 
# Existem 3 tipos principais de operação de subsetting:
#=================================================================================
x <- c(13, 8, 5, 3, 2, 1, 1) 
x[c(1,2,3,5)] # Retorna os valores das posiçoes 1,2,3 e 5 =  13  8  5  2
order(x)      # Retorna 6 7 5 4 3 2 1
x[order(x)]   # Retorna 1  1  2  3  5  8 13
x[-c(2, 5,6)] # Retorna 13  5  3  1

#=================================================================================
# Estruturas de dados no R: Lendo um data frame em formato excel 
# Utilizado o dataset "banco_estadual_COVID19_15_07_2020_reduzido.xlsx"
#=================================================================================

# Pacote readxl está instalado?. Se não tiver install.packages('readxl')
find.package('readxl')

# Pacote data.table está instalado? Se não tiver install.packages('data.table')
find.package('data.table')  

# Carreggue os pacotes
library(readxl)
library(data.table)

# Carrega "banco_estadual_COVID19_15_07_2020_reduzido.xls no data frame df_covid
df_covid <- read_excel("banco_estadual_COVID19_15_07_2020_reduzido.xlsx")

# Mostra estrutura (variaveis e seus tipos) do data frame.
str(df_covid) 

# Transforma o data frame numa tabela
dt_covid <- as.data.table(df_covid) 

# Mostra as primeiras 6 linhas
head(df_covid)           

# Escrevendo e Lendo em um arquivo csv
write.csv(head(df_covid), file = 'Covid.csv') 
read.csv('Covid.csv') 

# Exibe em modo grafico as 50 primeiras linhas
View(head(dt_covid,50)) 

# Dimensões e Comprimentos
dim(dt_covid)  # Mostra quantidade de objetos(linhas) e variáveis(colunas) 
nrow(dt_covid) # Mostra quantidade de linhas 
ncol(dt_covid) # Mostra quantidade de colunas
length(dt_covid) # Mostra quantidade de colunas

dim(c(1,2,3))
nrow(c(1,2,3))
ncol(c(1,2,3))
length(c(1,2,3))

#================================================================================
# Explorando o conjunto de dados
#================================================================================
names(dt_covid)           # Mostra o nome da todas as colunas 
tolower(names(dt_covid))  # Mostra o nome da todas as colunas em minusculas

# Altera nomes das colunas para os nomes abaixo.
colnames(dt_covid) <- c("data_notificacao","dor_garganta","dispneia","febre","tosse","outros",
                  "profissional_saude","descricao_sintoma","data_inicio_sintomas",
                  "doencas_respiratorias_cronicas_descompensadas","doencas_cardiacas_cronicas",
                  "diabetes","doencas_renais_cronicas","imunossupressao","gestante_alto_risco",
                  "doenca_cromossomica","classificacao_final","investigacao_concluida","estado_teste",
                  "cbo","data_coleta_teste","idade_anos","tipo_teste","resultado_teste","sexo",
                  "estado_residencia","municipio_residencia","raca","epidemia")

# setnames(dt_covid,"IDADE EM ANOS","idade_em_anos") - Alternativa 

# Configurando para formato de datas
# Deve ser feito em um data table. Para saber execute: is.data.table(dt_covid)
dt_covid[,data_notificacao := as.Date(data_notificacao,format = "%d/%m/%Y")]
dt_covid[,data_notificacao := as.Date(data_notificacao,format = "%d/%m/%Y")]
dt_covid[,data_inicio_sintomas := as.Date(data_inicio_sintomas,format = "%d/%m/%Y")]
dt_covid[,data_coleta_teste := as.Date(data_coleta_teste,format = "%d/%m/%Y")]

#Removendo colunas. Para remover a coluna data_notificacao   
# dt_covid[,data_notificacao := NULL] 

# Transformando variáveis em numéricas. 
# Deve ser feito em um data table. Para saber execute: is.data.table(dt_covid)
# 
dt_covid[,idade_anos := as.numeric(idade_anos)]

# Observação. Veja mudanças no data table no arquivo Mudancas_dt_covid.txt

# Sub conjunto de um dataset
df <- data.frame(x = 1:4,y = c("um", "dois", "tres", "quatro"), z = T)
df[,1:3]   # Mostra para todas as linhas as colunas 1,2 e 3
df[1:3,]   # Mostra para todas as colunas as linhas 1,2 e 3

dt_covid[,dispneia,febre]
dt_covid[,.(dispneia,"<->", febre)] # Mostra dispineia <-> febre

# Carrega o data table dt_covid em covid_ba com as informações somente da Bahia
covid_ba <- dt_covid[estado_residencia == 'BAHIA']


#================================================================================
# Lendo uma aba específica de uma planilha Excel
#================================================================================
covid_obitos <- read_excel("banco_estadual_COVID19_15_07_2020_reduzido.xlsx",sheet='obitos')


#================================================================================
# Distribuições de Frequências
# Para criar uma tabela de frequências use a função table()
# Round() é a função que arredonda um número.
# Table() sumaria uma variável categóriga
# Prop.table() cria uma tabela de proporção.
#================================================================================

# Variável qualitativa
library(knitr)
freq = table(dt_covid$`classificacao_final`)
View(freq)
prop = round(prop.table(table(dt_covid$`classificacao_fina`))*100,2)
View(prop)

# Mostra numa mesma tabela as frequencias freq e prop 
kable(cbind(freq,prop),col.names = c("Freq","Prop"))

# Distribuição de frequência para Variável quantitativa
table(dt_covid$`idade_em_anos`)

# Criando nova variável (idade_grupos) com grupos de valores
dt_covid[idade_anos %between% c(0,18), idade_grupos := "0 - 18"]
dt_covid[idade_anos %between% c(19,24), idade_grupos := "19 - 24"]
dt_covid[idade_anos %between% c(25,34), idade_grupos := "25 - 34"]
dt_covid[idade_anos %between% c(35,44), idade_grupos := "35 - 44"]
dt_covid[idade_anos %between% c(45,54), idade_grupos := "45 - 54"]
dt_covid[idade_anos >= 55, idade_grupos := "55 +"]

dt_covid[,idade_grupos]

# Construindo tabela de frequência com variável idade_grupos
freq = table(dt_covid$idade_grupos)
View(freq)
prop = round(prop.table(table(dt_covid$idade_grupos))*100,2)
View(prop)
kable(cbind(freq,prop),col.names = c("Freq","Prop"))


#================================================================================
# Gráficos para Variáveis Qualitativas
#================================================================================
# Deve ser instalado o pacote ggplot2. Os gráficos são construídos por camada, 
# A 1a é dada pela função ggplot.A 2a pela função geom_tipo, onde tipo do gráfico
# A função aes(),descreve como as variáveis serão mapeadas nos aspectos visuais 
# A função labs permite renomear eixos.Opções: title, subtitle,x,y,caption,tag,color 
# Para mudar aspectos visuais do gráfico, como fontes, cores e estilos dos textos, 
# grids, marcações, cor do fundo etc, utilize a função theme()
##================================================================================

# =================== Gráfico em Barras ==========================================
barplot(table(dt_covid$classificacao_final))

# Gráfico de barras mais elegante com ggplot2
library(ggplot2)

# Base do gráfico, painel vazio. 
ggplot(data = dt_covid)

# Define que variável será o X no aspecto visual do gráfico

ggplot(data = dt_covid,aes(x=classificacao_final))

# Adicionando camadas ao gráfico. Utilize o sinal +
ggplot(dt_covid, aes(x=classificacao_final)) +  geom_bar() 

# Melhorando a aparência
ggplot(dt_covid, aes(x=classificacao_final)) +  geom_bar() + 
  labs(x="Classificação Final", y="Frequência", title="COVID-19") +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=0.3))

# No gráfico acima, é mostrado muitos tipos de confirmado
# Transforma a variável classificacao_final em fator e renomeia os níveis do fator

names(table(df_covid$`classificacao_final`)) 
# "CONFIRMADO CLINICO-EPIDEMIOLOGICO" "CONFIRMADO LABORATORIALMENTE"     
# "CONFIRMADO SOROLOGIA"              "CONFIRMADO TESTE RAPIDO"          
# "DESCARTADO"                        "DESCARTADO LABORATORIALMENTE"     
# "SUSPEITO" 

# Transforma classificacao_final em um fator
dt_covid$classificacao_final <- factor(dt_covid$classificacao_final)

# altera o rotulo (levels) do fator classificacao_final
levels(dt_covid$classificacao_final) <- c("Confirmado","Confirmado","Confirmado",
                                          "Confirmado","Descartado","Descartado",
                                          "Suspeito")

names(table(dt_covid$`classificacao_final`)) 
# "Confirmado" "Descartado" "Suspeito"

table(dt_covid$classificacao_final)
# Confirmado Descartado   Suspeito 
# 1533       3385        919 

levels(dt_covid$classificacao_final)
#  "Confirmado" "Descartado" "Suspeito" 


#================================================================================
# Preparando o conjunto de dados
# Round() é a função que arredonda um número.
# Table() sumaria uma variável categóriga
# Prop.table() cria uma tabela de proporção.
#================================================================================

# =================== Gráfico em Setores ========================================

table(dt_covid$classificacao_final)
freq = table(dt_covid$classificacao_final)
prop = round(prop.table(table(dt_covid$classificacao_final))*100,2)
View(freq)
View(prop)

# Cria o data table df_pie juntando as colunas de freq e prop
df_pie = data.table(cbind(freq,prop))

# Carrega na variável classifica_final do fator df_pie os rotulos 
# (levels) do campo classificacao_final da data table dt_covid
df_pie[,classifica_final := levels(dt_covid$classificacao_final)]  

# Construindo o gráfico
ggplot(df_pie, aes(x='',y=prop,fill = classificacao_final)) + 
  geom_bar(width = 1, stat = "identity") + 
  coord_polar("y", start=0)


# DESAFIO 
# (PPT_2-SLIDE18): Para o dataset de óbitos, escolha uma variável quantitativa 
# e faça a  análise com as técnias aprendidas até o momento. 

# Criando variável para classificar faixas de idade, conforme criterios abaixo
# Jovens - Indivíduos de até 19 anos;
# Adultos - Indivíduos com idade entre 20 até 59 anos;
# Idosos - Indivíduos de 60 anos em diante.


# Transformando a variável em numérica
dt_covid[,idade_anos := as.numeric(idade_anos)]

# Criando a variável idade_grupos de acordo com faixa etaria.
dt_covid[idade_anos <= 19, idade_grupos := "Jovens"]
dt_covid[idade_anos %between% c(19,59), idade_grupos := "Adultos"]
dt_covid[idade_anos >= 60, idade_grupos := "Idosos"]

# Construindo tabela de frequência
freq = table(dt_covid$idade_grupos)
prop = round(prop.table(table(dt_covid$idade_grupos))*100,2)
kable(cbind(freq,prop),col.names = c("Freq","Prop %"))

#================================================================================
# Gráficos para variáveis quantitativas
#================================================================================

# =================== Histogramas ===============================================

# Plota o gráfico excluido os registros cuja idade_anos está em branco (!is.na)
ggplot(dt_covid[!is.na(idade_anos)], aes(x=idade_anos)) + geom_histogram(bins=20) + 
labs(x="Idade", y="Frequência", title="COVID-19")

# =================== Diagrama de dispersão ======================================
plot(dt_covid$idade_anos)



#================================================================================
# Medidas Resumo
#================================================================================

# ================================ Moda =========================================

# Carrega todos os valores de idade em uma tabela z
z <- table(dt_covid$idade_anos) 

# A função max mostra quantas vezes o número de maior ocorrencia se repetiu.
max(z) # Retorna 222

# A função names mostra as colunas da tabela z
names(z)

# Retorna TRUE para o número 38 da tabela. Para o restante retorna FALSE
z == max(z)

# Retorna a coluna onde o valor é TRUE
moda = names(z)[z == max(z)]

moda

# ================================ Mediana======================================
x <- c(3, 4, 7, 8 , 8)
median(x)

#Qual a idade mediana dos individuos testados para o covid-19?
median(dt_covid[!is.na(idade_anos)]$idade_anos)
median(covid_obitos$IDADE)


# ================================ Media =======================================
x<- c(3, 4, 7, 8, 8)	
mean(x)

#Qual a idade media dos individuos testados para o covid-19?
mean(dt_covid[!is.na(idade_anos)]$idade_anos)
mean(covid_obitos$IDADE)


# DESAFIO: 

# 1.Crie uma função que calcula a media.
x<- c(3, 4, 7, 8, 8)	
media <-function(x)
{
  media=sum(x)/length(x)
  media
}
media(x)

# 2.Quais idades média e mediana entre os testados positivos e negativos para ovid?


# PRIMEIRA FORMA --------------------------------
# Mediana
mean(dt_covid[`resultado_teste` %in% 'POSITIVO']$idade_anos,na.rm=T)
mean(dt_covid[`resultado_teste` %in% 'NEGATIVO']$idade_anos,na.rm=T)

# Mediana
median(dt_covid[`resultado_teste` == 'NEGATIVO']$idade_anos,na.rm=T)
median(dt_covid[`resultado_teste` == 'POSITIVO']$idade_anos,na.rm=T)

# Para remover as linhas com NA -> na.rm=T

# SEGUNDA FORMA ----------------------------------
dt_covid[!is.na(idade_anos),
   list(mean=mean(idade_anos),
        median = median(idade_anos),
        sd=sd(idade_anos),
        max = max(idade_anos),
        min = min(idade_anos)),
   by=`resultado_teste`]

#================================================================================
# Medidas de dispersão
#================================================================================

#================================== Variancia ===================================
# A variância mede o quanto os dados estão dispersos em torno da média. 
# Quanto maior a variacia maior é a dispersão dos dados
grupoA <- c(3,4,5,6,7)
var(grupoA)

# =============================== Desvio padrão =================================
# É uma medida que expressa o grau de dispersão de um conjunto de dado
# Quanto mais próximo de 0 for o desvio padrão, mais homogêneo são os dados.
grupoA <- c(3,4,5,6,7)
sd(grupoA)

grupoB <- c(5,5,5,5,5)
sd(grupoB)

sd(grupoA)^2 # A variância é igual ao desvio padrão elevado ao quadrado.


#================================== Quantis Empíricos============================
# q(0,25) = q1: 1° Quartil = 25° Percentil 	- 25% dos dados estão abaixo do q1
# q(0,50) = q2: 2° Quartil = 50° Percentil  - 50% dos dados estão abaixo do q2 
# q(0,75) = q3: 3° Quartil = 75° Percentil	- 75% dos dados estão abaixo do q3 
# q(0,40): 	    4° Decil				            - 40% dos dados estão abaixo do 4°Decil
# q(0,95): 	95° Percentil	 			            - 95% dos dados estão abaixo 
#
# Nota. A Mediana = q1
#

grupoA <- c(3,4,5,6,7)
mean(grupoA)    # 5
median(grupoA)  # 5
var(grupoA)     # 2.5
sd(grupoA)      # 1.581139

# Observe que a média = mediana.Significa que os dados estão simetricos.

newgrupoA <- c(3,4,5,6,7,100)
mean(newgrupoA)    # 20.83333
median(newgrupoA)  # 5.5
var(newgrupoA)     # 1506.167
sd(newgrupoA)      # 38.80936

# Observe como um dado extremo (100) no novo vetor impacta sobre a média, variancia
# e desvio padrão. Veja que a mediana foi pouco afetada. 

summary(newgrupoA)
summary(grupoA)


# Boxplot
# Os principais quantis empíricos (q1,q2 e q3) podem ser traduzidos pelo box plot


ggplot(dt_covid[!is.na(idade_anos)], aes(y=idade_anos)) + 
  # Plota o gráfico excluido os registros cuja idade_anos está em branco (!is.na)
  # A função aes(),descreve como as variáveis serão mapeadas nos aspectos visuais 
  geom_boxplot() + 
  labs(x="", y="Idade", title="COVID-19")

ggplot(covid_obitos, aes(y=IDADE)) + 
  geom_boxplot() + 
  labs(x="", y="Idade", title="COVID-19-OBITOS")

x=dt_covid$idade_anos
x <- as.numeric(x)
mean(x) 

# DESAFIO: 

# 1.Crie uma função que calcula o desvio padrão.  
#-----------------------------------------------------------
# A fórmula do desvio-padrão consite das seguintes etapas
#-------------------------------------------------------------
# Etapa 1: calcular a média.
# Etapa 2: calcular o quadrado da distância entre cada ponto e a média.
# Etapa 3: somar os valores da Etapa 2.
# Etapa 4: dividir pelo número de pontos.
# Etapa 5: calcular a raiz quadrada.


# Função Media. Será usado na função de desvio padrão
media <-function(x)
{
  media=sum(x)/length(x)
  media
}
x<- c(3, 4, 7, 8, 8)
media(x)
# Função Desvio Padrão 
desvio <- function(x)
{
  media=media(x)      # 1: calcular a média.
  a = (x-media)^2     # 2: calcular o quadrado da distância entre cada ponto e a média
  b = (length(x)-1)   # Calcula o número de pontos
  c = sum(a)          # 3: somar os valores da Etapa 2.
  d =  c/b            # 4: dividir pelo número de pontos.
  desvio=sqrt(d)      # 5: calcular a raiz quadrada.
  desvio
}
desvio(x)
sd(x)


#==============================================================================
# Salvando os dados no formato RDATA. # Quando for utilizar não é mais necessário 
# rodar todo o scrip, basta utilizar o comando load
# ==============================================================================
setwd('Z:/DATA-SCIENCE-CIMATEC/1.Estatística Aplicada com R/DataSet')
save(dt_covid,file = "dt_covid_Reduzido.RData")
save(df_covid,file = "df_covid_Reduzido.RData")
load("dt_covid_Reduzido.RData")


# DESAFIO:  

#1.Entenda a função de agrupamento

# Argumentos: Vetor com valores numéricos, o grupo de idades
# Saida : Fator com nomes dos grupos da variável numérica.

agrupar <- function(x, grupos = NULL, sep = "-", text = "")
{
  TamGrupo=length(grupos)
  # Calcula a quantidade de ementos do grupo e salva na variavel TamGrupo
  
  if(TamGrupo < 2) 
  {
    stop("Número de grupos deve ser pelo menos 2.")		
  }
  x <- as.numeric(x)
  # Converte x em numérico
  
  TamGrupo=length(grupos)
 
  
  brackets <- paste(grupos, grupos[2:TamGrupo]-1, sep = sep)
  # Carrega num vetor o grupo concatenado com o grupo a partir da posição 2 menos 1 separado por "-"
  # Retorna "18-24" "25-34" "35-44" "45-54" "55-24"
  
  brackets[TamGrupo] <- paste0(grupos[TamGrupo], " +")
  # Atribui ao quinto o seu valor original concatenado com a string " +"
  # Retorna  "18-24" "25-34" "35-44" "45-54" "55 +" 
  
  x <- factor(findInterval(x, grupos), levels = c(1:length(brackets)))
  levels(x) <- paste0(brackets, text)
  x
}

dt_covid$idade_grupos <- agrupar(dt_covid$idade_anos, grupos = c( 18, 25, 35, 45, 55))
table(dt_covid$idade_grupos)









