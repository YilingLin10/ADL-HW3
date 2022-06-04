python3.8 accelerate_predict.py    \
  --seed 23 \
  --model_name_or_path ./model \
  --test_file "${1}" \
  --pred_file "${2}"  \
  --output_dir ./model  \
  --learning_rate 1e-3 \
  --per_device_eval_batch_size 8 \
  --num_beams 5