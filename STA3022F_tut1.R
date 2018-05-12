shareP <- read.csv("Tut1_shareprices.csv")

model <- lm(shareprice ~ sector + companysize + sector:companysize, data = shareP)

#This is weird
aov(model)

#This gives a much more generic or general SStable
anova(model)

#for ANCOVA purpose
model2 <- lm(shareprice ~ sector + turnover + leverage, data = shareP)

ancova1 <- aov(model2)
drop1(ancova1,~.,test = "F")

anova(model2)

"> drop1(ancova1,~.,test = F)
Single term deletions

Model:
  shareprice ~ sector + turnover + leverage
Df Sum of Sq    RSS    AIC F value    Pr(>F)    
<none>                280050 267.89                      
sector    2    368626 648676 287.41 15.1373 6.381e-05 ***
  turnover  1    103171 383221 274.68  8.4732   0.00787 ** 
  leverage  1        47 280097 265.90  0.0039   0.95096    
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

"
#Why are these different, the sumq numbers are not equal, why why

"> anova(model2)
Analysis of Variance Table

Response: shareprice
Df Sum Sq Mean Sq F value    Pr(>F)    
sector     2 652842  326421 26.8084 9.776e-07 ***
  turnover   1 204080  204080 16.7607 0.0004454 ***
  leverage   1     47      47  0.0039 0.9509615    
Residuals 23 280050   12176                      
---
  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1"