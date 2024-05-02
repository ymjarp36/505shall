#!/bin/bash

# 사용자 데이터를 직접 스크립트 내에 포함
declare -A users=(
    ["boser"]="kt,1000"
    ["edgar"]="skt,1001"
    ["vincent"]="lgt,1002"
    ["tajer"]="lgt,1002"
    ["haper"]="kt,1000"
    ["janela"]="kt,1000"
    ["eille"]="lgt,1002"
    ["harper"]="skt,1001"
    ["edwin"]="lgt,1002"
    ["dewey"]="lgt,1002"
    ["devan"]="skt,1001"
    ["caley"]="kt,1000"
    ["kori"]="skt,1001"
    ["qadani"]="lgt,1002"
    ["willy"]="lgt,1002"
    ["qimat"]="kt,1000"
    ["dexter"]="lgt,1002"
    ["linda"]="kt,1000"
    ["dana"]="skt,1001"
    ["jasmin"]="lgt,1002"
    ["genevi"]="skt,1001"
    ["timber"]="kt,1000"
    ["adel"]="kt,1000"
    ["robert"]="lgt,1002"
    ["xandra"]="skt,1001"
    ["dante"]="skt,1001"
    ["julia"]="kt,1000"
    ["ximena"]="skt,1001"
    ["tania"]="lgt,1002"
    ["miller"]="kt,1000"
    ["ringo"]="kt,1000"
    ["lavina"]="skt,1001"
    ["sabrina"]="kt,1000"
    ["yummer"]="lgt,1002"
    ["vister"]="skt,1001"
    ["dale"]="kt,1000"
    ["damber"]="lgt,1002"
    ["snower"]="skt,1001"
    ["david"]="skt,1001"
    ["shiniper"]="skt,1001"
    ["ouker"]="kt,1000"
    ["surer"]="kt,1000"
    ["nower"]="skt,1001"
    ["davido"]="kt,1000"
    ["owner"]="lgt,1002"
    ["kimber"]="skt,1001"
    ["choser"]="kt,1000"
    ["kelly"]="kt,1000"
    ["yester"]="kt,1000"
    ["siniker"]="lgt,1002"
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
