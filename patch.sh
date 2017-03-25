ROOT="${PWD}"
OMSREPOSITORIES=(
    'build'
    'frameworks/base'
    'frameworks/native'
    'packages/apps/Contacts'
    'packages/apps/ContactsCommon'
    'packages/apps/Dialer'
    'packages/apps/ExactCalculator'
    'packages/apps/PackageInstaller'
    'packages/apps/PhoneCommon'
    'packages/apps/Settings'
    'system/core'
    'system/sepolicy'
    'vendor/cm'
)

ANGLERREPOSITORIES=(
    'kernel/huawei/angler'
)

for omsrepository in "${OMSREPOSITORIES[@]}"; do
    cd "${ROOT}/${omsrepository}"
    git am --whitespace=nowarn --keep-cr "${ROOT}/vendor/extra/oms-patches/${omsrepository}"/*
    cd "${ROOT}"
done

for anglerrepository in "${ANGLERREPOSITORIES[@]}"; do
    cd "${ROOT}/${anglerrepository}"
    git am --whitespace=nowarn --keep-cr "${ROOT}/vendor/extra/angler-patches/${anglerrepository}"/*
    cd "${ROOT}"
done

