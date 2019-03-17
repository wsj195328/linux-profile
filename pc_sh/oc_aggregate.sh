# 取得项目名字（get project name）
FMK_NAME=${PROJECT_NAME}

# 取得生成的静态库文件路径  （get framework path）
INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework

# 设置真机和模拟器生成的静态库路径 （set devcie framework and simulator framework path）
WRK_DIR=build
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework

# 模拟器和真机编译 （device and simulator build）
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build

# 删除临时文件 （delete temp file）
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"

# 拷贝真机framework文件到生成路径下 （copy device file to product path）
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"

# 合并生成，替换真机framework里面的二进制文件，并且打开 （merger and open）
lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
echo "${DEVICE_DIR}/${FMK_NAME}"
echo "${SIMULATOR_DIR}/${FMK_NAME}" 

rm -rf "${WRK_DIR}"
open "${INSTALL_DIR}"
