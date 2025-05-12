# 📦 EDArumour

A small R package providing exploratory data analysis tools for social media rumors. It includes functions to analyze text characteristics such as word count, sentence length, and question mark usage.

---

## 📁 Functions

### `runEDA()`

Extracts useful features from text messages for rumor classification.

**Inputs:**
- `data`: A data frame with at least two columns:
  - `text`: The message content
  - `is_rumor`: A binary indicator (0 = not a rumor, 1 = rumor)

**Output:**
- An object of class `"eda_result"` that contains a summary data frame (`$data`) with:
  - `text_length`
  - `word_count`
  - `question_mark`
  - `label` (factorized from `is_rumor`)

---

### `plot.eda_result()`

S3 method to plot EDA summaries. Produces two boxplots:
- Message length by label
- Word count by label

Usage:
```r
eda <- runEDA(pheme)
plot(eda)
