rm(list=ls()) # é uma boa pratica remover todos os dados carregados
library(Hmisc)

# troque a URL pela localização do csv no seu computador
dados <- read.csv("C:/Users/Michelli/Documents/Programação/Projetos/Pessoal/Covid-19 dadosset analysis/COVID19_line_list_dados.csv")
describe(dados) # resumo sobre o dataframe

# tratando os dados errados da coluna death_dummy que indica se a pessoa morreu != 0, ou não = 0
dados$death_dummy <- as.integer(dados$death != 0)
unique(dados$death_dummy)
# média de pessoas no df que morreram = 5,8%
sum(dados$death_dummy) / nrow(dados)

# Como a idade afeta a probabilidade de uma pessoa morrer de covid
alive = subset(dados, death_dummy == 0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)
t.test(alive$age, dead$age, alternative="two.sided", conf.level = 0.99)
# com um p-value < 0.05, nos rejeitamos a hipotese nula
# e concluimos que a idade é um valor significativo

# Como o genero afeta a probabilidade da algem morrer de covid
men = subset(dados, gender == "male")
women = subset(dados, gender == "female")
mean(men$death_dummy, na.rm = TRUE) #8.5%!
mean(women$death_dummy, na.rm = TRUE) #3.7%
# mas sera que esses são estatisticamente relevantes?
t.test(men$death_dummy, women$death_dummy, alternative="two.sided", conf.level = 0.99)
# podemos afirmar com 99% de precisão que homens tem de 0,8% a 8,8% a mais de chance de morrer 






