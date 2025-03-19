#!/bin/bash

# 사용자 데이터를 직접 스크립트 내에 포함
declare -A users=(
    ["marcus"]="kt,1000"
    ["quincey"]="skt,1001"
    ["sanato"]="lgt,1002"
    ["rosalie"]="lgt,1002"
    ["heiley"]="kt,1000"
    ["winnie"]="kt,1000"
    ["tessa"]="lgt,1002"
    ["serena"]="skt,1001"
    ["beker"]="lgt,1002"
    ["keira"]="lgt,1002"
    ["willow"]="skt,1001"
    ["dexter"]="kt,1000"
    ["yeriel"]="lgt,1002"
    ["yummer"]="skt,1001"
    ["scott"]="lgt,1002"
    ["vister"]="skt,1001"
    ["dale"]="skt,1001"
    ["roseball"]="lgt,1002"
    ["robin"]="kt,1000"
    ["siniker"]="skt,1001"
    ["harvey"]="kt,1000"
    ["lilian"]="skt,1001"
    ["xayden"]="skt,1001"
    ["spring"]="skt,1001"
    ["jolie"]="kt,1000"
    ["xavier"]="kt,1000"
    ["simber"]="skt,1001"
    ["bennett"]="kt,1000"
    ["wren"]="skt,1001"
    ["woodrow"]="kt,1000"
)

# 각 사용자에 대해 처리
for username in "${!users[@]}"; do
    groupname=$(echo "${users[$username]}" | cut -d ',' -f 1)
    groupid=$(echo "${users[$username]}" | cut -d ',' -f 2)

    # 그룹 존재 여부 확인, 없으면 생성
    if ! getent group "$groupname" >/dev/null; then
        sudo groupadd -g "$groupid" "$groupname"
    fi

    # 사용자 존재 여부 확인, 없으면 생성 및 그룹에 추가
    if ! id "$username" >/dev/null 2>&1; then
        sudo useradd -m -g "$groupname" -s /bin/bash "$username"
    else
        echo "User $username already exists."
    fi
done
