#!/bin/bash

# 定义根目录
ROOT_DIR="/Users/weston/Projects/WOSAI/FRONTEND/qr-mini-pay-alipay"
WORK_DIR="/Users/weston/Projects/WOSAI/FRONTEND/emenu-mini-core/packages"

# 切换到工作目录
cd "${WORK_DIR}" || { echo "无法进入目录 ${WORK_DIR}"; exit 1; }

# 定义一个函数来复制组件
copy_components() {
    local source_dir=$1
    local dest_dir=$2

    echo "复制 ${source_dir} 到 ${dest_dir} ..."
    cp -rvf "${source_dir}"/* "${dest_dir}/"
}

# 定义源目录和目标目录的数组
source_dirs=(
    "components-store"
    "components-center"
    "components-order"
    "components-home"
)

dest_dirs=(
    "${ROOT_DIR}/GDLPKTFLUN7C/node_modules/@wosai/emenu-mini-components-store"
    "${ROOT_DIR}/KAWNGVMGQZBZ/node_modules/@wosai/emenu-mini-components-center"
    "${ROOT_DIR}/JDLTQXMWBQMW/node_modules/@wosai/emenu-mini-components-order"
    "${ROOT_DIR}/E1QDEFPQUJWB/node_modules/@wosai/emenu-mini-components-home"
)

# 循环遍历数组并调用函数进行复制
for i in "${!source_dirs[@]}"; do
    copy_components "${source_dirs[$i]}" "${dest_dirs[$i]}"
done

echo "所有组件复制完成！"
