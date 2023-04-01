# Clone/Fetch Upstream Device Dependencies

echo "cloning vendor blobs"
git clone https://github.com/Vhmit/vendor_motorola_jeter -b thirteen-new-tree vendor/motorola/jeter
echo ""

# Kernel
echo "cloning kernel"
git clone https://github.com/Vhmit/kernel_motorola_jeter -b thirteen kernel/motorola/jeter
echo ""

# Dependencies
echo "cloning dependencies"
git clone -b lineage-18.1 https://github.com/LineageOS/android_external_sony_boringssl-compat external/sony/boringssl-compat
git clone -b lineage-20 https://github.com/LineageOS/android_system_qcom system/qcom
git clone -b lineage-20 https://github.com/LineageOS/android_hardware_motorola hardware/motorola
echo ""

# DtbTools lineage
echo "cloning dtbTools lineage"
mkdir out/
mkdir out/host/
mkdir out/host/linux-x86/
mkdir out/host/linux-x86/bin
cd out/host/linux-x86/bin
wget -c https://github.com/krasCGQ/scripts/raw/master/prebuilts/bin/dtbToolLineage
chmod +777 dtbToolLineage
cd ../../../..
echo ""

# HAL's
echo "Cloning Hals"
rm -rf hardware/qcom-caf/msm8996/audio
git clone https://github.com/LineageOS/android_hardware_qcom_audio -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/audio
rm -rf hardware/qcom-caf/msm8996/media
git clone https://github.com/LineageOS/android_hardware_qcom_media -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/media
rm -rf hardware/qcom-caf/msm8996/display
git clone https://github.com/LineageOS/android_hardware_qcom_display -b lineage-20.0-caf-msm8996 hardware/qcom-caf/msm8996/display
echo ""

# Framework
echo "pick framework apps"
cd frameworks/base
git fetch https://github.com/rd-stuffs/android_frameworks_base topaz
git cherry-pick 5be0190fb074b1c63b1c2004259183e1e0521d8c
cd ../..
echo ""
