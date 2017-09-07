#install packages: igraph, networkD3

library(igraph)

#Colexification of foot: weighted graphs
#Format: adjacency matrix
foot_am 
foot_graph <- graph_from_adjacency_matrix(foot_am, mode = "undirected", weighted = TRUE)
V(foot_graph)#get the vertices (nodes)
E(foot_graph)#get the edges
E(foot_graph)$weight #get the weights (frequencies)

plot(foot_graph)
plot(foot_graph, edge.width = E(foot_graph)$weight^0.7, edge.color = "lightgreen", vertex.label.cex = 1, vertex.size = 5, vertex.label.color = "black", vertex.label.family = "sans", vertex.color = "red", vertex.label.dist = 1.5)

#interactive D3 graphs
library(networkD3)
foot_D3 <- igraph_to_networkD3(foot_graph)
summary(foot_D3)
foot_D3$nodes
foot_D3$links
forceNetwork(Links = foot_D3$links, Nodes = foot_D3$nodes, NodeID = 'name', Group = 'name', opacity = 0.8, Value = "value", linkDistance = 100, fontSize = 20)

#alternative format: Pairs of Nodes and their weights in a data frame
foot_df
foot_graph1 <- graph_from_data_frame(foot_df, directed = FALSE)
plot(foot_graph1)

#Appendix
#Undirected graph: Datives from Haspelmath 2003
dat_graph <- make_graph(~ purpose - direction - recipient - beneficiary -  judicantis, experiencer - recipient - predicative_possessor - external_possessor - beneficiary)
plot(dat_graph)
plot(dat_graph)
plot(dat_graph, layout = layout_with_kk) #Kamada-Kawai layout

#from graph to adjacency matrix
dat_adj <- as_adj(dat_graph)
#from adjacency matrix to graph
dat_graph_new <- graph_from_adjacency_matrix(dat_adj, mode = "undirected")
plot(dat_graph_new)

#interactive editing (need tclkt package)
tkplot(dat_graph)
xy <- tk_coords(4)
plot(dat_graph, layout = xy)
plot(dat_graph, layout = xy, vertex.size = 0) #no vertex symbols

#Bybee et al. 1994: grammaticalization of tense and aspect expressions
ta_graph <- make_directed_graph(c("AUX_Part", "Resultative", "Resultative", "Anterior", "Anterior",  "Perfective_or_Past", "Finish", "Completive", "Completive",  "Anterior", "Movement_from", "Anterior"))
plot(ta_graph)
#interactive editing
tkplot(ta_graph)
tk_coords(2) #or another id of the device
xy <- tk_coords(2)
plot(ta_graph, layout = xy)
plot(ta_graph, layout = xy, vertex.size = 5, vertex.label.dist = -1.5, edge.arrow.size= 1.2, vertex.color = "red")
