if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/backbone" ]; then
    mkdir ./logs/backbone
fi

itr=1
seq_len=336
data=PeMSD8
model_name=Crossformer
learning_rate=0.001

for pred_len in 24 48 96 192 336 720
do
  python -u run_longExp.py \
    --dataset $data --model $model_name --seq_len $seq_len --pred_len $pred_len \
    --learning_rate $learning_rate > logs/backbone/$model_name'_'$data'_'$pred_len'_lr'$learning_rate.log 2>&1
done