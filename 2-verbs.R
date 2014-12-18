# The 5 main verbs in the dplyr package

library(dplyr)

# select
select(mammals, adult_head_body_len_mm)
select(mammals, adult_head_body_len_mm, litter_size)
select(mammals, adult_head_body_len_mm:litter_size)
select(mammals, -adult_head_body_len_mm)
select(mammals, contains("age"))
select(mammals, starts_with("age"))
select(mammals, ends_with("d"))
select(mammals, 1:3)

# filter
filter(mammals, adult_body_mass_g > 1e7)
filter(mammals, species == "Balaena mysticetus")
filter(mammals, order == "Carnivora" & adult_body_mass_g < 200)

# arrange
arrange(mammals, adult_body_mass_g)
arrange(mammals, desc(adult_body_mass_g))
arrange(mammals, order, adult_body_mass_g)

# mutate
mutate(mammals, adult_body_mass_kg = adult_body_mass_g * 1000)

mutate(mammals,
  g_per_mm = adult_body_mass_g / adult_head_body_len_mm)

mutate(mammals,
  g_per_mm = adult_body_mass_g / adult_head_body_len_mm,
  kg_per_mm = g_per_mm / 1000)
 .Last.value %>% View()

# summarise
summarise(mammals, mean_mass = mean(adult_body_mass_g, na.rm = TRUE))

# summarise with group_by
summarise(group_by(mammals, order),
  mean_mass = mean(adult_body_mass_g, na.rm = TRUE))
