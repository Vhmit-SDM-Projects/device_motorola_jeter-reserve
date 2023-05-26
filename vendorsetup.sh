# Clone/Fetch Upstream Device Dependencies

echo "cloning vendor blobs"
git clone https://github.com/Vhmit/vendor_motorola_jeter -b 13 vendor/motorola/jeter
echo ""

# Kernel
echo "cloning kernel"
git clone https://github.com/Vhmit/kernel_motorola_aljeter -b 4.9-13 kernel/motorola/jeter
echo ""

# Dependencies
echo "cloning dependencies"
git clone -b lineage-20 https://github.com/LineageOS/android_system_qcom system/qcom
git clone -b lineage-20 https://github.com/LineageOS/android_hardware_motorola hardware/motorola
git clone -b lineage-20 https://github.com/LineageOS/android_external_bson external/bson
echo ""

# DtbTools lineage
echo "cloning dtbTools lineage"
mkdir -p out/host/linux-x86/bin
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
