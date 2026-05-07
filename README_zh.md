<h2 align="center">PFDial：基于 UML 流程图的结构化对话指令微调方法</h2>

<p align="center">
  <a href="https://arxiv.org/abs/2503.06706"><img src="https://img.shields.io/badge/论文-Arxiv-blue.svg?style=for-the-badge" alt="论文"></a>
  <a href="https://aclanthology.org/2025.findings-acl.134/"><img src="https://img.shields.io/badge/会议-ACL%202025%20Findings-orange.svg?style=for-the-badge" alt="ACL 2025"></a>
  <a href="https://huggingface.co/datasets/qzdc/PFDial"><img src="https://img.shields.io/badge/数据集-HuggingFace-yellow.svg?style=for-the-badge" alt="数据集"></a>
  <a href="https://github.com/KongLongGeFDU/PFDial/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache_2.0-green.svg?style=for-the-badge" alt="License"></a>
</p>

> **注意：** 英文版 README 请参阅 [README.md](README.md)。

## 🔔 最新消息

- 🏆 **[2025-05]** 论文被 **ACL 2025 Findings** 录用。
- 🤗 **[2025-03]** 数据集发布于 [Hugging Face](https://huggingface.co/datasets/qzdc/PFDial)。
- 🎉 **[2025-03]** 论文发布于 arXiv：[arXiv:2503.06706](https://arxiv.org/abs/2503.06706)。

## 📚 项目简介

**PFDial**（Process Flow Dialogue，流程化对话）针对客服、设备维护等流程驱动型对话系统中的核心问题：即使是强大的大语言模型，在严格遵循预定义流程约束的对话任务上也常常出错。

我们基于 **440** 张 UML 流程图（共 **5,055** 个流程节点）构建了 **12,705** 条高质量中文对话指令数据。借助 **PlantUML** 规范，每张 UML 流程图被分解为原子级对话单元（结构化的**五元组**），随后转换为指令微调数据。

<p align="center">
  <i>UML 流程图 → 五元组原子对话单元 → 指令微调数据</i>
</p>

### ✨ 核心亮点

- 🧩 **12,705** 条高质量中文对话样本，源自 **440** 张 UML 流程图
- 📈 仅用 **800 条样本**微调的 **7B** 模型，或在全量数据上微调的 **0.5B** 模型，均可达到 **>90% 准确率**
- 🥇 **8B** 模型在困难任务上比 **GPT-4o** 高出最多 **43.88%**（平均 **+11.00%**）
- 🔄 深入分析了**反向跳转**、**决策分支**和不同**数据格式**的影响

## 📂 项目结构

```
PFDial/
├── PFDial-Raw_Data/         # 🔹 原始数据（带 ID 的五元组）
├── PFDial-H-Raw_Data/       # 🔸 困难基准（Hard-bench）原始数据
├── PFDial-SFT_Data/         # ✅ 监督微调数据
└── SFT_Scrpit/              # 🛠️ 训练脚本（基于 OpenRLHF）
```

## 📊 数据统计

<div align="center">

| 📌 **统计项**         | **训练集** | **ID 测试集** | **OOD 测试集** |
| --------------------- | ---------: | ------------: | -------------: |
| 🧩 流程图数量          |        440 |            80 |             80 |
| 🔄 状态节点            |      5,055 |           902 |          1,262 |
| 🔁 顺序样本            |      9,029 |         1,628 |          2,265 |
| 🔀 决策样本            |      3,676 |           645 |            698 |
| 💬 对话样本            |     12,705 |         2,273 |          2,963 |
| 📏 平均长度            |     277.16 |        270.57 |         326.10 |

*表：PFDial 数据集核心统计数据。*

</div>

## 🛠️ 使用指南

### 1. 数据准备

- 全部原始数据以五元组形式存放于 `PFDial-Raw_Data/`，每条均带有唯一 ID。
- 用于压力测试的困难基准数据位于 `PFDial-H-Raw_Data/`。
- 直接可用的监督微调数据位于 `PFDial-SFT_Data/`。

也可以直接从 Hugging Face 加载 SFT 数据：

```python
from datasets import load_dataset

dataset = load_dataset("qzdc/PFDial")
```

### 2. 监督微调

我们基于 [OpenRLHF](https://github.com/OpenRLHF/OpenRLHF) 提供了参考训练脚本：

```bash
bash SFT_Scrpit/sft.sh
```

请在运行前根据实际情况修改脚本中的模型路径、数据路径与超参数。

### 3. 评测

在 **ID** 与 **OOD** 测试集上评测模型，可复现论文中的结果。建议同时报告**对话级准确率**以及**顺序分支**与**决策分支**上的分项准确率。

## 📊 关键结论

| 配置 | 结果 |
|------|------|
| 7B 模型 + 800 条 SFT 样本 | 对话准确率 > 90% |
| 0.5B 模型 + 全量 SFT 数据 | 对话准确率 > 90% |
| 8B 模型 vs GPT-4o（困难任务） | 最高领先 **+43.88%** |
| 反向跳转 | 仍为最大短板 — 详见论文分析 |

更多实验细节与消融实验请参阅[论文](https://aclanthology.org/2025.findings-acl.134/)。

## 📝 引用

如果本项目对您的研究有帮助，欢迎引用：

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
    pages     = "2626--2649",
    ISBN      = "979-8-89176-256-5"
}
```

## 🔗 相关项目

| 项目 | 说明 | 链接 |
|------|------|------|
| **TransferTOD**（EMNLP 2024） | 可迁移的中文多领域任务型对话系统 | [GitHub](https://github.com/KongLongGeFDU/TransferTOD) |
| **LLMEval-Med**（EMNLP 2025） | 真实临床场景下的医学大模型基准 | [GitHub](https://github.com/llmeval/LLMEval-Med) |
| **LLMEval-Fair**（ACL 2026） | 鲁棒公平的大模型评测，20 万+题 | [GitHub](https://github.com/llmeval/LLMEval-Fair) |

## 📞 联系我们

如有问题或合作意向，请：

- 在 GitHub 上提交 [Issue](https://github.com/KongLongGeFDU/PFDial/issues)
- 联系项目维护者：
  - **张明（Ming Zhang）**：mingzhang23@m.fudan.edu.cn
  - **王宇辉（Yuhui Wang）**：yuhuiwang22@m.fudan.edu.cn

---

<p align="center">
  <b>PFDial</b> | 复旦大学自然语言处理实验室
</p>
