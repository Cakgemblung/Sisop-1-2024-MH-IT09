#!/bin/bash

timestamp=$(date +"%Y%m%d%H")
logfiles="/home/azrael/log/metrics_agg_${timestamp}.log"

declare -A min_values
declare -A max_values
declare -A total_values

metrics=("mem_total" "mem_used" "mem_free" "mem_shared" "mem_buff" "mem_available" "swap_total" "swap_used" "swap_free")

for metric in "${metrics[@]}"; do
    min_values["$metric"]=99999999
    max_values["$metric"]=0
    total_values["$metric"]=0
done

count=0
path="/home/azrael"
path_size="6.2G"

for logfile in /home/azrael/log/metrics_*.log; do
    while IFS=',' read -r mem_total mem_used mem_free mem_shared mem_buff mem_available swap_total swap_used swap_free _ _; do
        ((count++))

        for i in "${!metrics[@]}"; do
            metric=${metrics[$i]}
            value=${!metric}

            ((value < min_values["$metric"])) && min_values["$metric"]=$value
            ((value > max_values["$metric"])) && max_values["$metric"]=$value

            total_values["$metric"]=$((total_values["$metric"] + value))
        done
    done < "$logfile"
done

echo -e "type,mem_total,mem_used,mem_free,mem_shared,mem_buff,mem_available,swap_total,swap_used,swap_free,path,path_size" > "$logfiles"
echo -n "minimum," >> "$logfiles"
for metric in "${metrics[@]}"; do
    echo -n "${min_values["$metric"]}," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"

echo -n "maximum," >> "$logfiles"
for metric in "${metrics[@]}"; do
    echo -n "${max_values["$metric"]}," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"

echo -n "average," >> "$logfiles"
for metric in "${metrics[@]}"; do
    avg_value=$((total_values["$metric"] / count))
    echo -n "$avg_value," >> "$logfiles"
done
echo "$path,$path_size" >> "$logfiles"

#0 * * * * /home/azrael/soal_4/aggregate_minutes_to_hourly_log.sh
chmod 600 "$logfiles"
