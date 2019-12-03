## ------------------------------------------------------------------------
library("tidyverse")
library("dplyr")
library("ggplot2")

averages <- read_csv("https://raw.githubusercontent.com/introdsci/DataScience-aswingler1/master/averages.csv")
vote_predictions <- read_csv("https://raw.githubusercontent.com/introdsci/DataScience-aswingler1/master/vote_predictions.csv")



## ------------------------------------------------------------------------
colnames(averages)[colnames(averages) == "votes"] <- "num_votes"

averages$party <- substr(averages$party, 0, 1)


## ------------------------------------------------------------------------
politician <- tibble(last_name=averages$last_name, congress=averages$congress, chamber=averages$chamber, num_votes=averages$num_votes, state=averages$state, district=averages$district, party=averages$party)

politician <- add_column(politician, generation=3)



bill <-tibble(bill_id=vote_predictions$bill_id, roll_id=vote_predictions$roll_id, congress=vote_predictions$congress, chamber=vote_predictions$chamber, voted_at=vote_predictions$voted_at)




## ------------------------------------------------------------------------
averages$state <- as.factor(averages$state)
levels(averages$state)

#averages$agree_pct <- as.factor(averages$agree_pct)

avg_pct_vote_by_state <- ggplot(averages, aes(state, agree_pct)) + geom_bar(stat="identity", width=.25, color="purple") +  theme(axis.text.x = element_text(angle = 45)) + ggtitle("state vs. agree percentage") + ylab("agree percentage")
avg_pct_vote_by_state


## ------------------------------------------------------------------------

agree_vs_predicted_agree <- ggplot(averages, aes(predicted_agree, agree_pct)) + geom_point(size=2, shape=19, col = ifelse(politician$party == "R", 'red', 'blue')) + ylab("agree percentage") + xlab("predicted agree") + ggtitle("agree percentage vs. predicted agree for all congresspeople")
  

agree_vs_predicted_agree


