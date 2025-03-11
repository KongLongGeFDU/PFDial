# PFDial
The code repository of paper "PFDial: A Structured Dialogue Instruction Fine-tuning Method Based on UML Flowcharts"

Paper Link:https://arxiv.org/abs/2503.06706v1

## Guide
The raw data is stored in the `/PFDial-Raw_Data` folder in the form of quintuples with IDs. Folder `PFDial-H-Raw_Data` contains the raw data for hard-bench dataset.

We provide training data in `/PFDial-SFT_Data` and training scripts using openRLHF in `/PFDial-Raw_Data` for reference.

## Dataset Info
Below is the detailed statistics of the PFDial dataset.
<div align="center">

| **Statistics**        | **Train** | **ID Test** | **OOD Test** |
|-----------------------|---------:|------------:|-------------:|
| Flowcharts           |      440 |          80 |          80  |
| State Nodes         |     5055 |         902 |        1262  |
| Sequential Samples  |     9029 |        1628 |        2265  |
| Decision Samples    |     3676 |         645 |         698  |
| Dialogue Samples    |    12705 |        2273 |        2963  |
| Avg. Length        |   277.16 |      270.57 |      326.10  |

*Table: Statistics of the PFDial Dataset*

</div>

## Citation
If you find this project useful in your research, please cite:
```
@misc{zhang2025pfdialstructureddialogueinstruction,
      title={PFDial: A Structured Dialogue Instruction Fine-tuning Method Based on UML Flowcharts}, 
      author={Ming Zhang and Yuhui Wang and Yujiong Shen and Tingyi Yang and Changhao Jiang and Yilong Wu and Shihan Dou and Qinhao Chen and Zhiheng Xi and Zhihao Zhang and Yi Dong and Zhen Wang and Zhihui Fei and Mingyang Wan and Tao Liang and Guojun Ma and Qi Zhang and Tao Gui and Xuanjing Huang},
      year={2025},
      eprint={2503.06706},
      archivePrefix={arXiv},
      primaryClass={cs.CL},
      url={https://arxiv.org/abs/2503.06706}, 
}

```
