set -x

formats=(

)

model_sizes=(

)

# template=

for model_size in "${model_sizes[@]}"; do
    for format in "${formats[@]}"; do

        model_name=
        DATA=
        OUTPUT_DIR=
        
        rm -rf "${OUTPUT_DIR}"

        read -r -d '' training_commands <<EOF
openrlhf.cli.train_sft \
   --max_len 2048 \
   --dataset  ${DATA} \
   --input_key input \
   --output_key output \
   --train_batch_size 128 \
   --micro_train_batch_size 4 \
   --max_samples 500000 \
   --pretrain ${MODEL} \
   --save_path ${OUTPUT_DIR} \
   --save_steps -1 \
   --logging_steps 1 \
   --eval_steps -1 \
   --zero_stage 2 \
   --max_epochs 5 \
   --bf16 \
   --apply_chat_template \
   --flash_attn \
   --learning_rate 5e-6 \
   --load_checkpoint \
   --gradient_checkpointing
EOF

        if [[ ${1} != "slurm" ]]; then
            deepspeed --module $training_commands
        fi

        echo "Training for model ${model_name} with format ${format} completed."
    done
done
