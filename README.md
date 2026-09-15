# 📈 Gene Expression Time-Series Analysis

> **Track, analyze, and visualize longitudinal gene expression dynamics in lung cancer samples across 20 distinct time points.**

---

## ⚡ Key Capabilities
* **Targeted Cohort Filtering**: Filters multi-sample expression data specifically for cancer-phenotype samples from public GEO datasets[cite: 5, 7].
* **Longitudinal Tracking**: Tracks temporal expression trajectories for target genes (`HOPX`, `SPARCL1`, `TFF1`, `APOB`)[cite: 5, 7].
* **Dynamic Visualization**: Generates continuous, transparent overlapping area plots using `ggplot2` to compare expression shifts across time points.
* **Publication-Ready**: Outputs clean, custom-styled vector graphics (`TimeSeries_Area_Graphs.pdf`)[cite: 5, 7].

---

## 📂 Project Structure

| File | Description |
| :--- | :--- |
| **`area_graph_analysis.R`** | Core R script for filtering, data reshaping, and plotting[cite: 5, 7]. |
| **`gene_expressions.csv`**[cite: 7] | Input expression matrix (genes $\times$ sample accessions)[cite: 5, 7]. |
| **`metadata.csv`**[cite: 7] | Sample metadata detailing accessions, phenotypes, and time points[cite: 5, 7]. |
| **`Genes.txt`**[cite: 7] | Target gene list (`HOPX`, `SPARCL1`, `TFF1`, `APOB`)[cite: 5, 7]. |
| **`TimeSeries_Area_Graphs.pdf`**[cite: 7] | Vector publication plot showing gene expression trends[cite: 5, 6, 7]. |

---

## 🚀 Quick Start

### 1. Requirements
Ensure the required R libraries are installed:
```R
install.packages(c("ggplot2", "reshape2", "dplyr"))
2. Execution
Place your input files (gene_expressions.csv, metadata.csv, and Genes.txt) in the working directory[cite: 5] and run:
Bash
Rscript area_graph_analysis.R
