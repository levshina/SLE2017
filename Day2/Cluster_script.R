rom_cognates <- c("faire", "fazer", "hacer", "face", "fare")
causatives_rom <- t(causatives[, c("FRA", "ITA", "SPA", "POR", "ROM")])
causatives_rom[causatives_rom %in% rom_cognates] <- "Yes"
causatives_rom[causatives_rom != "Yes"] <- "No"
causatives_rom <- as.data.frame(causatives_rom)

library(cluster)
rom.dist <- daisy(causatives_rom)
rom.dist

plot(hclust(rom.dist)) #complete
plot(hclust(rom.dist, method = "single")) 
plot(hclust(rom.dist, method = "average"))
plot(hclust(rom.dist, method = "ward.D2"))
