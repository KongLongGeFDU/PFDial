
#  PFDial

**The Official Code Repository for the Paper**
📄 *"PFDial: A Structured Dialogue Instruction Fine-tuning Method Based on UML Flowcharts"*

---

🔗 **[📚 Paper on arXiv](https://arxiv.org/abs/2503.06706v1)**
🔗 **[🤗 HuggingFace Dataset](https://huggingface.co/datasets/qzdc/PFDial)**
🏅 *Accepted at Findings of ACL 2025*

---

## 🚀 Highlights

* 🧩 **12,705** high-quality Chinese dialogue samples derived from **440** UML flowcharts.
* 📈 Models trained with only **800 samples (7B)** or **full dataset (0.5B)** achieved **>90% accuracy**.
* 🥇 An **8B model** outperforms **GPT-4o** by up to **43.88%** on challenging tasks.
* 🔍 In-depth analysis on **backward transitions**, **branching**, and **format effectiveness**.

---

## 📂 Project Structure

```
PFDial/
├── PFDial-Raw_Data/         # 🔹 Raw data (structured as quintuples)
├── PFDial-H-Raw_Data/       # 🔸 Raw data for Hard-bench set
├── PFDial-SFT_Data/         # ✅ Supervised fine-tuning data
├── Training Scripts         # 🛠️ Reference scripts using OpenRLHF
```

---

## 📖 Guide

* All raw data are provided in the `/PFDial-Raw_Data` folder as quintuples with IDs.
* The `/PFDial-H-Raw_Data` folder contains data for the **hard benchmark**.
* We provide supervised fine-tuning data and reference scripts for training under `/PFDial-SFT_Data`.

---

## 📊 Dataset Statistics

<div align="center">

| 📌 **Statistics**     | **Train** | **ID Test** | **OOD Test** |
| --------------------- | --------: | ----------: | -----------: |
| 🧩 Flowcharts         |       440 |          80 |           80 |
| 🔄 State Nodes        |      5055 |         902 |         1262 |
| 🔁 Sequential Samples |      9029 |        1628 |         2265 |
| 🔀 Decision Samples   |      3676 |         645 |          698 |
| 💬 Dialogue Samples   |     12705 |        2273 |         2963 |
| 📏 Avg. Length        |    277.16 |      270.57 |       326.10 |

*Table: Key statistics of the PFDial dataset*
</div>


---

## 📌 Citation

If you find this project useful in your research, please consider citing us:

```
@inproceedings{zhang-etal-2025-pfdial,
    title = "{PFD}ial: A Structured Dialogue Instruction Fine-tuning Method Based on {UML} Flowcharts",
    author = "Zhang, Ming and Wang, Yuhui and Shen, Yujiong and Yang, Tingyi and Jiang, Changhao and Wu, Yilong and Dou, Shihan and Chen, Qinhao and Xi, Zhiheng and Zhang, Zhihao and Dong, Yi and Wang, Zhen and Fei, Zhihui and Wan, Mingyang and Liang, Tao and Ma, Guojun and Zhang, Qi and Gui, Tao and Huang, Xuanjing",
    editor = "Che, Wanxiang and Nabende, Joyce and Shutova, Ekaterina and Pilehvar, Mohammad Taher",
    booktitle = "Findings of the Association for Computational Linguistics: ACL 2025",
    month = jul,
    year = "2025",
    address = "Vienna, Austria",
    publisher = "Association for Computational Linguistics",
    url = "https://aclanthology.org/2025.findings-acl.134/",
    pages = "2626--2649",
    ISBN = "979-8-89176-256-5",
    abstract = "Process-driven dialogue systems, which operate under strict predefined process constraints, are essential in customer service and equipment maintenance scenarios. Although Large Language Models (LLMs) have shown remarkable progress in dialogue and reasoning, they still struggle to solve these strictly constrained dialogue tasks. To address this challenge, we construct \textbf{P}rocess \textbf{F}low \textbf{Dial}ogue (\textbf{PFDial}) dataset, which contains 12,705 high-quality Chinese dialogue instructions derived from 440 flowcharts containing 5,055 process nodes. Based on PlantUML specification, each UML flowchart is converted into atomic dialogue units i.e., structured five-tuples. Experimental results demonstrate that a 7B model trained with merely 800 samples, and a 0.5B model trained on total data both can surpass 90{\%} accuracy. Additionally, the 8B model can surpass GPT-4o up to 43.88{\%} with an average of 11.00{\%}. We further evaluate models' performance on challenging backward transitions in process flows and conduct an in-depth analysis of various dataset formats to reveal their impact on model performance in handling decision and sequential branches. The data is released in \url{https://github.com/KongLongGeFDU/PFDial}."
}
```

---

## 📬 Contact

For questions or collaboration, please open an [Issue](https://github.com/KongLongGeFDU/PFDial/issues) or reach out via the paper's author info.

