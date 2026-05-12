<h2 align="center">PFDial: A Structured Dialogue Instruction Fine-tuning Method Based on UML Flowcharts</h2>

<p align="center">
  <a href="https://arxiv.org/abs/2503.06706"><img src="https://img.shields.io/badge/Paper-Arxiv-blue.svg?style=for-the-badge" alt="Paper"></a>
  <a href="https://aclanthology.org/2025.findings-acl.134/"><img src="https://img.shields.io/badge/Venue-ACL%202025%20Findings-orange.svg?style=for-the-badge" alt="ACL 2025"></a>
  <a href="https://huggingface.co/datasets/konglongge/PFDial"><img src="https://img.shields.io/badge/Dataset-HuggingFace-yellow.svg?style=for-the-badge" alt="Dataset"></a>
  <a href="https://github.com/KongLongGeFDU/PFDial/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache_2.0-green.svg?style=for-the-badge" alt="License"></a>
</p>

> **Note:** For the Chinese version of this README, please refer to [README_zh.md](README_zh.md).

## 🔔 News

- 🏆 **[2025-05]** Our paper has been accepted at **ACL 2025 Findings**.
- 🤗 **[2025-03]** Dataset released on [Hugging Face](https://huggingface.co/datasets/konglongge/PFDial).
- 🎉 **[2025-03]** Our paper is released on arXiv: [arXiv:2503.06706](https://arxiv.org/abs/2503.06706).

## 📚 Overview

**PFDial** (Process Flow Dialogue) addresses a core challenge for process-driven dialogue systems used in customer service and equipment maintenance: even strong LLMs frequently fail when asked to follow strictly predefined process constraints.

We construct a dataset of **12,705** high-quality Chinese dialogue instructions, derived from **440** UML flowcharts containing **5,055** process nodes. Based on the **PlantUML** specification, each UML flowchart is decomposed into atomic dialogue units — structured **five-tuples** — which are then transformed into instruction-tuning data.

<p align="center">
  <i>Each UML flowchart → five-tuple atomic dialogue units → instruction-tuning data</i>
</p>

### ✨ Highlights

- 🧩 **12,705** high-quality Chinese dialogue samples derived from **440** UML flowcharts
- 📈 A **7B** model trained with only **800 samples**, or a **0.5B** model trained on the full data, both surpass **90% accuracy**
- 🥇 An **8B** model outperforms **GPT-4o** by up to **43.88%** (avg. **+11.00%**) on challenging tasks
- 🔄 In-depth analysis of **backward transitions**, **decision branching**, and the impact of different **dataset formats**

## 📂 Project Structure

```
PFDial/
├── PFDial-Raw_Data/         # 🔹 Raw data (structured as five-tuples with IDs)
├── PFDial-H-Raw_Data/       # 🔸 Hard-bench raw data
├── PFDial-SFT_Data/         # ✅ Supervised fine-tuning data
└── SFT_Script/              # 🛠️ Reference training scripts (OpenRLHF)
```

## 📊 Dataset Statistics

<div align="center">

| 📌 **Statistics**     | **Train** | **ID Test** | **OOD Test** |
| --------------------- | --------: | ----------: | -----------: |
| 🧩 Flowcharts         |       440 |          80 |           80 |
| 🔄 State Nodes        |     5,055 |         902 |        1,262 |
| 🔁 Sequential Samples |     9,029 |       1,628 |        2,265 |
| 🔀 Decision Samples   |     3,676 |         645 |          698 |
| 💬 Dialogue Samples   |    12,705 |       2,273 |        2,963 |
| 📏 Avg. Length        |    277.16 |      270.57 |       326.10 |

*Table: Key statistics of the PFDial dataset.*

</div>

## 🛠️ Usage Guide

### 1. Prepare Data

- All raw data are provided in `PFDial-Raw_Data/` as five-tuples with IDs.
- The hard benchmark for stress-testing models is in `PFDial-H-Raw_Data/`.
- Ready-to-use supervised fine-tuning data is in `PFDial-SFT_Data/`.

You can also load the SFT split directly from Hugging Face:

```python
from datasets import load_dataset

dataset = load_dataset("konglongge/PFDial")
```

### 2. Supervised Fine-tuning

We provide reference training scripts based on [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF):

```bash
bash SFT_Script/sft.sh
```

Adjust model path, data path, and hyper-parameters in the script before running.

### 3. Evaluation

Evaluate models on the **ID** and **OOD** test sets to reproduce the numbers reported in the paper. We recommend reporting **dialogue-level accuracy** along with separate accuracies on **sequential** and **decision** branches.

## 📊 Key Findings

| Setting | Result |
|---------|--------|
| 7B model + 800 SFT samples | > 90% dialogue accuracy |
| 0.5B model + full SFT data | > 90% dialogue accuracy |
| 8B model vs. GPT-4o (hard) | up to **+43.88%** absolute improvement |
| Backward transitions | Largest remaining gap — see paper for analysis |

For more experimental details and ablations, please refer to our [paper](https://aclanthology.org/2025.findings-acl.134/).

## 📝 Citation

If you find this project useful in your research, please cite us:

```bibtex
@inproceedings{zhang-etal-2025-pfdial,
    title     = "{PFD}ial: A Structured Dialogue Instruction Fine-tuning Method Based on {UML} Flowcharts",
    author    = "Zhang, Ming and Wang, Yuhui and Shen, Yujiong and Yang, Tingyi and
                 Jiang, Changhao and Wu, Yilong and Dou, Shihan and Chen, Qinhao and
                 Xi, Zhiheng and Zhang, Zhihao and Dong, Yi and Wang, Zhen and
                 Fei, Zhihui and Wan, Mingyang and Liang, Tao and Ma, Guojun and
                 Zhang, Qi and Gui, Tao and Huang, Xuanjing",
    editor    = "Che, Wanxiang and Nabende, Joyce and Shutova, Ekaterina and
                 Pilehvar, Mohammad Taher",
    booktitle = "Findings of the Association for Computational Linguistics: ACL 2025",
    month     = jul,
    year      = "2025",
    address   = "Vienna, Austria",
    publisher = "Association for Computational Linguistics",
    url       = "https://aclanthology.org/2025.findings-acl.134/",
    doi       = "10.18653/v1/2025.findings-acl.134",
    pages     = "2626--2649",
    ISBN      = "979-8-89176-256-5"
}
```

## 🔗 Related Projects

| Project | Description | Link |
|---------|-------------|------|
| **TransferTOD** (EMNLP 2024) | Generalizable Chinese multi-domain TOD with transfer capabilities | [GitHub](https://github.com/KongLongGeFDU/TransferTOD) |
| **LLMEval-Med** (EMNLP 2025) | Real-world clinical benchmark for medical LLMs | [GitHub](https://github.com/llmeval/LLMEval-Med) |
| **LLMEval-Fair** (ACL 2026) | Robust & fair evaluation, 200K+ questions | [GitHub](https://github.com/llmeval/LLMEval-Fair) |

## 📞 Contact Us

For questions or collaboration, please:

- Open an [Issue](https://github.com/KongLongGeFDU/PFDial/issues) on GitHub
- Contact the project maintainers:
  - **Ming Zhang**: mingzhang23@m.fudan.edu.cn
  - **Yuhui Wang**: yuhuiwang22@m.fudan.edu.cn

---

<p align="center">
  <b>PFDial</b> | Fudan NLP Lab
</p>
