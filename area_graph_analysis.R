# Gene Expression Time-Series Area Graph
# Tracks expression of HOPX, SPARCL1, TFF1, and APOB across 20 time
# points in lung cancer samples (GEO dataset).
#
# Expected input files (place in the same directory as this script):
#   - gene_expressions.csv  (genes as rows, samples as columns)
#   - metadata.csv          (Accession, Phenotype, TimePoint)
#   - Genes.txt             (one gene symbol per line — genes to plot)

# Load necessary libraries
library(ggplot2)
library(reshape2)
library(dplyr)

# Read gene expression data
expr_data <- read.csv("gene_expressions.csv", header = TRUE, row.names = 1)

# Read metadata file
meta_data <- read.csv("metadata.csv", header = TRUE)

# Read the gene list
gene_list <- read.table("Genes.txt", header = FALSE, stringsAsFactors = FALSE)$V1

# Ensure metadata column names are correct
colnames(meta_data) <- c("Accession", "Phenotype", "TimePoint")  # Assuming TimePoint column exists

# Filter for Cancer samples only
meta_data <- meta_data[meta_data$Phenotype == "Cancer", ]

# Transpose expression data (Samples as rows, Genes as columns)
expr_data_t <- as.data.frame(t(expr_data))
expr_data_t$Accession <- rownames(expr_data_t)

# Merge with metadata (keeping only Cancer samples)
merged_data <- merge(meta_data, expr_data_t, by = "Accession")

# Keep only selected genes
filtered_data <- merged_data[, c("Accession", "TimePoint", gene_list)]

# Convert to long format for ggplot
expr_long <- melt(filtered_data, id.vars = c("Accession", "TimePoint"), 
                  variable.name = "Gene", value.name = "Expression")

# Convert TimePoint to numeric for proper ordering
expr_long$TimePoint <- as.numeric(expr_long$TimePoint)

# Find the minimum expression value from the dataset
min_expression <- min(expr_long$Expression)

# Plotting Area Graph 
pdf(file = "TimeSeries_Area_Graphs.pdf", width = 12, height = 8)
ggplot(expr_long, aes(x = TimePoint, y = Expression, fill = Gene, group = Gene)) +
  geom_area(position = "identity", alpha = 0.5) +  # Transparent overlapping areas
  scale_fill_manual(values = c("HOPX" = "red", "SPARCL1" = "blue", "TFF1" = "green", "APOB" = "purple")) +  # Assign colors
  theme_minimal(base_size = 14) +
  labs(title = "Gene Expression Trends Over 20 Time Points in Lung Cancer",
       x = "Time Points",
       y = "Expression Level") +
  coord_cartesian(ylim = c(4.6, max(expr_long$Expression))) +  # Set Y-axis to start from the lower value
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1),
        legend.position = "top",
        legend.title = element_text(size = 13),  # Make legend title bold
        legend.text = element_text(size = 12),  # Make legend text bold
        panel.grid.major = element_line(color = "gray80"),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 1))
dev.off()

