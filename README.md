# ADL22-HW3
Dataset & evaluation script for ADL 2022 homework 3
https://www.csie.ntu.edu.tw/~miulab/s110-adl/doc/A3_NLG.pdf

## Dataset
[download link](https://drive.google.com/file/d/186ejZVADY16RBfVjzcMcz9bal9L3inXC/view?usp=sharing)

## Installation
```
git clone https://github.com/moooooser999/ADL22-HW3.git
cd ADL22-HW3
pip install -e tw_rouge
```


## Usage
### Use the Script
```
usage: eval.py [-h] [-r REFERENCE] [-s SUBMISSION]

optional arguments:
  -h, --help            show this help message and exit
  -r REFERENCE, --reference REFERENCE
  -s SUBMISSION, --submission SUBMISSION
```

Example:
```
python eval.py -r public.jsonl -s submission.jsonl
{
  "rouge-1": {
    "f": 0.21999419163162043,
    "p": 0.2446195813913345,
    "r": 0.2137398792982201
  },
  "rouge-2": {
    "f": 0.0847583291303246,
    "p": 0.09419044877345074,
    "r": 0.08287844474014894
  },
  "rouge-l": {
    "f": 0.21017939117006337,
    "p": 0.25157090570020846,
    "r": 0.19404349000921203
  }
}
```


### Use Python Library
```
>>> from tw_rouge import get_rouge
>>> get_rouge('我是人', '我是一個人')
{'rouge-1': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}, 'rouge-2': {'f': 0.33333332888888895, 'p': 0.5, 'r': 0.25}, 'rouge-l': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}}
>>> get_rouge(['我是人'], [ 我是一個人'])
{'rouge-1': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}, 'rouge-2': {'f': 0.33333332888888895, 'p': 0.5, 'r': 0.25}, 'rouge-l': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}}
>>> get_rouge(['我是人'], ['我是一個人'], avg=False)
[{'rouge-1': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}, 'rouge-2': {'f': 0.33333332888888895, 'p': 0.5, 'r': 0.25}, 'rouge-l': {'f': 0.7499999953125, 'p': 1.0, 'r': 0.6}}]
```


## Reference
[cccntu/tw_rouge](https://github.com/cccntu/tw_rouge)

## Environment Setup (Python 3.8)
```
pip install -r requirements.txt
```
```
python -m pip install setuptools==59.5.0
```
### Install fixed version transformers library
```
git clone https://github.com/huggingface/transformers.git
git checkout t5-fp16-no-nans
pip install -e .

```
## Training 
* /PATH/TO/TRAIN_FILE: path to your train file
* /PATH/TO/OUTPUT_DIR: path to your output directory
```
CUDA_VISIBLE_DEVICES=0 accelerate launch --config_file accelerator_config.yaml accelerate_title.py    \
  --seed 23 \
  --model_name_or_path google/mt5-small \
  --train_file /PATH/TO/TRAIN_FILE \
  --output_dir /PATH/TO/OUTPUT_DIR  \
  --learning_rate 1e-3 \
  --num_train_epochs 4 \
  --per_device_eval_batch_size 8 \
  --per_device_train_batch_size 8 \
  --gradient_accumulation_steps 2 \
  --num_beams 5 \
  --checkpointing_steps 600  \
  --eval_steps 600
```
