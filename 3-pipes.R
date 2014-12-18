# Basic pipe examples

# %>% pipes the output from one function to the first
# argument of the next
# Try pronouncing %>% "then"
# Help page: ?magrittr::`%>%`
# Notice how you can hold the Shift key down when you type it

# This works for any function for the first argument!
x <- rnorm(10)
max(x)
x %>% max

# Pipe the data to arrange by body mass
mammals %>% arrange(adult_body_mass_g)

# Find the species with the highest mass to length ratio:
mammals %>%
  mutate(mass_to_length =
    adult_body_mass_g / adult_head_body_len_mm) %>%
  arrange(desc(mass_to_length)) %>%
  select(species, mass_to_length)

# Which is simpler to read and write than:
select(
  arrange(
    mutate(mammals,
      mass_to_length =
        adult_body_mass_g / adult_head_body_len_mm),
    desc(mass_to_length)),
  mass_to_length)

# What taxonomic orders have a median litter size greater than 3?
mammals %>% group_by(order) %>%
  summarise(median_litter = median(litter_size, na.rm = TRUE)) %>%
  filter(median_litter > 3) %>%
  select(order, median_litter)

# Your turn...
